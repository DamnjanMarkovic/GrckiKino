//
//  KoloTableHeader.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 28.1.21..
//

import UIKit

class NarednaKolaHeader: UITableViewHeaderFooterView {

    var containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    
    let vremeIzvlacenja: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 5
        label.numberOfLines = 0
        label.textColor = UIColor.white
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.font = Constants.fontSvuda
        label.text = "Vreme izvlacenja"
        label.layer.borderColor = UIColor.darkGray.cgColor
        return label
    }()
    let preostaloZaUplatu: UILabel = {
        let label = UILabel()
        
        label.layer.cornerRadius = 5
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.text =  "Preostalo za uplatu:"
        label.lineBreakMode = .byWordWrapping
        label.font = Constants.fontSvuda
        label.textAlignment = .center
        label.layer.borderColor = UIColor.darkGray.cgColor
        label.numberOfLines = 0
        return label
    }()
    

        override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)
            configureContents()
            contentView.backgroundColor = Constants.tamnoPlava
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        func configureContents() {
            
            vremeIzvlacenja.translatesAutoresizingMaskIntoConstraints = false
            preostaloZaUplatu.translatesAutoresizingMaskIntoConstraints = false

            contentView.addSubview(vremeIzvlacenja)
            contentView.addSubview(preostaloZaUplatu)


            NSLayoutConstraint.activate([

            vremeIzvlacenja.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            vremeIzvlacenja.widthAnchor.constraint(equalToConstant: 150),
            vremeIzvlacenja.heightAnchor.constraint(equalToConstant: 80),
            vremeIzvlacenja.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

                
                
            preostaloZaUplatu.heightAnchor.constraint(equalToConstant: 80),
            preostaloZaUplatu.leadingAnchor.constraint(equalTo: vremeIzvlacenja.trailingAnchor,
                   constant: 10),
            preostaloZaUplatu.trailingAnchor.constraint(equalTo:
                   contentView.layoutMarginsGuide.trailingAnchor),
            preostaloZaUplatu.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
    }

