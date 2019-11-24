//
//  StatisticsViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 22.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import WebKit
import UIKit

class StatisticsViewController: UIViewController, WKUIDelegate {

    //добавление заголовка
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "#Статистика"
    }
    
    var webView: WKWebView!

    override func loadView() {
        super.loadView()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let URL = NSURL(string: "https://ilovebets.ru/myApp2019/ru/StatisticsRus/currentStatRus")
        webView.load(NSURLRequest(url: URL! as URL) as URLRequest)
       
    }
    



}
