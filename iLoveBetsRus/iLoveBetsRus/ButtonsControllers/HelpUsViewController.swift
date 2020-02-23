//
//  HelpUsViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 22.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import WebKit
import UIKit

class HelpUsViewController: UIViewController, WKUIDelegate {

    //добавление заголовка
    override func viewWillAppear(_ animated: Bool) {
            //проверка языка локализации!!!!!!!!!!
            let locale = NSLocale.current
            let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
            //если русский язык, отображать ЗАГОЛОВОК по-русски
            if currentLangID == "ru-RU" {
        self.navigationItem.title = "#Справка"
           //добавление строки навигации при загрузке ViewControllera
            } else{
                self.navigationItem.title = "#Help"
        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
  //для UIRefreshControl
  //https://spin.atomicobject.com/2018/12/01/reload-wkwebview/
  let refreshControl = UIRefreshControl()
  refreshControl.addTarget(self, action: #selector(refreshWebView(_:)), for: UIControl.Event.valueChanged)
  webView.scrollView.addSubview(refreshControl)
  webView.scrollView.bounces = true
        

        

       let URL = NSURL(string: "https://ilovebets.ru/mobileApp/iOS/helpRus/")
       webView.load(NSURLRequest(url: URL! as URL) as URLRequest)
        
    }
    

    //для UIRefreshControl
    //https://spin.atomicobject.com/2018/12/01/reload-wkwebview/
    @objc
    func refreshWebView(_ sender: UIRefreshControl) {
        
        //// The first time load web page fail at offline. Then webview.url be nil. Try the following code to refresh the view
        //
        let URL = NSURL(string: "https://ilovebets.ru/mobileApp/iOS/helpRus/")
        webView.load(NSURLRequest(url: URL! as URL) as URLRequest)
        ////При первой загрузке веб-страницы происходит сбой в автономном режиме. Тогда webview.url будет нулевым. Попробуйте следующий код, чтобы обновить вид.
        //Для этого ввожу условие обновить вид или загрузить повторно
        
        if webView.url != nil {
            webView?.reload()
                }else{
            webView.load(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        sender.endRefreshing()
    }
    


}
