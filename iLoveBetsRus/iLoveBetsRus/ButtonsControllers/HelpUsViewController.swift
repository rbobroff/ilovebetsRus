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
                var currentPhoneLangID = currentLangID
                //вычитаем 3 символа, чтобы получилось только ru (ru-US)
                let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
                currentPhoneLangID.removeSubrange(range)
                //если русский язык, отображать ЗАГОЛОВОК по-русски
                if currentPhoneLangID == "ru" {
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
        

        
        //переменная "helpLink" отвечает за ссылку на раздел "Справка"
        var helpLink = "https://yandex.ru/"
        //проверка языка локализации!!!!!!!!!!
        let locale = NSLocale.current
        let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
        var currentPhoneLangID = currentLangID
        //вычитаем 3 символа, чтобы получилось только ru (ru-US)
        let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
        currentPhoneLangID.removeSubrange(range)
        //в зависимости от языка телефона загружается ссылка
           // if currentLangID == "ru-RU"
              if currentPhoneLangID == "ru"{
        helpLink = "https://ilovebets.ru/mobileApp/iOS/helpRus/"
            } else {
        helpLink = "https://yandex.ru/"
        }
        
        

       let URL = NSURL(string: helpLink)
       webView.load(NSURLRequest(url: URL! as URL) as URLRequest)
        
    }
    

    //для UIRefreshControl
    //https://spin.atomicobject.com/2018/12/01/reload-wkwebview/
    @objc
    func refreshWebView(_ sender: UIRefreshControl) {
        
        //// The first time load web page fail at offline. Then webview.url be nil. Try the following code to refresh the view
        
        
        //переменная "helpLink" отвечает за ссылку на раздел "Справка"
        var helpLink = "https://yandex.ru/"
        //проверка языка локализации!!!!!!!!!!
        let locale = NSLocale.current
        let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
        var currentPhoneLangID = currentLangID
        //вычитаем 3 символа, чтобы получилось только ru (ru-US)
        let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
        currentPhoneLangID.removeSubrange(range)
        //в зависимости от языка телефона загружается ссылка
           // if currentLangID == "ru-RU"
              if currentPhoneLangID == "ru"{
        helpLink = "https://ilovebets.ru/mobileApp/iOS/helpRus/"
            } else {
        helpLink = "https://yandex.ru/"
        }
        
        
        
        let URL = NSURL(string: helpLink)
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
