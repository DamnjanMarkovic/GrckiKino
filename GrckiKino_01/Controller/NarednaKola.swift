//
//  OpeningPage.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 27.1.21..
//

import UIKit



extension NarednaKola: NarednaKolaDownloadingDelegate {
    func vratiNarednaKolaPrekoProtokola(_ koloDownloading: NarednaKolaDownloading, narednaKola: [NarednoKolo]) {        
        DispatchQueue.main.async {
            self.narednaKola = narednaKola
        }
    }
}


class NarednaKola: UIViewController {
    
    
    // MARK: - kreiranje delova UI
    
    let viewHeader = UIView()
    private let cellIdentifier = "cellKolo"
    private let headerIdentifier = "koloTableHeader"
    
    var narednaKola = [NarednoKolo]()
    var tableView = UITableView()
    
    var delegat = NarednaKolaDownloading()
    
    
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
        configureTableView()
        delegat.delegate = self
        vratiKola()
        setUI()

    }
    
    func vratiKola() {
        delegat.vratiNarednaKola() { success in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    

    
    func configureTableView() {

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableStackView.addSubview(tableView)
        tableView.rowHeight = view.frame.height / 10
        tableView.register(NarednaKolaCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.register(NarednaKolaHeader.self, forHeaderFooterViewReuseIdentifier: headerIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.set(to: tableStackView)
    }
    
    
    func setUI() {
        
        tableStackView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        view.addSubview(tableStackView)
    }

    
}

// MARK: - ekstenzija, TableView

extension NarednaKola: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier) as! NarednaKolaHeader
        return view
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return narednaKola.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NarednaKolaCell
        if (((narednaKola[indexPath.row].drawTime - (Double(TimeFunctions.vratiVremeSada())))/1000) < 300) {
            cell.preostaloZaUplatu.textColor = .red
        }
        
        cell.vremeIzvlacenja.text = TimeFunctions.vratiVremeUMinutima(timeAsTimestamp: narednaKola[indexPath.row].drawTime)

        cell.expiryTimeInterval = ((narednaKola[indexPath.row].drawTime - (Double(TimeFunctions.vratiVremeSada())))/1000)
        

        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let koloKliknuto = narednaKola[indexPath.row]
        Singletone.Instanca.koloKliknuto = koloKliknuto
        
        let talonVC = Talon()
        let navController = UINavigationController(rootViewController: talonVC)
        navController.modalPresentationStyle = .overFullScreen
        self.present(navController, animated: false)
        
    }
    
}


