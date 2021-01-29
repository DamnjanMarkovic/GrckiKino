//
//  KoloCell.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 27.1.21..
//

import UIKit



class NarednaKolaCell: UITableViewCell {
    

    var terminSledecegKola = UILabel()
    var vremeDoSledecegKola = UILabel()
    var kolo: Kolo?
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(terminSledecegKola)
        addSubview(vremeDoSledecegKola)

        terminSledecegKola.numberOfLines = 0
        terminSledecegKola.font = UIFont.systemFont(ofSize: 20)
        terminSledecegKola.adjustsFontSizeToFitWidth = true
        
        vremeDoSledecegKola.numberOfLines = 0
        vremeDoSledecegKola.font = UIFont.systemFont(ofSize: 20)
        vremeDoSledecegKola.adjustsFontSizeToFitWidth = true

        postaviLabele()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var timer: Timer?
        private var timeCounter: Double = 0

        var expiryTimeInterval: TimeInterval? {
            didSet {
                startTimer()
            }
        }

        private func startTimer() {
            if let interval = expiryTimeInterval {
                timeCounter = interval
                if #available(iOS 10.0, *) {
                    timer = Timer(timeInterval: 1.0,
                                  repeats: true,
                                  block: { [weak self] _ in
                                    guard let strongSelf = self else {
                                        return
                                    }
                                    strongSelf.onComplete()
                    })
                } else {
                    timer = Timer(timeInterval: 1.0,
                                  target: self,
                                  selector: #selector(onComplete),
                                  userInfo: nil,
                                  repeats: true)
                }
            }
        }

        @objc func onComplete() {
            guard timeCounter >= 0 else {
                timer?.invalidate()
                timer = nil
                return
            }
            vremeDoSledecegKola.text = String(format: "%d", timeCounter)
            timeCounter -= 1
        }
    
    
    
    
    func set(kolo: Kolo) {
        
        self.backgroundColor = UIColor.gray
        terminSledecegKola.text = "\(TimeFunctions.vratiVremeUMinutima(timeAsTimestamp: kolo.drawTime))"
        vremeDoSledecegKola.text = String(format: "%d", timeCounter)


    }
   
    
    
    
    func postaviLabele() {
        
        terminSledecegKola.translatesAutoresizingMaskIntoConstraints = false
        terminSledecegKola.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        terminSledecegKola.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        terminSledecegKola.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        terminSledecegKola.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        vremeDoSledecegKola.translatesAutoresizingMaskIntoConstraints = false
        vremeDoSledecegKola.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        vremeDoSledecegKola.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        vremeDoSledecegKola.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        vremeDoSledecegKola.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
    }

    
}



