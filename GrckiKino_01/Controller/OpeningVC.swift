//
//  OpeningVC.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 29.1.21..
//

import UIKit

class OpeningVC: UIViewController {

    
    // MARK: - Properties
    let ulazUIgruButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        let imageNormal:UIImage? = UIImage(named: "tombola")
        button.layer.cornerRadius = 15.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 2.0

        button.setBackgroundImage(imageNormal, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(idemoNaIgru), for: .touchUpInside)
        button.clipsToBounds = true

        return button
    }()
    
    
    
    var naslovIgre: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20)
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 3.0
        label.numberOfLines = 0
        label.layer.backgroundColor = UIColor.blue.cgColor
        return label
    }()
    
    
    let lineInBetween: UIView = {
        let lineVIew = UIView()
        lineVIew.backgroundColor = .blue
        return lineVIew
    }()
    
    
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        setUI()
    }
    
    func setUI() {
        
        naslovIgre.text = "GRCKI KINO"
        naslovIgre.frame = CGRect(x: view.width/4, y: view.height/2, width: view.width/2, height: 100)
        lineInBetween.frame = CGRect(x: 10, y: naslovIgre.top - 35, width: view.width-20, height: 1)
        ulazUIgruButton.frame = CGRect(x: view.width/4, y: view.height/4, width: view.width/2,height: 100)

        
        view.addSubview(naslovIgre)
        view.addSubview(lineInBetween)
        view.addSubview(ulazUIgruButton)
    }
    
    @objc func idemoNaIgru() {
        
        let mainTabVC = ContainerTabs()
        mainTabVC.modalPresentationStyle = .overFullScreen
        self.present(mainTabVC, animated: false)

    }

    


}
