//
//  TimeFunctions.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 27.1.21..
//

import Foundation

class TimeFunctions {
    
    static func vratiVremeSada()->Int64{
        return  Int64(Date().timeIntervalSince1970 * 1000)
    }

    
    static func vratiVremeUMinutima(timeAsTimestamp: Double) -> String {
        let truncatedTime = Int(timeAsTimestamp / 1000)
        let date = Date(timeIntervalSince1970: TimeInterval(truncatedTime))
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.local
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    static func vratiDan(timeAsTimestamp: Double) -> String {
        let truncatedTime = Int(timeAsTimestamp / 1000)
        let date = Date(timeIntervalSince1970: TimeInterval(truncatedTime))
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.local
        formatter.dateFormat = "dd. MM. y"
        return formatter.string(from: date)
    }
    
    static func vratiIzabraniDan(timeAsTimestamp: Double) -> String {
        let truncatedTime = Int(timeAsTimestamp / 1000)
        let date = Date(timeIntervalSince1970: TimeInterval(truncatedTime))
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.local
        formatter.dateFormat = "dd. MM. y"
        return formatter.string(from: date)
    }
    
    
}
