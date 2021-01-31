//
//  KoloHeader.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 30.1.21..
//

import UIKit

class KoloPoID_uHeader: UICollectionViewCell {
    
    override init(frame: CGRect)    {
        super.init(frame: frame)
        setupHeaderViews()
    }
    
    
    let headerLabela: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.font = Constants.fontSvuda
        title.adjustsFontSizeToFitWidth = true
        title.backgroundColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    func setupHeaderViews()   {
        addSubview(headerLabela)

        headerLabela.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        headerLabela.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        headerLabela.widthAnchor.constraint(equalTo: contentView.layoutMarginsGuide.widthAnchor).isActive = true
        headerLabela.heightAnchor.constraint(equalToConstant: 30).isActive = true
        headerLabela.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
