//
//  DanIzvlacenjaCell.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 29.1.21..
//

import UIKit

class DanIzvlacenjaTableCell: UITableViewCell {

    var naslovKola: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.layer.borderWidth = 3.0
        return label
    }()
    
    
    
    var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        return collectionView
    }()
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
    

      override func awakeFromNib() {
            super.awakeFromNib()
      }
    
  
      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

      }
  
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
  
      override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.black
        addSubview(collectionView)
        setCollectionView()
      }
    
    
    func postaviNaslov() {
        naslovKola.translatesAutoresizingMaskIntoConstraints = false
        naslovKola.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        naslovKola.topAnchor.constraint(equalTo: topAnchor).isActive = true
        naslovKola.translatesAutoresizingMaskIntoConstraints = false
        naslovKola.heightAnchor.constraint(equalTo: heightAnchor, constant: 50).isActive = true
        naslovKola.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DanIzvlacenjaHeader.self, forSupplementaryViewOfKind:
                                    UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DanIzvlacenjaHeader")
        collectionView.register(DanIzvlacenjaCVCell.self, forCellWithReuseIdentifier: "CVDanIzvlacenjacell")
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        collectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        
    }
  

}



