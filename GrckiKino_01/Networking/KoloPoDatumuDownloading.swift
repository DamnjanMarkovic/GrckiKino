//
//  KoloPoDatumuDownloading.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 30.1.21..
//

import UIKit


protocol KolaPoDatumuDownloadingingDelegate {
    func vratikolaPoDatumuPrekoProtokola(_ koloPoDatumuDownloading: KoloPoDatumuDownloading, kolaZaIzabraniDan: KolaZaIzabraniDan, kolaUDanu: [ZavrsenoKolo])
}

struct KoloPoDatumuDownloading {
    
    
    var delegate: KolaPoDatumuDownloadingingDelegate?
    
    
    func vratiKolaPoDatumu(datum: String, completition: @escaping ((_ success: Bool) -> ())) {
        
        let url = URL (string: "\(Constants.apiRealizovanoKolo)draw-date/\(datum)/\(datum)")
        guard let unwrappedUrl = url else { return }
        
        let jsonParser = JSONParser()

        jsonParser.downloadSingle(of: KolaZaIzabraniDan.self, from: unwrappedUrl) { (result) in
            switch result {
                
            case .failure(let error):
                if error is DataError {
                    print(error)
                } else {
                    print(error.localizedDescription)
                }
                print(error.localizedDescription)
                
            case .success(let kolaZaIzabraniDan):
                DispatchQueue.main.async {
                    self.delegate?.vratikolaPoDatumuPrekoProtokola(self, kolaZaIzabraniDan: kolaZaIzabraniDan, kolaUDanu: kolaZaIzabraniDan.content)
                    completition(true)
    
                }
            }
        }
        
        
        

    }
    
    
}


//var request = URLRequest(url: url!)
//request.httpMethod = "GET"
//let session = URLSession.shared
//let _: Void = session.dataTask(with: request) { (data, response, error) in
//    if error == nil {
//        do {
//            let kolaZaIzabraniDan = try JSONDecoder().decode(KolaZaIzabraniDan.self, from: data!)
//            DispatchQueue.main.async {
//                self.delegate?.vratikolaPoDatumuPrekoProtokola(self, kolaZaIzabraniDan: kolaZaIzabraniDan, kolaUDanu: kolaZaIzabraniDan.content)
//                completition(true)
//
//            }
//        }catch{
//            print(error.localizedDescription)
//        }
//    }
//}.resume()
