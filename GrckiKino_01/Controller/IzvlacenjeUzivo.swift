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
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Uzivo"
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .blue
        

//        let url = URL(string: "https://www.google.com")!
        

        let url = URL(string: "https://ds.opap.gr/web_kino/kinoIframe.html?link=https://ds.opap.gr/web_kino/kino/html/Internet_PRODUCTION/KinoDraw_201910.html&resolution=847x500")!

        
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        navigationController?.navigationBar.isHidden = true


    }
}

