//
//  testWebViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 16.09.2020.
//  Copyright © 2020 Roman Bobrov. All rights reserved.
//

//работа webView
//https://www.youtube.com/watch?v=2ArlCvtL33I&t=1s

import UIKit
import WebKit

class testWebViewController: UIViewController, WKNavigationDelegate {

    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var ActInd: UIActivityIndicatorView!
    
    
    
    
    //добавление заголовка
       override func viewWillAppear(_ animated: Bool) {
              
           //заголовок по умолчанию
           self.navigationItem.title = "#About Us"
           
           if currentPhoneLangID == "ru"       {
             self.navigationItem.title = "#О Нас"
              //добавление строки навигации при загрузке ViewControllera
           }

           //v.2.3 - строка ниже, чтобы срабатывала анимация скрытия navigationBar. возвращаем в первоначальное состояние. также прописана строка на viewController
           self.navigationController?.navigationBar.transform = .identity
           
           self.navigationController?.isNavigationBarHidden = false
           //v.2.3 для анмированного удаления navigationBar
           self.navigationController?.navigationBar.alpha = 0
           
           UIView.animate(withDuration: 0.3, animations: {
               self.navigationController?.navigationBar.alpha = 1
              })
        
        
        
        var aboutUsLink = "https://ilovebets.ru/mobileApp/iOS/Localization/AboutUs/en/"
        if currentPhoneLangID == "ru"     {
        aboutUsLink = "https://ilovebets.ru/mobileApp/iOS/Localization/AboutUs/ru/"
        }
        
        let url = URL(string: aboutUsLink)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        
        //ActivityIndicator during loading page
        webView.addSubview(ActInd)
        ActInd.startAnimating()
        webView.navigationDelegate = self
        ActInd.hidesWhenStopped = true
        
        
           } // конец функции ViewWillAppear
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //для UIRefreshControl
        //https://spin.atomicobject.com/2018/12/01/reload-wkwebview/
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshWebView(_:)), for: UIControl.Event.valueChanged)
        webView.scrollView.addSubview(refreshControl)
        webView.scrollView.bounces = true
        
        
        

        var aboutUsLink = "https://ilovebets.ru/mobileApp/iOS/Localization/AboutUs/en/"
        if currentPhoneLangID == "ru"     {
        aboutUsLink = "https://ilovebets.ru/mobileApp/iOS/Localization/AboutUs/ru/"
        }
        
        let url = URL(string: aboutUsLink)
        let request = URLRequest(url: url!)
        webView.load(request)
    
        //ActivityIndicator during loading page
        webView.addSubview(ActInd)
        ActInd.startAnimating()
        webView.navigationDelegate = self
        ActInd.hidesWhenStopped = true
    
    } //конец функции viewDidLoad
    
    
    
    
    //ActivityIndicator during loading page
     func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
         
         ActInd.stopAnimating()
         
     }
     
     func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
         
         ActInd.stopAnimating()
         
     }
     
     func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
         
         ActInd.startAnimating()
         
     }
    
    
    
    
    
    
    
    //для UIRefreshControl
    //https://spin.atomicobject.com/2018/12/01/reload-wkwebview/
    @objc
    func refreshWebView(_ sender: UIRefreshControl) {
        
        var aboutUsLink = "https://ilovebets.ru/mobileApp/iOS/Localization/AboutUs/en/"
    
        if currentPhoneLangID == "ru"     {
          aboutUsLink = "https://ilovebets.ru/mobileApp/iOS/Localization/AboutUs/ru/"
    }
    
    
        let url = URL(string: aboutUsLink)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        
        if webView.url != nil {
        webView?.reload()
        } else {
        webView.load(request)
        }
        sender.endRefreshing()
}
    
    

}
