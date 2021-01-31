//
//  KoloCell.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 27.1.21..
//

import UIKit



class NarednaKolaCell: UITableViewCell {
    
    private var timer: Timer?
    private var timeCounter: Double = 0
    
    var terminSledecegKola = UILabel()
    var vremeDoSledecegKola = UILabel()
    var kolo: NarednoKolo?
    
    var preostaloVreme: Int!
    
    
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
        label.lineBreakMode = .byWordWrapping
        label.font = Constants.fontSvuda
        
        label.textAlignment = .center
        label.layer.borderColor = UIColor.darkGray.cgColor
        label.numberOfLines = 0
        return label
    }()
    let linija: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.black
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
        startTimer()
        contentView.backgroundColor = Constants.neboPlava
        selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    func configureContents() {
        
        vremeIzvlacenja.translatesAutoresizingMaskIntoConstraints = false
        preostaloZaUplatu.translatesAutoresizingMaskIntoConstraints = false
        linija.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(vremeIzvlacenja)
        contentView.addSubview(preostaloZaUplatu)
        contentView.addSubview(linija)
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
            preostaloZaUplatu.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            
            
            linija.heightAnchor.constraint(equalToConstant: 2),
            linija.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor,
                   constant: 5),
            linija.trailingAnchor.constraint(equalTo:
                                                contentView.layoutMarginsGuide.trailingAnchor, constant: 5),
            linija.centerYAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        timer?.invalidate()
        timer = nil
    }
    
    
    
    private func startTimer() {
        if let interval = expiryTimeInterval {

        timeCounter = interval
            if #available(iOS 10.0, *) {

                timer = Timer.scheduledTimer(timeInterval: 1.0,
                     target: self,
                     selector: #selector(onComplete),
                     userInfo: nil,
                     repeats: true)
            }
        }
    }

    @objc func onComplete() {
        guard timeCounter >= 0 else {
            preostaloZaUplatu.text = "---"
            timer?.invalidate()
            timer = nil
            return
        }

        let minutes = Int(timeCounter) / 60 % 60
        let seconds = Int(timeCounter) % 60

        preostaloZaUplatu.text = String(format:"%02i:%02i", minutes, seconds)

        timeCounter -= 1
    }


    var expiryTimeInterval: TimeInterval? {
    didSet {
        if timer == nil
            {
                startTimer()
                guard let timerChecked = timer else { return }            
                RunLoop.current.add(timerChecked, forMode: RunLoop.Mode.common)
            }
        }
    }

}



