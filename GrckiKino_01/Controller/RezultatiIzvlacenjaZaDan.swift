//
//  RezultatiIzvlacenjaZaDan.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 29.1.21..
//

import UIKit

class RezultatiIzvlacenjaZaDan: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Kola za dan"

        // Do any additional setup after loading the view.
    }
    
    private let cellRezultati = "cellRezultati"
    private let headerRezultati = "headerRezultati"

    var zavrsenaKola = [ZavrsenoKolo]()
    var tableView = UITableView()
    var koloPoIDju: ZavrsenoKolo!
    
    var brojKola: Int!
    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .yellow
//        title = "Kolo"
//        navigationController?.navigationBar.isHidden = false
////        unosBrojaKola()
//        configureTableView();
//        vratiRealizovanoKolo {
//            self.tableView.reloadData()
//        }
//    }
    
    
    
//    func vratiRealizovanaKolaPoDatumu(completed: @escaping () -> ()) {
//        let brojKola = "856666"
////        let url = URL (string: "\(Constants.apiRealizovanoKolo)/\(brojKola)/")
//        
//        let isoDate = "2021-01-02"
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter.dateFormat = "yyyy-mm-dd"
//        let date1 = dateFormatter.date(from:isoDate)!
// 
//        let isoDate2 = "2021-01-12"
////        let dateFormatter = DateFormatter()
////        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
////        dateFormatter.dateFormat = "yyyy-mm-dd"
//        let date2 = dateFormatter.date(from:isoDate)!
//        let formatDate = DateFormatter()
//            formatDate.dateFormat = "yyyy-mm-dd"
//        let drawDate1 = formatDate.string(from: date1)
//        let drawDate2 = formatDate.string(from: date2)
//        
//        
////        var timeOdKad = vratiDatum(timeAsString: "2021-01-11T10:44:00+0000")
////        var timeDoKad = vratiDatum(timeAsString: "2021-04-13T10:44:00+0000")
//        let url = URL (string: "https://api.opap.gr/draws/v3.0/1100/draw-date/\(drawDate1)/\(drawDate2)/")
////
//   
//        
//        var request = URLRequest(url: url!)
//        request.httpMethod = "GET"
//        let session = URLSession.shared
//        let _: Void = session.dataTask(with: request) { (data, response, error) in
//            if error == nil {
//                do {
//                    let errorDate = try JSONDecoder().decode(ErrorDate.self, from: data!)
//                    DispatchQueue.main.async {
//                        completed()
//                        self.zavrsenaKola.append(self.koloPoIDju)
//
//
//                    }
//                }catch{
//                    print("Json error")
//                }
//            }
//        }.resume()
//    }
    func configureTableView() {
        
//        view.addSubview(tableView)
//        tableView.rowHeight = view.frame.height / 10
//        tableView.register(RezultatiCell.self, forCellReuseIdentifier: cellRezultati)
//        tableView.register(RezultatiHeader.self, forHeaderFooterViewReuseIdentifier: headerRezultati)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.set(to: view)
    }
    


}

//extension RezultatiIzvlacenja: UITableViewDelegate, UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerRezultati) as! RezultatiHeader
////        header.headerLabela.text = "Vreme izvlacenja: + | Kolo: "
//
////        header.headerLabela.text = "Vreme izvlacenja: \(TimeFunctions.vratiVremeUMinutima(timeAsTimestamp: zavrsenaKola[0].drawTime)) | Kolo: \(zavrsenaKola[0].drawId)"
//
//        return header
//    }
//    
//
//
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return zavrsenaKola.count
//    }
//    
//    
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellRezultati, for: indexPath) as! RezultatiCell
////        cell.backgroundColor = UIColor.blue
//        cell.set(zavrsenoKolo: zavrsenaKola[indexPath.row])
//        return cell
//        
//        
//    }
//}
