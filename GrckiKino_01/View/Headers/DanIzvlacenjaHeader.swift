//
//  IzvlacenjeHeader.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 29.1.21..
//

import UIKit

class DanIzvlacenjaHeader: UITableViewHeaderFooterView {


    let headerLabela: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 5
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.layer.borderColor = UIColor.darkGray.cgColor
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
        headerLabela.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(headerLabela)


        NSLayoutConstraint.activate([

            headerLabela.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            headerLabela.widthAnchor.constraint(equalTo: contentView.layoutMarginsGuide.widthAnchor),
            headerLabela.heightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.heightAnchor),
            headerLabela.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor),

       ])
    }
    
    
    func setHeader(koloZaIzabraniDan: ZavrsenoKolo) {

        headerLabela.text = "Kolo broj: \(koloZaIzabraniDan.drawId) od \(TimeFunctions.vratiVremeUMinutima(timeAsTimestamp: koloZaIzabraniDan.drawTime))"



    }
}
