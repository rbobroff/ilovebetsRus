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
        
        
        //закомментировать после скриншотов
        // self.navigationItem.title = "#Statistics"
        //v.2.3 - закоментировано, тк настроена анимация для navigationBar
        // self.navigationController?.isNavigationBarHidden = false
        //закомментировать после скриншотов
        
        
        
        
        //снять комментарий после скриншотов
        
        //v.2.3
        //проверка языка локализации!!!!!!!!!!
        /*
        let locale = NSLocale.current
        let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
        var currentPhoneLangID = currentLangID
        //вычитаем 3 символа, чтобы получилось только ru (ru-US)
        let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
        currentPhoneLangID.removeSubrange(range)
        //если русский язык, отображать ЗАГОЛОВОК по-русски
 */
 
        //v.2.3
        //    if currentLangID == "ru-RU"
    if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
        self.navigationItem.title = "#Статистика"
       //добавление строки навигации при загрузке ViewControllera
    } else {
        self.navigationItem.title = "#Statistics"
    }
        
        
        
        //v.2.3 - строка ниже, чтобы срабатывала анимация скрытия navigationBar. возвращаем в первоначальное состояние. также прописана строка на viewController
        self.navigationController?.navigationBar.transform = .identity
        self.navigationController?.isNavigationBarHidden = false
        //v.2.3 для анмированного удаления navigationBar
        self.navigationController?.navigationBar.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationController?.navigationBar.alpha = 1
           })
        
        
        
        
        } //конец функции viewWillAppear
        
        
        
        //снять комментарий после скриншотов
        
        
    
    
    
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
        
        
        
        
        //снять комментарий после скриншотов

        //переменная "statisticLink" отвечает за ссылку на статистику
        var statisticLink = "https://ilovebets.ru/mobileApp/iOS/StatisticsEng/"
       
        //v.2.3
        //проверка языка локализации!!!!!!!!!!
       /*
        let locale = NSLocale.current
        let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
        var currentPhoneLangID = currentLangID
        //вычитаем 3 символа, чтобы получилось только ru (ru-US)
        let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
        currentPhoneLangID.removeSubrange(range)
 */
        //v.2.3
        //в зависимости от языка телефона загружается ссылка
        // if currentLangID == "ru-RU"
        if currentPhoneLangID == "ru" || currentPhoneLangID == "uk"{
            statisticLink = "https://ilovebets.ru/mobileApp/iOS/StatisticsRus/"
        } else {
            statisticLink = "https://ilovebets.ru/mobileApp/iOS/StatisticsEng/"
        }
 
        
        //снять комментарий после скриншотов
     
    
        
        //закомметировать после скриншотов
       // var statisticLink = "https://ilovebets.ru/mobileApp/iOS/StatisticsEng/"
        //закомметировать после скриншотов
        
        
        
        let URL = NSURL(string: statisticLink)
        webView.load(NSURLRequest(url: URL! as URL) as URLRequest)
        
        
}
    
    //для UIRefreshControl
    //https://spin.atomicobject.com/2018/12/01/reload-wkwebview/
    @objc
    func refreshWebView(_ sender: UIRefreshControl) {
        
        //// The first time load web page fail at offline. Then webview.url be nil. Try the following code to refresh the view
        
        
        
        //снять комментарий после скриншотов
        
        //v.2.3
        //переменная "statisticLink" отвечает за ссылку на статистику
        
        var statisticLink = "https://ilovebets.ru/mobileApp/iOS/StatisticsEng/"
        
        //v.2.3
        /*
        //проверка языка локализации!!!!!!!!!!
        let locale = NSLocale.current
        let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
        var currentPhoneLangID = currentLangID
        //вычитаем 3 символа, чтобы получилось только ru (ru-US)
        let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
        currentPhoneLangID.removeSubrange(range)
        //в зависимости от языка телефона загружается ссылка
     */
        
        //v.2.3
        //  if currentLangID == "ru-RU" {
        if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
            statisticLink = "https://ilovebets.ru/mobileApp/iOS/StatisticsRus/"
        } else {
            statisticLink = "https://ilovebets.ru/mobileApp/iOS/StatisticsEng/"
        }
        
        
        //снять комментарий после скриншотов
        
        
        
        //закомментировать после скриншотов
        //var statisticLink = "https://ilovebets.ru/mobileApp/iOS/StatisticsEng/"
        //закомментировать после скриншотов
        
        
        let URL = NSURL(string: statisticLink)
        webView.load(NSURLRequest(url: URL! as URL) as URLRequest)
        ////При первой загрузке веб-страницы происходит сбой в автономном режиме. Тогда webview.url будет нулевым. Попробуйте следующий код, чтобы обновить вид.
        //Для этого ввожу условие обновить вид или загрузить повторно
        
        if webView.url != nil {
            webView?.reload()
        } else {
            webView.load(NSURLRequest(url: URL! as URL) as URLRequest)
        }
            sender.endRefreshing()
        }
    
    
    
}
