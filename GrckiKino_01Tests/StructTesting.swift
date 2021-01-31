//
//  StructTesting.swift
//  GrckiKino_01Tests
//
//  Created by Damnjan Markovic on 30.1.21..
//

import Foundation

import XCTest
@testable import GrckiKino_01

class StructTesting: XCTestCase {
    
    func testProveriListu() {
        
        var list = [10, 20, 30]
        list.removeAll()
        
        let winningNumbers = WinningNumbers(list: list)
        XCTAssertEqual(winningNumbers.list.count, 0, "lista mora biti prazna")
    }
    
    
    
    
    
}
