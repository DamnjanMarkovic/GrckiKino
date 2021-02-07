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
    
    
    private var brojevi: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    private let kvote: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    var podaciOIzabranomkolu = UILabel()
    var ukupnoIzabranoBrojevaLabela = UILabel()
    
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
    
    var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .darkGray
        return collectionView
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

        podaciOIzabranomkolu.text = "Vreme izvlacenja: \(TimeFunctions.vratiVremeUMinutima(timeAsTimestamp: koloKliknuto.drawTime)) | Kolo: \(koloKliknuto.drawId)"

        ukupnoIzabranoBrojevaLabela.text = "Izabrano brojeva: \n\(ukupnoIzabranoBrojeva)"
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

}


//MARK: -- Ekstenzije, UILayout
extension Talon {
    
    
    
    public func vratiLabelu(tekst: String) -> UILabel {
       let label = UILabel(frame: .zero)
       label.textAlignment = .center
       label.text = tekst
       label.font = Constants.fontKvote
       label.adjustsFontSizeToFitWidth = true
       label.textColor = .white
       label.numberOfLines = 0
       return label
    }
    
    public func vratiLiniju(width: Double) -> UILabel {
       let label = UILabel(frame: .zero)
       label.textAlignment = .center
       label.font = Constants.fontKvote
       label.adjustsFontSizeToFitWidth = true
       label.textColor = .white
       label.backgroundColor = .lightGray
       label.numberOfLines = 0
       return label
    }
    
    func postaviUI() {
        
        podaciOIzabranomkolu = vratiLabelu(tekst: "")
        
        ukupnoIzabranoBrojevaLabela = vratiLabelu(tekst: "")
        ukupnoIzabranoBrojevaLabela.layer.borderWidth = 2
        ukupnoIzabranoBrojevaLabela.layer.borderColor = UIColor.black.cgColor
        ukupnoIzabranoBrojevaLabela.layer.cornerRadius = 14
        ukupnoIzabranoBrojevaLabela.layer.backgroundColor = UIColor.clear.cgColor

        postaviBrojeve()
        
        let kvoteHeight = view.width/8
        kvote.backgroundColor = .blue
        view.addSubview(brojevi, anchors: [.leading(0), .trailing(0), .top(0), .height(400)])
        view.addSubview(podaciOIzabranomkolu, anchors: [.leading(0), .trailing(0), .top(400), .height(50)])
        view.addSubview(kvote, anchors: [.leading(0), .trailing(0), .top(450), .height(kvoteHeight*2)])
        view.addSubview(slucajniBrojevi, anchors: [.leading(0), .top(600), .bottom(0)])
        view.addSubview(ukupnoIzabranoBrojevaLabela, anchors: [.leading(view.width/2), .trailing(0), .top(600), .bottom(0)])
        
        kvote.addSubview(vratiLabelu(tekst: "BK"), anchors: [.leading(0), .top(0), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "Kvota"), anchors: [.leading(0), .top(kvoteHeight), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "1"), anchors: [.leading(kvoteHeight), .top(0), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "3.75"), anchors: [.leading(kvoteHeight), .top(kvoteHeight), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "2"), anchors: [.leading(2*kvoteHeight), .top(0), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "5"), anchors: [.leading(2*kvoteHeight), .top(kvoteHeight), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "3"), anchors: [.leading(3*kvoteHeight), .top(0), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "7"), anchors: [.leading(3*kvoteHeight), .top(kvoteHeight), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "4"), anchors: [.leading(4*kvoteHeight), .top(0), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "16"), anchors: [.leading(4*kvoteHeight), .top(kvoteHeight), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "5"), anchors: [.leading(5*kvoteHeight), .top(0), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "32"), anchors: [.leading(5*kvoteHeight), .top(kvoteHeight), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "6"), anchors: [.leading(6*kvoteHeight), .top(0), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "64"), anchors: [.leading(6*kvoteHeight), .top(kvoteHeight), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "7"), anchors: [.leading(7*kvoteHeight), .top(0), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLabelu(tekst: "128"), anchors: [.leading(7*kvoteHeight), .top(kvoteHeight), .width(kvoteHeight), .height(kvoteHeight)])
        kvote.addSubview(vratiLiniju(width: 3), anchors: [.leading(30), .top(kvoteHeight), .width(kvoteHeight), .trailing(-30), .height(3)])
        
    }
}


//MARK: -- Ekstenzije, CollectionView
extension Talon: UICollectionViewDataSource {
    
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
        
        if (brojJeVecKliknut(brojKliknut: indexPath.row+1)){
            selectedCell.broj.layer.borderColor = Constants.borderColorOriginalTalonCell
            if let index = listaIzabranihBrojeva.firstIndex(of: indexPath.row+1) {
                listaIzabranihBrojeva.remove(at: index)
                ukupnoIzabranoBrojeva -= 1
            }
        }
        else {
            if listaIzabranihBrojeva.count < 15 {
                selectedCell.broj.layer.borderColor = UIColor.green.cgColor
                listaIzabranihBrojeva.append(indexPath.row+1)
                ukupnoIzabranoBrojeva += 1
            }
            else {
                let alert = AlertInfo.alert(message: "Maksimalni broj brojeva je 15.")
                self.present(alert, animated: true)
            }
        }
    }

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


