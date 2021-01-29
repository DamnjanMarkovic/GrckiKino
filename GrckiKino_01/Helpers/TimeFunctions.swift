//
//  TimeFunctions.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 27.1.21..
//

import Foundation

class TimeFunctions {
    
    
    static func vratiVremeUMinutima(timeAsTimestamp: Double) -> String {
        let truncatedTime = Int(timeAsTimestamp / 1000)
        let date = Date(timeIntervalSince1970: TimeInterval(truncatedTime))
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.local
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    
    
    
    
    
    static func getSchedulledTimeInDateFormat(timeAsTimestamp: Double) -> String {
        let truncatedTime = Int(timeAsTimestamp / 1000)
        let date = Date(timeIntervalSince1970: TimeInterval(truncatedTime))
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.local
//        formatter.timeZone = TimeZone(abbreviation: "UTC+2")
        //        formatter.dateFormat = "HH:mm E, d MMM y"
        formatter.dateFormat = "HH:mm, E d MMM y"
        return formatter.string(from: date)
    }
    
    static func getSchedulledTimeInDateFormatForNotifications(timeAsTimestamp: Double) -> String {
        let truncatedTime = Int(timeAsTimestamp / 1000)
        let date = Date(timeIntervalSince1970: TimeInterval(truncatedTime))
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.local
//        formatter.timeZone = TimeZone(abbreviation: "UTC")
        //        formatter.dateFormat = "HH:mm E, d MMM y"
        formatter.dateFormat = "HH:mm, d MM y"      // 11:36, 21 08 2020
        return formatter.string(from: date)
    }
    
    static func getOnlyTimeFromDate(timeAsTimestamp: Double) -> String {
        let truncatedTime = Int(timeAsTimestamp / 1000)
        let date = Date(timeIntervalSince1970: TimeInterval(truncatedTime))
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.local
//        formatter.timeZone = TimeZone(abbreviation: "UTC+2")
        //        formatter.dateFormat = "HH:mm E, d MMM y"
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    
}


