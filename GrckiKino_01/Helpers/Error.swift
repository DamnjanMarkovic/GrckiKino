//
//  Error.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 30.1.21..
//

import Foundation



enum DataError: Error {
    case invalidResponse
    case invalidData
    case decodingError
    case serverError
}
