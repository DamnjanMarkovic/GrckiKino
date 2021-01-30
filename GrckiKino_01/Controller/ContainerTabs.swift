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
            
            let narednaKola = constructNavController(unselectedImage: UIImage(systemName: "text.justify")!, selectedImage: UIImage(systemName: "icloud.and.arrow.down")!, rootViewController: NarednaKola())
            
            let kolo = constructNavController(unselectedImage: UIImage(systemName: "text.justify")!, selectedImage: UIImage(systemName: "text.justify")!, rootViewController: KoloPoID_u())
            
            let kolaZadan = constructNavController(unselectedImage: UIImage(systemName: "person.3")!, selectedImage: UIImage(systemName: "person.3")!, rootViewController: DanIzvlacenjaVC())
            
            
            let uzivo = constructNavController(unselectedImage: UIImage(systemName: "person.badge.plus")!, selectedImage: UIImage(systemName: "person.badge.plus")!, rootViewController: IzvlacenjeUzivo())
            
            
            let igre = constructNavController(unselectedImage: UIImage(systemName: "square.and.pencil")!, selectedImage: UIImage(systemName: "square.and.pencil")!, rootViewController: DodatneIgre())

            
            narednaKola.title = "naredna kola"
            kolo.title = "Kolo"
            kolaZadan.title = "Kola za dan"
            uzivo.title = "Uzivo"
            igre.title = "Igre"
            
            viewControllers = [narednaKola, kolo, kolaZadan, uzivo, igre]
            tabBar.tintColor = .blue
            
        }
        

}


