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
            
            let talon = constructNavController(unselectedImage: UIImage(systemName: "text.justify")!, selectedImage: UIImage(systemName: "text.justify")!, rootViewController: Talon())
            let izvlacenjeUzivo = constructNavController(unselectedImage: UIImage(systemName: "person.badge.plus")!, selectedImage: UIImage(systemName: "person.badge.plus")!, rootViewController: IzvlacenjeUzivo())
            
            let rezultatiIzvlacenja = constructNavController(unselectedImage: UIImage(systemName: "person.3")!, selectedImage: UIImage(systemName: "person.3")!, rootViewController: RezultatiIzvlacenja())
            let dodatneIgre = constructNavController(unselectedImage: UIImage(systemName: "square.and.pencil")!, selectedImage: UIImage(systemName: "square.and.pencil")!, rootViewController: DodatneIgre())

            talon.title = "talon"
            
            dodatneIgre.title = "igre"
            rezultatiIzvlacenja.title = "rezultati"
            izvlacenjeUzivo.title = "uzivo"
            
            viewControllers = [talon, izvlacenjeUzivo, rezultatiIzvlacenja, dodatneIgre]
            tabBar.tintColor = .blue
            
        }
        

}


