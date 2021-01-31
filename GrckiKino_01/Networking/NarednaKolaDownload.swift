//
//  KoloDownloading.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 30.1.21..
//
import UIKit


protocol NarednaKolaDownloadingDelegate {
    func vratiNarednaKolaPrekoProtokola(_ koloDownloading: NarednaKolaDownload, narednaKola: [NarednoKolo])
}



struct NarednaKolaDownload {
    
    
    var delegate: NarednaKolaDownloadingDelegate?    
    
    
    func vratiNarednaKola(completition: @escaping ((_ success: Bool) -> ())) {
        
        let url = URL (string: Constants.apiPregledNarednihKola)
        let jsonParser = JSONParser()
        
        guard let unwrappedUrl = url else { return }
        
        jsonParser.downloadList(of: NarednoKolo.self, from: unwrappedUrl) { (result) in
            switch result {
                
            case .failure(let error):
                if error is DataError {
                    print(error)
                } else {
                    print(error.localizedDescription)
                }
                print(error.localizedDescription)
                
            case .success(let narednaKola):
                DispatchQueue.main.async {
                    self.delegate?.vratiNarednaKolaPrekoProtokola(self, narednaKola: narednaKola)
                    completition(true)
                    
                }
            }
        }
    }

}




