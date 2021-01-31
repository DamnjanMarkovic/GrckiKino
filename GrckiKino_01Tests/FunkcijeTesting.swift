//
//  FunkcijeTesting.swift
//  GrckiKino_01Tests
//
//  Created by Damnjan Markovic on 31.1.21..
//

import Foundation
import XCTest
@testable import GrckiKino_01


class FunkcijeTesting: XCTestCase {
    
    var listaSvihBrojeva = [Int]()
    
    func ubaciBrojeveUListu() {
        for i in 1..<81 {
            listaSvihBrojeva.append(i)
        }
        
        XCTAssertEqual(listaSvihBrojeva.count, 80, "mora biti isto")
    }
    
    var listaIzabranihBrojeva = [Int]()

    func brojJeVecKliknut() -> Bool {
        if listaIzabranihBrojeva.count > 0 {
                return true
        }

        
        XCTAssertEqual(listaIzabranihBrojeva.count < 0, false, "mora biti isto")
        return false
    }
    
    
    
    
}
