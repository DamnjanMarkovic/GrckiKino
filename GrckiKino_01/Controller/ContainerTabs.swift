//
//  ContainerTabs.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 28.1.21..
//

import UIKit

class ContainerTabs: UITabBarController, UITabBarControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = false
        configureViewControllers()
    }
    
    

    func constructNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
 
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        navController.navigationBar.tintColor = .darkGray 

        return navController
    }
        

    
        func configureViewControllers() {
            
            
            guard let slikaNarednaKola =  UIImage(systemName: "icloud.and.arrow.down"),
                  let slikaKolo = UIImage(systemName: "text.justify"),
                  let slikakolaZadan = UIImage(systemName: "person.3"),
                  let slikaUzivo = UIImage(systemName: "person.badge.plus"),
                  let slikaIgre = UIImage(systemName: "square.and.pencil")
            else { return }
            
            let narednaKola = constructNavController(unselectedImage: slikaNarednaKola, selectedImage: slikaNarednaKola, rootViewController: NarednaKola())
            
            let kolo = constructNavController(unselectedImage: slikaKolo, selectedImage: slikaKolo, rootViewController: KoloPoID_u())
            
            let kolaZadan = constructNavController(unselectedImage: slikakolaZadan, selectedImage: slikakolaZadan, rootViewController: DanIzvlacenjaVC())
            
            
            let uzivo = constructNavController(unselectedImage: slikaUzivo, selectedImage: slikaUzivo, rootViewController: IzvlacenjeUzivo())
            
            
            let igre = constructNavController(unselectedImage: slikaIgre, selectedImage: slikaIgre, rootViewController: DodatneIgre())

            
            narednaKola.title = "naredna kola"
            kolo.title = "Kolo"
            kolaZadan.title = "Kola za dan"
            uzivo.title = "Uzivo"
            igre.title = "Igre"
            
            viewControllers = [narednaKola, kolo, kolaZadan, uzivo, igre]
            tabBar.tintColor = .blue
            
        }
        

}


