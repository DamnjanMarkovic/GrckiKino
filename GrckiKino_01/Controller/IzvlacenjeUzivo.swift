//
//  IzvlacenjeUzivo.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 28.1.21..
//

import UIKit
import WebKit

class IzvlacenjeUzivo: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    var webViewView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Uzivo"
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        postaviUI()
        postaviStranicu()

    }
    
    func postaviUI() {
        view.addSubview(webViewView)
        webViewView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: view.width, height: view.width)
        
    }
    
    
    ///s obzirom da se stanica ne uklapa najbolje, postavljena je u poseban UI, radi lakseg podesavanja pozicije
    
    func postaviStranicu() {
        
        let url = URL(string: Constants.apiUzivoIzvlacenje)
        guard let unwrappedUrl = url else { return }
        let request = URLRequest(url: unwrappedUrl)
        let webView = WKWebView(frame: self.webViewView.frame)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight] 
        webView.navigationDelegate = self
        
        webView.load(request)
        self.webViewView.addSubview(webView)
        
    }
    
    
    
}

