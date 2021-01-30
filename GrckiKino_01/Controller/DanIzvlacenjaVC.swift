//
//  RezultatiIzvlacenjaZaDan.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 29.1.21..
//

import UIKit

extension DanIzvlacenjaVC: KolaPoDatumuDownloadingingDelegate {
    func vratikolaPoDatumuPrekoProtokola(_ koloPoDatumuDownloading: KoloPoDatumuDownloading, kolaZaIzabraniDan: KolaZaIzabraniDan, kolaUDanu: [ZavrsenoKolo]) {
        DispatchQueue.main.async {
            self.kolaZaIzabraniDan = kolaZaIzabraniDan
            self.kolaUDanu = kolaUDanu
        }
    }
}


class DanIzvlacenjaVC: UIViewController {
    
    var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        return collectionView
    }()
    
    var dateView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    let datePickerer: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.layer.borderColor = UIColor.black.cgColor
        datePicker.layer.borderWidth = 2
        datePicker.layer.borderColor = UIColor.blue.cgColor
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = .black
        datePicker.largeContentTitle = "naslov"
        let today = Date()
        datePicker.maximumDate = today
        datePicker.minuteInterval = 5
        datePicker.addTarget(self, action: #selector(timeChanged), for: .valueChanged)
        return datePicker
        
    }()
    
    
    var scheduledTime: Date!
    private let cellIdentifier = "DanIzvlacenjaTablecell"
    private let headerIdentifier = "DanIzvlacenjaHeader"
    private let cellCVIdentifier = "CVDanIzvlacenjacell"
    
    
    
    var izabraniDan: String!
    var kolaZaIzabraniDan: KolaZaIzabraniDan!
    var kolaUDanu = [ZavrsenoKolo]()
    var tableView = UITableView()
    var delegat = KoloPoDatumuDownloading()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Kola za dan"
        view.backgroundColor = .black
        delegat.delegate = self
        configureDateView()
        
    }

    
    @objc func timeChanged(sender: UIDatePicker) {
        self.dismiss(animated: true, completion: nil)
        self.scheduledTime = sender.date
        let scheduledTimeForNotification = Calendar.current.date(byAdding: .hour, value: 1, to: scheduledTime)!

        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        izabraniDan = formatter.string(from: scheduledTimeForNotification)
        vratiKola()

    }
    
    func vratiKola() {
        delegat.vratiKolaPoDatumu(datum: izabraniDan) { success in
            if success {
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                    self.configureTableView()
                }
            }
        }
    }
    

    
    func configureDateView() {
        
        dateView.frame = CGRect(x: view.width/3, y: 80, width: view.width/3, height: 60)
 
        view.addSubview(dateView)
        dateView.addSubview(datePickerer)
        datePickerer.datePickerMode = UIDatePicker.Mode.date
        datePickerer.tintColor = .white
        datePickerer.anchor(top: dateView.topAnchor, left: dateView.leftAnchor, bottom: nil, right: dateView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
        

        
    }
    
    
    func configureTableView() {
        
        tableView.frame = CGRect(x: 0, y: 150, width: view.width, height: view.height)
        tableView.rowHeight = 400
        tableView.register(DanIzvlacenjaTableCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    


}


extension DanIzvlacenjaVC: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? DanIzvlacenjaTableCell else { return }
 
         tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kolaUDanu.count
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DanIzvlacenjaTableCell
        return cell

    }
}


extension DanIzvlacenjaVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return kolaUDanu[collectionView.tag].winningNumbers.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellCVIdentifier, for: indexPath as IndexPath) as! DanIzvlacenjaCVCell
        
        cell.setup(with: kolaUDanu[collectionView.tag].winningNumbers.list[indexPath.row])

        return cell
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind:
        String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:
                                                                            headerIdentifier, for: indexPath) as! DanIzvlacenjaHeader
        header.headerLabela.text = "Kolo broj: \(kolaUDanu[collectionView.tag].drawId) od \(TimeFunctions.vratiVremeUMinutima(timeAsTimestamp: kolaUDanu[collectionView.tag].drawTime)) dana \(TimeFunctions.vratiDan(timeAsTimestamp: kolaUDanu[collectionView.tag].drawTime)). "
            return header
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

