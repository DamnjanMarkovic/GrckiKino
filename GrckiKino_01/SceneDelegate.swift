//
//  SceneDelegate.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 27.1.21..
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
               window = UIWindow(frame: windowScene.coordinateSpace.bounds)
               window?.windowScene = windowScene
               let openingPage = OpeningPage()
               window?.rootViewController = openingPage
               window?.makeKeyAndVisible()
               guard let _ = (scene as? UIWindowScene) else { return }
    }
}
