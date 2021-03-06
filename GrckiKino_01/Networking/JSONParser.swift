//
//  JSONParser.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 30.1.21..
//

import Foundation



class JSONParser {
    
    
//    func decodeObjectFromData <T : Codable> (expectedType : T.Type , data : Data) -> T? {
//        var object : T? = nil
//        do {
//            object =  try JSONDecoder().decode(T.self, from: data)
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//        return object
//    }
    
    
    
    typealias result<T> = (Result<[T], Error>) -> Void
    
    typealias resultSingle<T> = (Result<T, Error>) -> Void
    
    
    func downloadList<T: Decodable>(of type: T.Type, from url: URL, completion: @escaping result<T>) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(DataError.invalidResponse))
                return
            }
            
            if 200 ... 299 ~= response.statusCode {
                if let data = data {
                    do {
                        let decodedData: [T] = try JSONDecoder().decode([T].self, from: data)
                        completion(.success(decodedData))
                    }
                    catch {
                        completion(.failure(DataError.decodingError))
                    }
                } else {
                    completion(.failure(DataError.invalidData))
                }
            } else {
                completion(.failure(DataError.serverError))
            }
        }.resume()
    }

    
    
    func downloadSingle<T: Decodable>(of type: T.Type, from url: URL, completion: @escaping resultSingle<T>) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(DataError.invalidResponse))
                return
            }
            
            if 200 ... 299 ~= response.statusCode {
                if let data = data {
                    do {
                        let decodedData: T = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    }
                    catch {
                        completion(.failure(DataError.decodingError))
                    }
                } else {
                    completion(.failure(DataError.invalidData))
                }
            } else {
                completion(.failure(DataError.serverError))
            }
        }.resume()
    }
}
