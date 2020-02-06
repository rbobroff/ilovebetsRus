//
//  AboutUsViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 18.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import WebKit
import UIKit

class AboutUsViewController: UIViewController, WKUIDelegate {

    //добавление заголовка
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "#О нас"
              //добавление строки навигации при загрузке ViewControllera
    self.navigationController?.isNavigationBarHidden = false
    }
    
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

        //для UIRefreshControl
        //https://spin.atomicobject.com/2018/12/01/reload-wkwebview/
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshWebView(_:)), for: UIControl.Event.valueChanged)
        webView.scrollView.addSubview(refreshControl)
        webView.scrollView.bounces = true
        
                
    let URL = NSURL(string: "https://ilovebets.ru/mobileApp/iOS/aboutUsRus/")
    webView.load(NSURLRequest(url: URL! as URL) as URLRequest)
        
    }
    

    //для UIRefreshControl
    //https://spin.atomicobject.com/2018/12/01/reload-wkwebview/
    @objc
    func refreshWebView(_ sender: UIRefreshControl) {
        webView?.reload()
        sender.endRefreshing()
    }
    


}
