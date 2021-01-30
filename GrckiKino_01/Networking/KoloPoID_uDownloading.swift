//
//  KoloPoID_uDownloadingStruct.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 30.1.21..
//

import UIKit

protocol KoloPoID_uDownloadingingDelegate {
    func vratikoloPoID_uPrekoProtokola(_ koloDownloading: KoloPoID_uDownloading, koloPoIDju: ZavrsenoKolo, listaIzabranihBrojeva: [Int])
}



struct KoloPoID_uDownloading {
    
    var delegate: KoloPoID_uDownloadingingDelegate?
    
    
    func vratiKoloPoID_u(brojKola: Int, completition: @escaping ((_ success: Bool) -> ())) {
        
        let jsonParser = JSONParser()
        let url = URL (string: "\(Constants.apiRealizovanoKolo)/\(brojKola)/")
        jsonParser.downloadSingle(of: ZavrsenoKolo.self, from: url!) { (result) in
            switch result {
                
            case .failure(let error):
                if error is DataError {
                    print(error)
                } else {
                    print(error.localizedDescription)
                }
                print(error.localizedDescription)
                
            case .success(let koloPoIDju):
                DispatchQueue.main.async {
                    let listaIzabranihBrojeva = koloPoIDju.winningNumbers.list
                    self.delegate?.vratikoloPoID_uPrekoProtokola(self, koloPoIDju: koloPoIDju, listaIzabranihBrojeva: listaIzabranihBrojeva)
                    completition(true)
                }
            }
        }
    }
    
}




