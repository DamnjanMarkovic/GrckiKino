//
//  Constants.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 27.1.21..
//

import UIKit

struct Constants {
    

    static var fontSvuda = UIFont.systemFont(ofSize: 20)
    static var fontKvote = UIFont.systemFont(ofSize: 14)
    static var fontBrojevi = UIFont.systemFont(ofSize: 30)
    
    
    static func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1)

    }
    
    
    static var tamnoPlava = UIColor(red: (21/255.0), green: (42/255.0), blue: (175/255.0), alpha: 1.0)
    static var neboPlava = UIColor(red: (136/255.0), green: (150/255.0), blue: (245/255.0), alpha: 1.0)
    
    
    
    
    static var cornerRadiusTalonCell: CGFloat = 2.0
    static var colorOriginalTalonCell: UIColor = .black
    static var borderColorOriginalTalonCell = UIColor.black.cgColor
    
    
    static var apiPregledNarednihKola = "https://api.opap.gr/draws/v3.0/1100/upcoming/20"
    static var apiRealizovanoKolo = "https://api.opap.gr/draws/v3.0/1100/"
    
    static var apiUzivoIzvlacenje = "https://ds.opap.gr/web_kino/kinoIframe.html?link=https://ds.opap.gr/web_kino/kino/html/Internet_PRODUCTION/KinoDraw_201910.html&resolution=847x500"
}



