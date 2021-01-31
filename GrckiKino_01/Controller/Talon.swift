//
//  Talon.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 28.1.21..
//

import UIKit

class Talon: UIViewController {

    var koloKliknuto: NarednoKolo!
    let collectionCellIdentifier = "collectionCellIdentifier"
    var listaSvihBrojeva = [Int]()
    var listaIzabranihBrojeva = [Int]()
    var listaSlucajnihBrojeva = [Int]()
    var listaIzabranihBrojevaZaSlanje = String()
    
    var ukupnoIzabranoBrojeva = 0 {
        didSet {
            ukupnoIzabranoBrojevaLabela.text =  "Izabrano brojeva: \n\(ukupnoIzabranoBrojeva)"
        }
    }
    
    //MARK: - UI Postavke, elementi
    
    
    var podaciOIzabranomKolu: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = .darkGray
        label.numberOfLines = 0
        label.layer.backgroundColor = UIColor.clear.cgColor
        return label
    }()
    
    var ukupnoIzabranoBrojevaLabela: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .darkGray
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = 14
        label.layer.backgroundColor = UIColor.clear.cgColor
        return label
    }()
    
    let slucajniBrojevi: UIButton = {
        
        let image = UIImage(systemName: "increase.quotelevel") as UIImage?
        let button   = UIButton(type: UIButton.ButtonType.custom) as UIButton
        button.addTarget(self, action: #selector(izaberiSlucajneBrojeve), for: .touchUpInside)
        button.setTitle("RANDOM BROJEVI", for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 14
        return button
    }()
    
    private let kvote: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .darkGray
        return view
    }()
    
    
    var kvoteBK: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = Constants.fontKvote
        label.text = "B.K"
        label.numberOfLines = 0
        return label
    }()
    var kvoteKvota: UILabel = {
        let label = UILabel(frame: .zero)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.text = "Kvota"
        label.font = Constants.fontKvote
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvote1: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = Constants.fontKvote
        label.text = "1"
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvote2: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = Constants.fontKvote
        label.adjustsFontSizeToFitWidth = true
        label.text = "2"
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvote3: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = Constants.fontKvote
        label.text = "3"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvote4: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = Constants.fontKvote
        label.adjustsFontSizeToFitWidth = true
        label.text = "4"
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvote5: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = Constants.fontKvote
        label.adjustsFontSizeToFitWidth = true
        label.text = "5"
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvote6: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = Constants.fontKvote
        label.adjustsFontSizeToFitWidth = true
        label.text = "6"
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvote7: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = Constants.fontKvote
        label.text = "7"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvote3_75: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.text = "3.75"
        label.adjustsFontSizeToFitWidth = true
        label.font = Constants.fontKvote
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvote14: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.text = "14"
        label.font = Constants.fontKvote
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvote65: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.text = "65"
        label.adjustsFontSizeToFitWidth = true
        label.font = Constants.fontKvote
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvote275: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.text = "275"
        label.font = Constants.fontKvote
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvote1350: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.text = "1350"
        label.font = Constants.fontKvote
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvote6500: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.text = "6500"
        label.textColor = .white
        label.font = Constants.fontKvote
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        return label
    }()
    var kvote25000: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.text = "25000"
        label.font = Constants.fontKvote
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    var kvotelinija: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.backgroundColor = .lightGray
        label.numberOfLines = 0
        return label
    }()

    
    var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .darkGray
        return collectionView
    }()
    
    
    private var brojevi: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .yellow
        return view
    }()
    
    
    //MARK: -- Funkcije
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Izaberi i posalji brojeve!"
        view.backgroundColor = .darkGray
        navigationController?.navigationBar.isHidden = false
        koloKliknuto = Singletone.Instanca.koloKliknuto
        postaviUI()
        postaviInformacije()

        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .close, target: self, action: #selector(vratiSeNazad))
        guard let slikaBarButton =  UIImage(systemName: "iphone.radiowaves.left.and.right") else { return }
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: slikaBarButton.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(posaljiIzabraneBrojeve))
    }
    
    ///funkcija koja vraca na prethodni, glavni meni
    
    @objc func vratiSeNazad() {

        self.dismiss(animated: true)
    }

    ///funkcija koja vrsi pripremu za slanje brojeva :)
    
    
    @objc func posaljiIzabraneBrojeve() {
        var symbolEnding = ", "
        
        let sortedList = listaIzabranihBrojeva.sorted()
        for (idx, item) in sortedList.enumerated() {
            if idx == listaIzabranihBrojeva.endIndex-1 {
                symbolEnding = "."
            }
            listaIzabranihBrojevaZaSlanje.append("\(item)\(symbolEnding)")
        }
        
        let ac = UIAlertController(title: "Salju se brojevi: \n\(listaIzabranihBrojevaZaSlanje)", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Salji!", style: .default, handler: nil))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        listaIzabranihBrojevaZaSlanje = ""
        self.present(ac, animated: true)

    }
    
    
    ///funkcija koja obezbedjuje postavljanje informacija, koriscenjem did-Set property-observera
    
    func postaviInformacije() {

        podaciOIzabranomKolu.text = "Vreme izvlacenja: \(TimeFunctions.vratiVremeUMinutima(timeAsTimestamp: koloKliknuto.drawTime)) | Kolo: \(koloKliknuto.drawId)"

        ukupnoIzabranoBrojevaLabela.text = "Izabrano brojeva: \n\(ukupnoIzabranoBrojeva)"
    }
    
    
    ///funkcija koja obezbedjuje unos brojeva u listu, a nakon toga kreiranje Collection-view-a koji ce biti "napunjen" brojevima iz liste
    
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
    
    ///funkcija koja vodi na izbor slucajnih brojeva
    
    @objc func izaberiSlucajneBrojeve() {
        
        let ac = UIAlertController(title: "Da izaberem slucajne brojeve???", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "DA!", style: .default, handler: izaberiIPostaviSlucajneBrojeve))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(ac, animated: true)
    }
    
    ///Izbor slucajnih brojeva, imajuci u vidu da se, ako se ponovo pokrene akcija, prethodni brojevi  izbrisu
    
    @objc func izaberiIPostaviSlucajneBrojeve(_ sender: UIAlertAction) {
        for i in 0..<80 {
            
            let indexPath = IndexPath(row: i, section: 0)
            let cell:TalonCell = collectionView.cellForItem(at: indexPath)! as! TalonCell
            cell.broj.layer.borderColor = Constants.borderColorOriginalTalonCell
        }
        listaIzabranihBrojeva.removeAll()
        listaSlucajnihBrojeva.removeAll()
        
        ///slucajni brojevi ce se birati tako sto ce se brojevi promesati i uzeti prvih 15 brojeva
        
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
            let indexPath = IndexPath(row: item-1, section: 0)
            let cell:TalonCell = collectionView.cellForItem(at: indexPath)! as! TalonCell
            cell.broj.layer.borderColor = UIColor.green.cgColor
        }
    }
    
    
    ///Ubacivanje brojeva u listu
    
    func ubaciBrojeveUListu() {
        for i in 1..<81 {
            listaSvihBrojeva.append(i)
        }
    }
    
    ///Provera da li je broj vec kliknut
    
    func brojJeVecKliknut(brojKliknut: Int) -> Bool {
        if listaIzabranihBrojeva.contains(brojKliknut) {
                return true
        }
        return false
    }
    
    
    ///po izboru broja, vrsi se provera da li je taj broj vec u listi i dodaje se, ako nije, a sklanja, ako jeste. to vodi i ka zaokruzivanju i otkruzivanju broja (mislim da sam izmislio novu rec)
    
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
    
    
//MARK: -- UI Postavke
    
    func postaviUI() {
        postaviBrojeve()
        let kvoteHeight = CGFloat(100)
        view.addSubview(brojevi)
        brojevi.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(podaciOIzabranomKolu)
        podaciOIzabranomKolu.anchor(top: brojevi.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        view.addSubview(kvote)
        kvote.anchor(top: podaciOIzabranomKolu.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: kvoteHeight)
        
        kvote.addSubview(kvoteBK)
        kvoteBK.anchor(top: kvote.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        kvote.addSubview(kvoteKvota)
        kvoteKvota.anchor(top: kvoteBK.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        kvote.addSubview(kvote1)
        kvote1.anchor(top: kvote.topAnchor, left: kvoteBK.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        kvote.addSubview(kvote3_75)
        kvote3_75.anchor(top: kvoteBK.bottomAnchor, left: kvoteBK.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        
        kvote.addSubview(kvotelinija)
        kvotelinija.anchor(top: kvoteBK.bottomAnchor, left: view.leftAnchor, bottom: kvoteKvota.topAnchor, right: view.rightAnchor, paddingTop: 3, paddingLeft: 60, paddingBottom: 3, paddingRight: 20, width: 0, height: 2)
        
        
        kvote.addSubview(kvote2)
        kvote2.anchor(top: kvote.topAnchor, left: kvote1.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        kvote.addSubview(kvote14)
        kvote14.anchor(top: kvoteBK.bottomAnchor, left: kvote1.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        

        kvote.addSubview(kvote3)
        kvote3.anchor(top: kvote.topAnchor, left: kvote2.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        kvote.addSubview(kvote65)
        kvote65.anchor(top: kvoteBK.bottomAnchor, left: kvote2.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        kvote.addSubview(kvote4)
        kvote4.anchor(top: kvote.topAnchor, left: kvote3.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        kvote.addSubview(kvote275)
        kvote275.anchor(top: kvoteBK.bottomAnchor, left: kvote3.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        kvote.addSubview(kvote5)
        kvote5.anchor(top: kvote.topAnchor, left: kvote4.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        kvote.addSubview(kvote1350)
        kvote1350.anchor(top: kvoteBK.bottomAnchor, left: kvote4.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        kvote.addSubview(kvote6)
        kvote6.anchor(top: kvote.topAnchor, left: kvote5.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        kvote.addSubview(kvote6500)
        kvote6500.anchor(top: kvoteBK.bottomAnchor, left: kvote5.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        kvote.addSubview(kvote7)
        kvote7.anchor(top: kvote.topAnchor, left: kvote6.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        kvote.addSubview(kvote25000)
        kvote25000.anchor(top: kvoteBK.bottomAnchor, left: kvote6.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/8, height: kvoteHeight/2)
        
        
        view.addSubview(slucajniBrojevi)
        slucajniBrojevi.anchor(top: kvote.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/2, height: 100)
        
        
        view.addSubview(ukupnoIzabranoBrojevaLabela)
        ukupnoIzabranoBrojevaLabela.anchor(top: kvote.bottomAnchor, left: slucajniBrojevi.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.width/2, height: 100)
        

    }

}


//MARK: -- Ekstenzije, CollectionView


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


