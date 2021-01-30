//
//  RezultatiIzvlacenja.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 28.1.21..
//

extension KoloPoID_u: KoloPoID_uDownloadingingDelegate {
    
    func vratikoloPoID_uPrekoProtokola(_ koloDownloading: KoloPoID_uDownloading, koloPoIDju: ZavrsenoKolo, listaIzabranihBrojeva: [Int]) {
        DispatchQueue.main.async {
            self.koloPoIDju = koloPoIDju
            self.listaIzabranihBrojeva = listaIzabranihBrojeva
        }
    }
   
}



import UIKit

class KoloPoID_u: UIViewController {

    private let cellKolo = "cellRezultat"
    private let headerKolo = "headerRezultat"

    var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .darkGray
        return collectionView
    }()
    
    var koloPoIDju: ZavrsenoKolo!
    var brojKola: Int!
    var listaIzabranihBrojeva = [Int]()
    var delegat = KoloPoID_uDownloading()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Kolo"
        navigationController?.navigationBar.isHidden = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.message")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(vratiNekoDrugoKolo))
        delegat.delegate = self
        unosBrojaKola()

    }
    
    func setUI() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(KoloPoID_uCell.self, forCellWithReuseIdentifier: cellKolo)
        collectionView.register(KoloPoID_uHeader.self, forSupplementaryViewOfKind:
                                    UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerKolo)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    @objc func vratiNekoDrugoKolo() {
            unosBrojaKola()

    }
    
    func unosBrojaKola() {
        showInputDialog(title: "Unesite broj kola",
                        subtitle: "(na primer: 856666)",
                        actionTitle: "Unesi",
                        cancelTitle: "Odustani",
                        inputPlaceholder: "broj kola",
                        inputKeyboardType: .numberPad, actionHandler:
                            { [weak self] (input:String?) in
                                
                                if let myNumber = NumberFormatter().number(from: input ?? "0") {
                                    self?.brojKola = myNumber.intValue
                                    self?.vratiKoloPoID_u()

                                  } else {
                                    let ac = UIAlertController(title: "Morate uneti pozitivan, ceo broj.", message: nil, preferredStyle: .alert)
                                    ac.addAction(UIAlertAction(title: "Dobro, smaracu!", style: .default, handler: nil))
                                    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                                    self?.present(ac, animated: true)
                                  }
                            })
    }
    
    
    func vratiKoloPoID_u() {
        delegat.vratiKoloPoID_u(brojKola: brojKola) { success in
            if success {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    self.setUI()
                }
            }
        }
    }

}

extension KoloPoID_u: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellKolo, for: indexPath as IndexPath) as! KoloPoID_uCell
        cell.setup(with: listaIzabranihBrojeva[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaIzabranihBrojeva.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind:
        String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:
                                                                        headerKolo, for: indexPath) as! KoloPoID_uHeader
        
        header.headerLabela.text = "Kolo broj: \(koloPoIDju.drawId) od \(TimeFunctions.vratiVremeUMinutima(timeAsTimestamp: koloPoIDju.drawTime)) dana \(TimeFunctions.vratiDan(timeAsTimestamp: koloPoIDju.drawTime)). "

            return header
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidthHeight = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)
        
        return CGSize(width: cellWidthHeight, height: cellWidthHeight)
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 5
        
        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow
        
        return floor(finalWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
}


extension UIViewController {
    func showInputDialog(title:String? = nil,
                         subtitle:String? = nil,
                         actionTitle:String? = "Add",
                         cancelTitle:String? = "Cancel",
                         inputPlaceholder:String? = nil,
                         inputKeyboardType:UIKeyboardType = UIKeyboardType.default,
                         cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil,
                         actionHandler: ((_ text: String?) -> Void)? = nil) {

        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = inputPlaceholder
            textField.keyboardType = inputKeyboardType
        }
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (action:UIAlertAction) in
            guard let textField =  alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            actionHandler?(textField.text)
        }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))

        self.present(alert, animated: true, completion: nil)
    }
}


