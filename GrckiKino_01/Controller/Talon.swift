//
//  Talon.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 28.1.21..
//

import UIKit

class Talon: UIViewController {

    var koloKliknuto: Kolo!
    let collectionCellIdentifier = "collectionCellIdentifier"
    var listaSvihBrojeva = [Int]()
    var listaIzabranihBrojeva = [Int]()
    var listaSlucajnihBrojeva = [Int]()
    
    var ukupnoIzabranoBrojeva = 0 {
        didSet {
            ukupnoIzabranoBrojevaLabela.text = "Ukupno izabrano: \(ukupnoIzabranoBrojeva) brojeva."
        }
    }
    
    var podaciOIzabranomKolu: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.frame = CGRect(x: 0, y: 10, width: 100, height: 150)
        label.backgroundColor = .orange
        label.numberOfLines = 0
        label.layer.backgroundColor = UIColor.clear.cgColor
        return label
    }()
    
    var ukupnoIzabranoBrojevaLabela: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.frame = CGRect(x: 0, y: 10, width: 100, height: 150)
        label.backgroundColor = .red
        label.numberOfLines = 0
        label.layer.backgroundColor = UIColor.clear.cgColor
        return label
    }()
    
    let slucajniBrojevi: UIButton = {
        
        
        let image = UIImage(systemName: "increase.quotelevel") as UIImage?
        let button   = UIButton(type: UIButton.ButtonType.custom) as UIButton
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
//        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(izaberiSlucajneBrojeve), for: .touchUpInside)
        button.setTitle("RANDOM", for: .normal)

        
//        button.addTarget(self, action: "btnTouched:", forControlEvents:.TouchUpInside)
//        self.view.addSubview(button)
//        
//        
//        let icon = UIImage(systemName: "increase.quotelevel")!.withRenderingMode(.alwaysOriginal)
//        let iconSize = CGRect(origin: CGPoint(x: 0, y: 0), size: icon.size)
//        button = UIButton(frame: iconSize)
//        iconButton.setBackgroundImage(icon, for: .normal)
//        iconButton.addTarget(self, action: #selector(izaberiSlucajneBrojeve), for: .touchUpInside)
//        button.customView = iconButton
//        
//        
//        
//        let button = UIButton(type: .system)
//        button.siz
//        button.setTitle("Slucajni brojevi", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = UIColor.blue
//        button.addTarget(self, action: #selector(izaberiSlucajneBrojeve), for: .touchUpInside)
//        button.layer.cornerRadius = 3
        return button
    }()
    
    private let kvote: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .green
        return view
    }()
    

    
    
    var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .darkGray
        return collectionView
    }()
    
    private let mainview: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .gray
        return view
    }()
    
    private var brojevi: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .yellow
        return view
    }()
    
    private let ostaleLabele: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .red
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Izaberi i posalji brojeve!"
        view.backgroundColor = .darkGray
        navigationController?.navigationBar.isHidden = false
        koloKliknuto = DatabaseManager.shared.koloKliknuto
        postaviUI()
        postaviInformacije()

        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .close, target: self, action: #selector(vratiSe))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(posaljiIzabraneBrojeve))
    }
    
    @objc func vratiSe() {

        self.dismiss(animated: true)
    }

    @objc func posaljiIzabraneBrojeve() {


    }
    
    
    func postaviUI() {
        postaviBrojeve()
        view.addSubview(brojevi)
        let heightBrojevi = collectionView.collectionViewLayout.collectionViewContentSize.height + 20;
        brojevi.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: heightBrojevi)
        
        view.addSubview(podaciOIzabranomKolu)
        podaciOIzabranomKolu.anchor(top: brojevi.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        
        view.addSubview(kvote)
        kvote.anchor(top: podaciOIzabranomKolu.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        
        
        let stackSlucajniBrojeviIIzvuceniBrojevi = UIStackView(arrangedSubviews: [
            slucajniBrojevi,
            ukupnoIzabranoBrojevaLabela
            ]
        )
        stackSlucajniBrojeviIIzvuceniBrojevi.axis = .horizontal
        stackSlucajniBrojeviIIzvuceniBrojevi.spacing = 10
        stackSlucajniBrojeviIIzvuceniBrojevi.distribution = .fillProportionally
          
        view.addSubview(stackSlucajniBrojeviIIzvuceniBrojevi)
        
        stackSlucajniBrojeviIIzvuceniBrojevi.anchor(top: kvote.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
      
        
        

    }
    
    
    func postaviInformacije() {
        

//        podaciOIzabranomKolu.text = "Vreme izvlacenja: \(TimeFunctions.vratiVremeUMinutima(timeAsTimestamp: koloKliknuto.drawTime)) | Kolo: \(koloKliknuto.drawId)"
//
//        ukupnoIzabranoBrojevaLabela.text = "Ukupno izabrano: \(ukupnoIzabranoBrojeva) brojeva."
    }
    
    func postaviBrojeve() {
        ubaciBrojeveUListu()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TalonCell.self, forCellWithReuseIdentifier: collectionCellIdentifier)
        collectionView.backgroundColor = UIColor.darkGray
        collectionView.dataSource = self
        collectionView.delegate = self
        brojevi.addSubview(collectionView)
    }
    
    func postaviOstaleLabele() {
        
        podaciOIzabranomKolu.frame = CGRect(x: 0, y: brojevi.height, width: mainview.width, height: 100)
        view.addSubview(podaciOIzabranomKolu)
    }
    
    
    
    
    
    
    
    
    
    @objc func izaberiSlucajneBrojeve() {
        
        let ac = UIAlertController(title: "Da izaberem slucajne brojeve???", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "DA!", style: .default, handler: izaberiIPostaviSlucajneBrojeve))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(ac, animated: true)
    }
    
    @objc func izaberiIPostaviSlucajneBrojeve(_ sender: UIAlertAction) {
        for i in 0..<80 {
            let indexPath = IndexPath(row: i, section: 0)
            let cell:TalonCell = collectionView.cellForItem(at: indexPath)! as! TalonCell
            cell.broj.layer.borderColor = Constants.borderColorOriginalTalonCell
        }
        listaIzabranihBrojeva.removeAll()
        listaSlucajnihBrojeva.removeAll()
        let sequence = 1 ..< 80
        let shuffledSequence = sequence.shuffled()
        for i in 0..<15 {
            listaSlucajnihBrojeva.append(shuffledSequence[i])
        }
        
        for item in listaSlucajnihBrojeva {
            listaIzabranihBrojeva.append(item)
        }
        
        ukupnoIzabranoBrojeva = listaIzabranihBrojeva.count
        
        for item in listaSlucajnihBrojeva {
            let indexPath = IndexPath(row: item, section: 0)
            let cell:TalonCell = collectionView.cellForItem(at: indexPath)! as! TalonCell
            cell.broj.layer.borderColor = UIColor.green.cgColor
        }
    }
    
    
    
    
    func ubaciBrojeveUListu() {
        for i in 1..<81 {
            listaSvihBrojeva.append(i)
        }
    }
    
    func brojJeVecKliknut(brojKliknut: Int) -> Bool {
        if listaIzabranihBrojeva.contains(brojKliknut) {
                return true
        }
        return false
    }
    
    
    func procesuirajKliknutiBroj(brojKliknut: Int) {
        
        if (brojJeVecKliknut(brojKliknut: brojKliknut)){
            if let index = listaIzabranihBrojeva.firstIndex(of: brojKliknut) {
                listaIzabranihBrojeva.remove(at: index)
                ukupnoIzabranoBrojeva -= 1
            }
        }
        else {
            if listaIzabranihBrojeva.count < 15 {
                listaIzabranihBrojeva.append(brojKliknut)
                ukupnoIzabranoBrojeva += 1
            }
            else {
                let alert = AlertInfo.alert(message: "Maksimalni broj brojeva je 15.")
                self.present(alert, animated: true)
            }
        }
    }
}




extension Talon: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath as IndexPath) as! TalonCell
        cell.setup(with: listaSvihBrojeva[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaSvihBrojeva.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell:TalonCell = collectionView.cellForItem(at: indexPath)! as! TalonCell
        
        procesuirajKliknutiBroj(brojKliknut: indexPath.row+1)
        
        if brojJeVecKliknut(brojKliknut: indexPath.row+1) {
            selectedCell.broj.layer.borderColor = UIColor.green.cgColor
        }
        else {
            selectedCell.broj.layer.borderColor = Constants.borderColorOriginalTalonCell
        }
        
        
    }


}
extension Talon: UICollectionViewDelegate {

}


extension Talon: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidthHeight = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)
        
        return CGSize(width: cellWidthHeight, height: cellWidthHeight)
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 10
        
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


