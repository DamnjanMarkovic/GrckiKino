//
//  Kolo.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 27.1.21..
//

import Foundation

struct NarednoKoloLista: Decodable {
    let narednaKola: [NarednoKolo]
}


struct NarednoKolo: Decodable {

    
    let gameId: Int
    let drawId: Int
    let drawTime: Double
    let status: String
    let drawBreak: Int
    let visualDraw: Int
    let pricePoints: PricePoints
    let wagerStatistics: WagerStatistics
    
    
}


struct PricePoints: Decodable {
    let addOn: [AddOn]
    let amount: Double
}

struct AddOn: Decodable {
    let amount: Double
    let gameType: String
}


struct WagerStatistics: Decodable {
    let columns: Int
    let wagers: Int
    let addOn: [AddOn]
}
