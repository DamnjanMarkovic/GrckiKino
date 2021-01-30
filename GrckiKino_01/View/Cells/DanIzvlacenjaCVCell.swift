//
//  DanIzvlacenjaCVCell.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 30.1.21..
//

import UIKit

class DanIzvlacenjaCVCell: UICollectionViewCell {

    var broj: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.layer.borderWidth = 3.0
        label.layer.backgroundColor = UIColor.black.cgColor
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }

    private func setupViews() {
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = Constants.cornerRadiusTalonCell
        contentView.addSubview(broj)
        

    }

    private func setupLayouts() {
        broj.layer.cornerRadius = 14
        
        broj.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            broj.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            broj.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            broj.topAnchor.constraint(equalTo: contentView.topAnchor),
            broj.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])



    }
 

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with brojPristigao : Int) {
        
        broj.layer.borderColor = Constants.randomColor().cgColor
        
        broj.text = "\(brojPristigao)"

        
    }
}
