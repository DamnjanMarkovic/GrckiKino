//
//  DatabaseManager.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 27.1.21..
//

import UIKit
final class DatabaseManager {
    
    static let shared = DatabaseManager()
    var apiLink: String?
    var koloKliknuto: Kolo?
    var zavrsenoKolo: ZavrsenoKolo?
    
}

extension DatabaseManager {
    
//    func vratiNarednaKola(userArrived: User, completition: @escaping (Result<[TeamMember], Error>) -> Void) {
//
//        let jwt = userArrived.jwt
//        let apiLink = AuthorizationManager.shared.apiLink
//        let url = URL(string: "\(apiLink!)/rest/users/getUsersInTeam/\(userArrived.id_team)")
//        var request = URLRequest(url: url!)
//        request.httpMethod = "GET"
//        request.addValue("Bearer " + jwt, forHTTPHeaderField: "Authorization")
//        let session = URLSession.shared
//        let _: Void = session.dataTask(with: request) { (data, response, error) in
//            var allTeamMembers = [TeamMember]()
//            if error == nil {
//                do {
//                    allTeamMembers = try JSONDecoder().decode([TeamMember].self, from: data!)
//                    DispatchQueue.main.async {
//                        completition(.success(allTeamMembers))
//                    }
//                }catch{
//                    completition(.failure(Errors.failedToRetrieveUsers))
//                }
//            } else {
//                completition(.failure(Errors.failedToRetrieveUsers))
//            }
//        }.resume()
//
//    }
}
