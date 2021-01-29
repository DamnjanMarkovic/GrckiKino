//
//  KoloTableHeader.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 28.1.21..
//

import UIKit

class KoloTableHeader: 
    UITableViewHeaderFooterView {

    let vremeIzvlacenja: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 5
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = "Vreme izvlacenja"
        label.layer.borderColor = UIColor.darkGray.cgColor
        return label
    }()
    let preostaloZaUplatu: UILabel = {
        let label = UILabel()
        
        label.layer.cornerRadius = 5
        label.textColor = UIColor.black
        label.text =  "Preostalo za uplatu:"
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.layer.borderColor = UIColor.darkGray.cgColor
        label.numberOfLines = 0
        return label
    }()
    

        override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)
            configureContents()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        func configureContents() {
            vremeIzvlacenja.translatesAutoresizingMaskIntoConstraints = false
            preostaloZaUplatu.translatesAutoresizingMaskIntoConstraints = false

            contentView.addSubview(vremeIzvlacenja)
            contentView.addSubview(preostaloZaUplatu)
            
            
            
//            vremeIzvlacenja.translatesAutoresizingMaskIntoConstraints = false
//            vremeIzvlacenja.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//            vremeIzvlacenja.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//    //        terminSledecegKola.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//            vremeIzvlacenja.heightAnchor.constraint(equalToConstant: contentView.height).isActive = true
//            vremeIzvlacenja.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
//
//            preostaloZaUplatu.translatesAutoresizingMaskIntoConstraints = false
//            preostaloZaUplatu.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//            preostaloZaUplatu.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
//            preostaloZaUplatu.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//            preostaloZaUplatu.widthAnchor.constraint(equalToConstant: 60).isActive = true
            
            
            

            NSLayoutConstraint.activate([

            vremeIzvlacenja.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
                vremeIzvlacenja.widthAnchor.constraint(equalToConstant: 150),
            vremeIzvlacenja.heightAnchor.constraint(equalToConstant: 50),
            vremeIzvlacenja.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            preostaloZaUplatu.heightAnchor.constraint(equalToConstant: 100),
            preostaloZaUplatu.leadingAnchor.constraint(equalTo: vremeIzvlacenja.trailingAnchor,
                   constant: 8),
            preostaloZaUplatu.trailingAnchor.constraint(equalTo:
                   contentView.layoutMarginsGuide.trailingAnchor),
            preostaloZaUplatu.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
    }
