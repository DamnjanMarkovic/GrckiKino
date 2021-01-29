//
//  Kolo.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 27.1.21..
//

import Foundation

struct Kolo: Decodable {

    let gameId: Int
    let drawId: Int
    let drawTime: Double
    let status: String
    let drawBreak: Int
    let visualDraw: Int
    let pricePoints: PricePoints
//    let prizeCategories: [PrizeCategories]
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

struct PrizeCategories: Decodable {
//    let id: Int
//    let divident: Double
//    let winners: Int
//    let distributed: Double
//    let jackpot: Double
//    let fixed: Double
//    let categoryType: Int
    let gameType: String
}

//"id": 1,
//"divident": 0.0,
//"winners": 0,
//"distributed": 0.0,
//"jackpot": 0.0,
//"fixed": 1.0,
//"categoryType": 2,
//"gameType": "KinoBonus"


struct WagerStatistics: Decodable {
    let columns: Int
    let wagers: Int
    let addOn: [AddOn]
}
