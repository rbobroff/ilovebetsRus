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

                
    let URL = NSURL(string: "https://ilovebets.ru/myApp2019/ru/aboutUsRus/")
    webView.load(NSURLRequest(url: URL! as URL) as URLRequest)
        
        

    }
    



}
