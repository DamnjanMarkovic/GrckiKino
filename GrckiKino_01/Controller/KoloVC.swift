//
//  RezultatiIzvlacenja.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 28.1.21..
//

import UIKit

class KoloVC: UIViewController {

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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Kolo"
        navigationController?.navigationBar.isHidden = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(vratiNekoDrugoKolo))
        setUI();
        unosBrojaKola()
        

    }
    
    func setUI() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(KoloVCCell.self, forCellWithReuseIdentifier: cellKolo)
        collectionView.backgroundColor = UIColor.darkGray
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView ?? UICollectionView())
    }
    
    @objc func vratiNekoDrugoKolo() {
            unosBrojaKola()

    }
    
    func unosBrojaKola() {
        showInputDialog(title: "Add number",
                        subtitle: "Please enter the new number below.",
                        actionTitle: "Add",
                        cancelTitle: "Cancel",
                        inputPlaceholder: "New number",
                        inputKeyboardType: .numberPad, actionHandler:
                            { (input:String?) in
                                
                                if let myNumber = NumberFormatter().number(from: input ?? "0") {
                                    self.brojKola = myNumber.intValue
                                    self.vratiRealizovanoKolo {
                                        self.collectionView.reloadData()
                                    }
                                    
                                  } else {
                                    
                                  }
                            })
    }

    
    func vratiRealizovanoKolo(completed: @escaping () -> ()) {
//        let brojKola = "856666"
        let url = URL (string: "\(Constants.apiRealizovanoKolo)/\(brojKola ?? 85666)/")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let _: Void = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                do {
                    let koloPoIDjuStiglo = try JSONDecoder().decode(ZavrsenoKolo.self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                        self.koloPoIDju = koloPoIDjuStiglo
                        self.listaIzabranihBrojeva = koloPoIDjuStiglo.winningNumbers.list
                        print("sve ok")


                    }
                }catch{
                    print("Json error")
                }
            }
        }.resume()
    }
    

    


}

extension KoloVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellKolo, for: indexPath as IndexPath) as! KoloVCCell
        cell.setup(with: listaIzabranihBrojeva[indexPath.row])
        cell.backgroundColor = .blue
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaIzabranihBrojeva.count
    }
    



}
extension KoloVC: UICollectionViewDelegate {

}


extension KoloVC: UICollectionViewDelegateFlowLayout {
    
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


private enum LayoutConstant {
    static let spacing: CGFloat = 3
    static let itemHeight: CGFloat = 210.0
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


