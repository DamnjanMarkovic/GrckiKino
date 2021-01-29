//
//  DodatneIgre.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 28.1.21..
//

import UIKit

class DodatneIgre: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        navigationController?.navigationBar.isHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .close, target: self, action: #selector(goBack))

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    @objc func goBack() {

        let nextVC = OpeningPage()
        let navController = UINavigationController(rootViewController: nextVC)
        navController.modalPresentationStyle = .overFullScreen
        self.present(navController, animated: false)
        }

    @objc func handleMenuToggle() {


    }
    


}
