//
//  TalonCollectionViewCell.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 28.1.21..
//

import UIKit

class TalonCell: UICollectionViewCell {
    


    var broj: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.layer.cornerRadius = 14
        label.layer.borderWidth = 3.0
        label.layer.backgroundColor = UIColor.clear.cgColor
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(broj, anchors: [.leading(0), .trailing(0), .bottom(0), .top(0)])
    }



 
 

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with brojPristigao : Int) {
        
        broj.text = "\(brojPristigao)"

        
    }
}

