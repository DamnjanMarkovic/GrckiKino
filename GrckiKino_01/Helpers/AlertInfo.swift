//
//  AlertInfo.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 27.1.21..
//

import UIKit

class AlertInfo {
    
    static func alert(message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: "INFORMATION", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(action)
        return alert
    }
}
