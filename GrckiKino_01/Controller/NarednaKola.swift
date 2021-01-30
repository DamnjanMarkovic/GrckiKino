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


class NarednaKola: UIViewController {
    
    
    // MARK: - kreiranje delova UI
    
    let viewHeader = UIView()
    private let cellIdentifier = "cellKolo"
    private let headerIdentifier = "koloTableHeader"
    
    var narednaKola = [Kolo]()
    var tableView = UITableView()
    
    
    private let tableStackView: UIStackView = {
        let view = UIStackView()
        view.clipsToBounds = true
        return view
    }()
    


    
    // MARK: - funkcije
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        title = "naredna kola"
        view.backgroundColor = UIColor.darkGray
        configureTableView()
        setUI()
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
        tableView.register(NarednaKolaCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.register(NarednaKolaHeader.self, forHeaderFooterViewReuseIdentifier: headerIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.set(to: tableStackView)
    }
    
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//    }
    
    
    func setUI() {
        
        tableStackView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        view.addSubview(tableStackView)
    }

    

    
    
}

// MARK: - ekstenzije

extension NarednaKola: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return narednaKola.count

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier) as! NarednaKolaHeader
        view.vremeIzvlacenja.text = "Vreme izvlacenja"
        view.preostaloZaUplatu.text = "Preostalo za uplatu"

        return view
    }
    


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return narednaKola.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NarednaKolaCell
        cell.expiryTimeInterval = 10
        cell.set(kolo: narednaKola[indexPath.row])
        return cell
        
        
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let koloKliknuto = narednaKola[indexPath.row]
        DatabaseManager.shared.koloKliknuto = koloKliknuto
        
        let talonVC = Talon()
        let navController = UINavigationController(rootViewController: talonVC)
        navController.modalPresentationStyle = .overFullScreen
        self.present(navController, animated: false)
        
        
        
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


