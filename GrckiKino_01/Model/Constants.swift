//
//  Constants.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 27.1.21..
//

import UIKit

struct Constants {
    
    
    static func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1)

    }
    
    
    static var cornerRadiusTalonCell: CGFloat = 2.0
    static var colorOriginalTalonCell: UIColor = .black
    static var borderColorOriginalTalonCell = UIColor.black.cgColor
    
    
    
    static var colorChanging = true
    static let taskLifeExpectancyInDays = 30.0
    static let dayInMiliseconds = 86_400_000.00
    static let timeNowInMS = NSDate().timeIntervalSince1970


    
    static var apiposlednjeKolo = "https://api.opap.gr/draws/v3.0/1110/last-result-and-active?includeAnimation=true&status=results&status=pendingResults"
    
    static var apiPregledNarednihKola = "https://api.opap.gr/draws/v3.0/1100/upcoming/20"
    static var apiRealizovanoKolo = "https://api.opap.gr/draws/v3.0/1100/"
}

enum LayoutConstant {
    static let spacing: CGFloat = 3
    static let itemHeight: CGFloat = 410.0
}

