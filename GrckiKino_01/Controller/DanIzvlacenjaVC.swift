//
//  RezultatiIzvlacenjaZaDan.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 29.1.21..
//

import UIKit

class DanIzvlacenjaVC: UIViewController {
    
    var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        return collectionView
    }()
    
    private let cellIdentifier = "DanIzvlacenjaTablecell"
    private let headerIdentifier = "DanIzvlacenjaHeader"
    
    private let cellCVIdentifier = "CVDanIzvlacenjacell"
    
    
    var kolaZaIzabraniDan: KolaZaIzabraniDan!
    var kolaUDanu = [ZavrsenoKolo]()
    var tableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Kola za dan"
        
        vratiKolaZaIzabraniDan {

            self.tableView.reloadData()
            self.configureTableView()
            
        }
        
    }
    
    
    
    func vratiKolaZaIzabraniDan(completed: @escaping () -> ()) {

        let datum = "2021-01-01"
        
        let url = URL (string: "\(Constants.apiRealizovanoKolo)/draw-date/\(datum)/\(datum)")

        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let _: Void = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                do {
                    self.kolaZaIzabraniDan = try JSONDecoder().decode(KolaZaIzabraniDan.self, from: data!)
                    DispatchQueue.main.async {
                        self.kolaUDanu = self.kolaZaIzabraniDan.content
                        completed()
                        
 
                    }
                }catch{
                    print("Json error")
                }
            }
        }.resume()
    }
    func configureTableView() {
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        
        tableView.rowHeight = 200
        tableView.register(DanIzvlacenjaTableCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.register(DanIzvlacenjaHeader.self, forHeaderFooterViewReuseIdentifier: headerIdentifier)
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
        return kolaUDanu.count

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier) as! DanIzvlacenjaHeader

        header.setHeader(koloZaIzabraniDan: kolaZaIzabraniDan.content[section])
        
        return header
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


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidthHeight = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)
        
        return CGSize(width: cellWidthHeight, height: cellWidthHeight)
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 7
        
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

