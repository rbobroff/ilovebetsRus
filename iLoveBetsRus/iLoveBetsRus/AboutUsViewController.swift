//
//  AboutUsViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 18.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import UIKit
import WebKit
class AboutUsViewController: UIViewController, WKUIDelegate {

 var webView: WKWebView!

 override func loadView() {
     super.loadView()
     let webConfiguration = WKWebViewConfiguration()
     webView = WKWebView(frame: .zero, configuration: webConfiguration)
     webView.uiDelegate = self
     view = webView
    }
    
    
 //   let urlMy = URL(string: "https://ilovebets.ru/app/currentStatRus/")
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //https://ilovebets.ru/app/aboutUsRus/
        //https://ilovebets.ru/app/helpRus/
        //https://ilovebets.ru/app/currentStatRus/
                
                let URL = NSURL(string: "https://ilovebets.ru/app/currentStatRus/")
                webView.load(NSURLRequest(url: URL! as URL) as URLRequest)
    }
    



}
