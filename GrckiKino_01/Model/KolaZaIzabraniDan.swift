//
//  ZavrsenoKolo.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 29.1.21..
//

import Foundation


struct KolaZaIzabraniDan: Decodable {
    let content: [ZavrsenoKolo]
}


struct ZavrsenoKolo: Decodable {
    
    
    let gameId: Int
    let drawId: Int
    let drawTime: Double
    let status: String
    let drawBreak: Int
    let visualDraw: Int
    let pricePoints: PricePoints
    let winningNumbers: WinningNumbers
    

}

struct WinningNumbers: Decodable {
    
    let list: [Int]

    
}









