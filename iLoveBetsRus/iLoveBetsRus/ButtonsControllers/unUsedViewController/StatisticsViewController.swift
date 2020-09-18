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
        
        //v.3.2
        //заголовок по умолчанию
         self.navigationItem.title = "#Statistics"
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
                  if currentPhoneLangID == "ru"     {
                    self.navigationItem.title = "#Статистика"
      
                  }
    
                  //v.3.2
                  //2) арабский
                  else if currentPhoneLangID == "ar"{
                       self.navigationItem.title = "الإحصاء"
                      
                  }
                  //3) Венгерский = hu
                  else if currentPhoneLangID == "hu"{
                       self.navigationItem.title = "#Statisztika"
                  }
                  //4) Вьетнамский = vi
                  else if currentPhoneLangID == "vi"{
                       self.navigationItem.title = "#Số liệu thống kê"
                      
                  }
                  //5) Греческий = el
                  else if currentPhoneLangID == "el"{
                       self.navigationItem.title = "#Στατιστική"
                  }
                  //6) Датский = da
                  else if currentPhoneLangID == "da"{
                       self.navigationItem.title = "#Statistikker"
                  }
                  //7) Иврит = he
                  else if currentPhoneLangID == "he"{
                       self.navigationItem.title = "סטטיסטיקה"
                  }
                  //8) Индонезийский = id
                  else if currentPhoneLangID == "id"{
                       self.navigationItem.title = "#Statistik"
                  }
                  //9) Испанский = es
                  else if currentPhoneLangID == "es"{
                       self.navigationItem.title = "#Estadísticas"
                  }
                  //10) Итальянский = it
                  else if currentPhoneLangID == "it"{
                       self.navigationItem.title = "#Statistica"
                  }
                  //11) Каталанский = ca
                  else if currentPhoneLangID == "ca"{
                       self.navigationItem.title = "#Estadístiques"
                  }
                  //12) Китайский = zh
                  else if currentPhoneLangID == "zh"{
                       self.navigationItem.title = "#統計"
                    
                  }
                  //13) Корейский = ko
                  else if currentPhoneLangID == "ko"{
                       self.navigationItem.title = "#통계"
                  }
                  //14) Малайский = ms
                  else if currentPhoneLangID == "ms"{
                       self.navigationItem.title = "#Statistik"
                  }
                  //15) Немецкий = de
                  else if currentPhoneLangID == "de"{
                       self.navigationItem.title = "#Statistiken"
                  }
                  //16) Нидерландский = nl
                  else if currentPhoneLangID == "nl"{
                       self.navigationItem.title = "#Statistieken"
                  }
                  //17) Норвежский = nb
                  else if currentPhoneLangID == "nb"{
                       self.navigationItem.title = "#Statistikk"
                  }
                  //18) Польский = pl
                  else if currentPhoneLangID == "pl"{
                       self.navigationItem.title = "#Statystyka"
                  }
                  //19) Португальский = pt
                  else if currentPhoneLangID == "pt"{
                       self.navigationItem.title = "#Estatisticas"
                  }
                  //20) Румынский = ro
                  else if currentPhoneLangID == "ro"{
                       self.navigationItem.title = "#Statistici"
                  }
                  //21) Русский = ru
                  
                  //22) Словацкий = sk
                  else if currentPhoneLangID == "sk"{
                       self.navigationItem.title = "#Štatistik"
                  }
                  //23) Тайский = th
                  else if currentPhoneLangID == "th"{
                       self.navigationItem.title = "#สถิติ"
                  }
                  //24) Турецкий = tr
                  else if currentPhoneLangID == "tr"{
                       self.navigationItem.title = "#İstatistik"
                  }
                  //25) Украинский = uk
                  else if currentPhoneLangID == "uk"{
                       self.navigationItem.title = "#Статистика"
                  }
                  //26) Финский = fi
                  else if currentPhoneLangID == "fi"{
                       self.navigationItem.title = "#Tilastot"
                  }
                  //27) Французский = fr
                  else if currentPhoneLangID == "fr"{
                       self.navigationItem.title = "#Statistiques"
                  }
                  //28) Хинди = hi
                  else if currentPhoneLangID == "hi"{
                       self.navigationItem.title = "#सांख्यिकी"
                  }
                  //29) Хорватский = hr
                  else if currentPhoneLangID == "hr"{
                       self.navigationItem.title = "#Statistika"
                  }
                  //30) Чешский = cs
                  else if currentPhoneLangID == "cs"{
                       self.navigationItem.title = "#Statistika"
                  }
                  //31) Шведский = sv
                  else if currentPhoneLangID == "sv"{
                       self.navigationItem.title = "#Statistik"
                  }
                  //32) Японский = ja
                  else if currentPhoneLangID == "ja"{
                       self.navigationItem.title = "#統計"
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

        //переменная "statisticLink" отвечает за ссылку на статистику - по умолчанию ссылка
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
            //for test
            //statisticLink = "https://ilovebets.ru//mobileApp/iOS/Localization/forTest/statistics/"
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
