//
//  OpeningPage.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 27.1.21..
//

import UIKit



//extension OpeningPage: KoloGettingDelegate {
//    func vratiSvaKola(_ taskHandling: TasksHandling, post: [Task], dictionary: [String : [Task]], sectionNames: [String], dictionaryAll: [String : [Task]], sectionNamesAll: [String]) {
//
//        DispatchQueue.main.async {
//            self.post = post
//            self.twoDimensionalArray = dictionary
//            self.twoDimensionalArrayBackUp = dictionary
//            self.sectionNames = sectionNames
//        }
//    }
//}


class OpeningPage: UIViewController {
    
    
    // MARK: - kreiranje delova UI
    
    let viewHeader = UIView()
    private let cellIdentifier = "cellKolo"
    private let headerIdentifier = "koloTableHeader"
    
    var narednaKola = [Kolo]()
    var tableView = UITableView()
    
    private let mainview: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .gray
        return view
    }()
    
    private let tableStackView: UIStackView = {
        let view = UIStackView()
        view.clipsToBounds = true
        return view
    }()
    
    
    let zastavaGrcke: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "greece-flag")
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = iv.frame.size.width / 2
        iv.clipsToBounds = true
        return iv
    }()
    
    
    let naslovIgre: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 5
        label.text = "GRCKI KINO (20/80)"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = UIColor.white
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.layer.borderColor = UIColor.darkGray.cgColor
        return label
    }()
    
    
    
    let lineInBetween: UIView = {
        let lineVIew = UIView()
        lineVIew.backgroundColor = .blue
        return lineVIew
    }()
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor.darkGray
        createUI()
        configureTableView()
        vratiSvakoKolo {
            self.tableView.reloadData()
        }

    }
    

    
    func vratiSvakoKolo(completed: @escaping () -> ()) {
        
        let url = URL (string: Constants.apiPregledNarednihKola)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let _: Void = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                do {
                    self.narednaKola = try JSONDecoder().decode([Kolo].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                        
                    }
                }catch{
                    print("Json error")
                }
            }
        }.resume()
    }
    
    func configureTableView() {
        
        tableStackView.addSubview(tableView)
        tableView.rowHeight = view.frame.height / 10
        tableView.register(KoloCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.register(KoloTableHeader.self, forHeaderFooterViewReuseIdentifier: headerIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.set(to: tableStackView)
    }
    
    func createUI() {
        
        
        view.addSubview(mainview)
        view.addSubview(tableStackView)
        mainview.addSubview(zastavaGrcke)
        mainview.addSubview(naslovIgre)
        mainview.addSubview(lineInBetween)
        
        
        
    }
    
    
    
//    func setKolouDefaults()  {
//        let defaults = UserDefaults.standard
//        defaults.set(kolo,forKey: "izabranoKolo")
//        defaults.synchronize()
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        let screenWidth = view.width
        let size = screenWidth/4
        mainview.frame = CGRect(x: 10, y: 50, width: screenWidth-20, height: 50)
        
        zastavaGrcke.frame = CGRect(x: 0, y: 10, width: size, height: 30)
        naslovIgre.frame = CGRect(x: zastavaGrcke.right, y: 10, width: screenWidth/2, height: 30)
        lineInBetween.frame = CGRect(x: 10, y: naslovIgre.bottom + 5, width: mainview.width-20, height: 1)
        

        tableStackView.frame = CGRect(x: 0, y: 120, width: view.width, height: view.height-mainview.height)
        
    }
    

    

    
    
}

extension OpeningPage: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier) as! KoloTableHeader
        view.vremeIzvlacenja.text = "Vreme izvlacenja"
        view.preostaloZaUplatu.text = "Preostalo za uplatu"

        return view
    }
    


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return narednaKola.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! KoloCell
        cell.expiryTimeInterval = 10
        cell.set(kolo: narednaKola[indexPath.row])
        return cell
        
        
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //unhighlights row after auto highlight on selection
        
        let koloKliknuto = narednaKola[indexPath.row]
        DatabaseManager.shared.koloKliknuto = koloKliknuto
        
        let mainTabVC = ContainerTabs()
        mainTabVC.modalPresentationStyle = .overFullScreen
        self.present(mainTabVC, animated: false)
        
        
        
//        let navController = UINavigationController(rootViewController: mainTabVC)
//        view.addSubview(navController.view)
//        addChild(navController)
//        navController.didMove(toParent: self)
        
        
//        let koloKliknuto = kolo[indexPath.row]
//
//        let mainTabVC = ContainerTabs()
//        let navController = UINavigationController(rootViewController: mainTabVC)
//        view.addSubview(navController.view)
//        addChild(navController)
//        navController.didMove(toParent: self)
        
        
        
        
        
        
//        navController.modalPresentationStyle = .overFullScreen
//        self.present(navController, animated: false)
//        
//        UIViewController centerController = UINavigationController(rootViewController: basicVC)
//        view.addSubview(centerController.view)
//        addChild(centerController)
//        centerController.didMove(toParent: self)
        

//        let talon = Talon()
//        talon.kolo = koloKliknuto
//        talon.modalPresentationStyle = .overFullScreen
        
//        let navController = UINavigationController(rootViewController: talon)
//        navController.modalPresentationStyle = .overFullScreen
//        self.present(navController, animated: false)
        
        
        
//        self.present(talon, animated: false)

    }
    
}


