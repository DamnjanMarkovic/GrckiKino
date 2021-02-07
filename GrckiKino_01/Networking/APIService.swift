//
//  APIService.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 7.2.21..
//

import UIKit


class APIService {
    
    
    func getDataFromURL (urlString : String , completion: @escaping (Data) -> Void) {
        
        guard let url = URL(string: urlString) else {
            print("Error getting url from string, UrlString: \(urlString)")
            return
        }
        
        let dataTask = URLSession.shared
        dataTask.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                
                //ovde mora errorHandle
                print("Error getting data, Error :  \(error!.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                //ovde mora errorHandle
                print("Error getting url response")
                return
            }
            print(response.statusCode)
            
            
            completion(data)
            
        }.resume()
        
    }
    
}
