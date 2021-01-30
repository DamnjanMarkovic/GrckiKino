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
    
    
    
    
    
    
//    static func getSchedulledTimeInDateFormat(timeAsTimestamp: Double) -> String {
//        let truncatedTime = Int(timeAsTimestamp / 1000)
//        let date = Date(timeIntervalSince1970: TimeInterval(truncatedTime))
//        let formatter = DateFormatter()
//        formatter.timeZone = NSTimeZone.local
////        formatter.timeZone = TimeZone(abbreviation: "UTC+2")
//        //        formatter.dateFormat = "HH:mm E, d MMM y"
//        formatter.dateFormat = "HH:mm, E d MMM y"
//        return formatter.string(from: date)
//    }
//
//    static func getSchedulledTimeInDateFormatForNotifications(timeAsTimestamp: Double) -> String {
//        let truncatedTime = Int(timeAsTimestamp / 1000)
//        let date = Date(timeIntervalSince1970: TimeInterval(truncatedTime))
//        let formatter = DateFormatter()
//        formatter.timeZone = NSTimeZone.local
////        formatter.timeZone = TimeZone(abbreviation: "UTC")
//        //        formatter.dateFormat = "HH:mm E, d MMM y"
//        formatter.dateFormat = "HH:mm, d MM y"      // 11:36, 21 08 2020
//        return formatter.string(from: date)
//    }
//
//    static func getOnlyTimeFromDate(timeAsTimestamp: Double) -> String {
//        let truncatedTime = Int(timeAsTimestamp / 1000)
//        let date = Date(timeIntervalSince1970: TimeInterval(truncatedTime))
//        let formatter = DateFormatter()
//        formatter.timeZone = NSTimeZone.local
////        formatter.timeZone = TimeZone(abbreviation: "UTC+2")
//        //        formatter.dateFormat = "HH:mm E, d MMM y"
//        formatter.dateFormat = "HH:mm"
//        return formatter.string(from: date)
//    }
    
    
}

/*
 let isoDate = "2021-01-02"
 let dateFormatter = DateFormatter()
 dateFormatter.locale = Locale(identifier: "en_US_POSIX")
 dateFormatter.dateFormat = "yyyy-mm-dd"
 let date1 = dateFormatter.date(from:isoDate)!

 let isoDate2 = "2021-01-12"
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter.dateFormat = "yyyy-mm-dd"
 let date2 = dateFormatter.date(from:isoDate)!
 let formatDate = DateFormatter()
     formatDate.dateFormat = "yyyy-mm-dd"
 let drawDate1 = formatDate.string(from: date1)
 let drawDate2 = formatDate.string(from: date2)
 
 
//        var timeOdKad = vratiDatum(timeAsString: "2021-01-11T10:44:00+0000")
//        var timeDoKad = vratiDatum(timeAsString: "2021-04-13T10:44:00+0000")
 let url = URL (string: "https://api.opap.gr/draws/v3.0/1100/draw-date/\(drawDate1)/\(drawDate2)/")
//
 */


