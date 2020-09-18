//
//  HelpUsViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 22.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//



import UIKit
import WebKit


class HelpUsViewController: UIViewController, WKNavigationDelegate {


    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var ActInd: UIActivityIndicatorView!
    
    
    
    
    //добавление заголовка
       override func viewWillAppear(_ animated: Bool) {
              
           
        //заголовок по умолчанию
        self.navigationItem.title = "#Help"

        if currentPhoneLangID == "ru"     {
             self.navigationItem.title = "#Справка"
       
        }
        else if currentPhoneLangID == "ar"{
             self.navigationItem.title = "الأسئلة"
            
        }
        //3) Венгерский = hu
        else if currentPhoneLangID == "hu"{
             self.navigationItem.title = "#Kérdések"
        }
        //4) Вьетнамский = vi
        else if currentPhoneLangID == "vi"{
             self.navigationItem.title = "#Câu hỏi"
            
        }
        //5) Греческий = el
        else if currentPhoneLangID == "el"{
             self.navigationItem.title = "#Ερωτήσεις"
        }
        //6) Датский = da
        else if currentPhoneLangID == "da"{
             self.navigationItem.title = "#Spørgsmål"
        }
        //7) Иврит = he
        else if currentPhoneLangID == "he"{
             self.navigationItem.title = "שאלות"
        }
        //8) Индонезийский = id
        else if currentPhoneLangID == "id"{
             self.navigationItem.title = "#Pertanyaan"
        }
        //9) Испанский = es
        else if currentPhoneLangID == "es"{
             self.navigationItem.title = "#Preguntas"
        }
        //10) Итальянский = it
        else if currentPhoneLangID == "it"{
             self.navigationItem.title = "#Domande"
        }
        //11) Каталанский = ca
        else if currentPhoneLangID == "ca"{
             self.navigationItem.title = "#Preguntes"
        }
        //12) Китайский = zh
        else if currentPhoneLangID == "zh"{
              self.navigationItem.title = "#問題"
            
        }
        //13) Корейский = ko
        else if currentPhoneLangID == "ko"{
              self.navigationItem.title = "#질문"
        }
        //14) Малайский = ms
        else if currentPhoneLangID == "ms"{
              self.navigationItem.title = "#Soalan"
        }
        //15) Немецкий = de
        else if currentPhoneLangID == "de"{
              self.navigationItem.title = "#Fragen"
        }
        //16) Нидерландский = nl
        else if currentPhoneLangID == "nl"{
              self.navigationItem.title = "#Vragen"
        }
        //17) Норвежский = nb
        else if currentPhoneLangID == "nb"{
              self.navigationItem.title = "#Spørsmål"
        }
        //18) Польский = pl
        else if currentPhoneLangID == "pl"{
              self.navigationItem.title = "#Pytania"
        }
        //19) Португальский = pt
        else if currentPhoneLangID == "pt"{
               self.navigationItem.title = "#Questões"
        }
        //20) Румынский = ro
        else if currentPhoneLangID == "ro"{
              self.navigationItem.title = "#Întrebări"
        }
        //21) Русский = ru
        
        //22) Словацкий = sk
        else if currentPhoneLangID == "sk"{
              self.navigationItem.title = "#Otázky"
        }
        //23) Тайский = th
        else if currentPhoneLangID == "th"{
              self.navigationItem.title = "#คำถาม"
        }
        //24) Турецкий = tr
        else if currentPhoneLangID == "tr"{
              self.navigationItem.title = "#Sorular"
        }
        //25) Украинский = uk
        else if currentPhoneLangID == "uk"{
                self.navigationItem.title = "#Запитання"
               }
        //26) Финский = fi
        else if currentPhoneLangID == "fi"{
                self.navigationItem.title = "#Kysymykset"
               }
        //27) Французский = fr
        else if currentPhoneLangID == "fr"{
                self.navigationItem.title = "#Des questions"
               }
        //28) Хинди = hi
        else if currentPhoneLangID == "hi"{
               self.navigationItem.title = "#प्रशन"
               }
        //29) Хорватский = hr
        else if currentPhoneLangID == "hr"{
                self.navigationItem.title = "#Pitanja"
               }
        //30) Чешский = cs
        else if currentPhoneLangID == "cs"{
                self.navigationItem.title = "#Otázky"
               }
        //31) Шведский = sv
        else if currentPhoneLangID == "sv"{
                self.navigationItem.title = "#Frågor"
               }
        //32) Японский = ja
        else if currentPhoneLangID == "ja"{
                 self.navigationItem.title = "#ご質問"
               }

        
        
        
           //v.2.3 - строка ниже, чтобы срабатывала анимация скрытия navigationBar. возвращаем в первоначальное состояние. также прописана строка на viewController
           self.navigationController?.navigationBar.transform = .identity
           
           self.navigationController?.isNavigationBarHidden = false
           //v.2.3 для анмированного удаления navigationBar
           self.navigationController?.navigationBar.alpha = 0
           
           UIView.animate(withDuration: 0.3, animations: {
               self.navigationController?.navigationBar.alpha = 1
              })
        
        
        //============================================
           //только для статистики, чтобы страница всегда обновлялась
        /*
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
        */
        //===============================================
        
        
        
        } // конец функции ViewWillAppear
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //для UIRefreshControl
        //https://spin.atomicobject.com/2018/12/01/reload-wkwebview/
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshWebView(_:)), for: UIControl.Event.valueChanged)
        webView.scrollView.addSubview(refreshControl)
        webView.scrollView.bounces = true
        
        
        var helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/en/"
        
        if currentPhoneLangID == "ru"         {
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ru/"
         }
         
         else if currentPhoneLangID == "ar"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ar/"
         }
         //3) Венгерский = hu
         else if currentPhoneLangID == "hu"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/hu/"
         }
         //4) Вьетнамский = vi
         else if currentPhoneLangID == "vi"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/vi/"
             
         }
         //5) Греческий = el
         else if currentPhoneLangID == "el"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/el/"
         }
         //6) Датский = da
         else if currentPhoneLangID == "da"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/da/"
         }
         //7) Иврит = he
         else if currentPhoneLangID == "he"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/he/"
         }
         //8) Индонезийский = id
         else if currentPhoneLangID == "id"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/id/"
         }
         //9) Испанский = es
         else if currentPhoneLangID == "es"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/es/"
         }
         //10) Итальянский = it
         else if currentPhoneLangID == "it"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/it/"
         }
         //11) Каталанский = ca
         else if currentPhoneLangID == "ca"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ca/"
         }
         //12) Китайский = zh
         else if currentPhoneLangID == "zh"{
              helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/zh/"
         }
         //13) Корейский = ko
         else if currentPhoneLangID == "ko"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ko/"
         }
         //14) Малайский = ms
         else if currentPhoneLangID == "ms"{
           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ms/"
         }
         //15) Немецкий = de
         else if currentPhoneLangID == "de"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/de/"
         }
         //16) Нидерландский = nl
         else if currentPhoneLangID == "nl"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/nl/"
         }
         //17) Норвежский = nb
         else if currentPhoneLangID == "nb"{
              helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/nb/"
         }
         //18) Польский = pl
         else if currentPhoneLangID == "pl"{
            helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/pl/"
         }
         //19) Португальский = pt
         else if currentPhoneLangID == "pt"{
              helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/pt/"
         }
         //20) Румынский = ro
         else if currentPhoneLangID == "ro"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ro/"
         }
         //21) Русский = ru
         
         //22) Словацкий = sk
         else if currentPhoneLangID == "sk"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/sk/"
         }
         //23) Тайский = th
         else if currentPhoneLangID == "th"{
            helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/th/"
         }
         //24) Турецкий = tr
         else if currentPhoneLangID == "tr"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/tr/"
         }
         //25) Украинский = uk
         else if currentPhoneLangID == "uk"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/uk/"
                }
         //26) Финский = fi
         else if currentPhoneLangID == "fi"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/fi/"
                }
         //27) Французский = fr
         else if currentPhoneLangID == "fr"{
              helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/fr/"
                }
         //28) Хинди = hi
         else if currentPhoneLangID == "hi"{
               helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/hi/"
                }
         //29) Хорватский = hr
         else if currentPhoneLangID == "hr"{
              helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/hr/"
                }
         //30) Чешский = cs
         else if currentPhoneLangID == "cs"{
               helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/cs/"
                }
         //31) Шведский = sv
         else if currentPhoneLangID == "sv"{
               helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/sv/"
                }
         //32) Японский = ja
         else if currentPhoneLangID == "ja"{
               helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ja/"
                }
        
        
        
        let url = URL(string: helpLink)
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
        
        var helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/en/"
        
        if currentPhoneLangID == "ru"         {
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ru/"
         }
         
         else if currentPhoneLangID == "ar"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ar/"
         }
         //3) Венгерский = hu
         else if currentPhoneLangID == "hu"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/hu/"
         }
         //4) Вьетнамский = vi
         else if currentPhoneLangID == "vi"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/vi/"
             
         }
         //5) Греческий = el
         else if currentPhoneLangID == "el"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/el/"
         }
         //6) Датский = da
         else if currentPhoneLangID == "da"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/da/"
         }
         //7) Иврит = he
         else if currentPhoneLangID == "he"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/he/"
         }
         //8) Индонезийский = id
         else if currentPhoneLangID == "id"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/id/"
         }
         //9) Испанский = es
         else if currentPhoneLangID == "es"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/es/"
         }
         //10) Итальянский = it
         else if currentPhoneLangID == "it"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/it/"
         }
         //11) Каталанский = ca
         else if currentPhoneLangID == "ca"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ca/"
         }
         //12) Китайский = zh
         else if currentPhoneLangID == "zh"{
              helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/zh/"
         }
         //13) Корейский = ko
         else if currentPhoneLangID == "ko"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ko/"
         }
         //14) Малайский = ms
         else if currentPhoneLangID == "ms"{
           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ms/"
         }
         //15) Немецкий = de
         else if currentPhoneLangID == "de"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/de/"
         }
         //16) Нидерландский = nl
         else if currentPhoneLangID == "nl"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/nl/"
         }
         //17) Норвежский = nb
         else if currentPhoneLangID == "nb"{
              helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/nb/"
         }
         //18) Польский = pl
         else if currentPhoneLangID == "pl"{
            helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/pl/"
         }
         //19) Португальский = pt
         else if currentPhoneLangID == "pt"{
              helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/pt/"
         }
         //20) Румынский = ro
         else if currentPhoneLangID == "ro"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ro/"
         }
         //21) Русский = ru
         
         //22) Словацкий = sk
         else if currentPhoneLangID == "sk"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/sk/"
         }
         //23) Тайский = th
         else if currentPhoneLangID == "th"{
            helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/th/"
         }
         //24) Турецкий = tr
         else if currentPhoneLangID == "tr"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/tr/"
         }
         //25) Украинский = uk
         else if currentPhoneLangID == "uk"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/uk/"
                }
         //26) Финский = fi
         else if currentPhoneLangID == "fi"{
             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/fi/"
                }
         //27) Французский = fr
         else if currentPhoneLangID == "fr"{
              helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/fr/"
                }
         //28) Хинди = hi
         else if currentPhoneLangID == "hi"{
               helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/hi/"
                }
         //29) Хорватский = hr
         else if currentPhoneLangID == "hr"{
              helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/hr/"
                }
         //30) Чешский = cs
         else if currentPhoneLangID == "cs"{
               helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/cs/"
                }
         //31) Шведский = sv
         else if currentPhoneLangID == "sv"{
               helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/sv/"
                }
         //32) Японский = ja
         else if currentPhoneLangID == "ja"{
               helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ja/"
                }
    
    
        let url = URL(string: helpLink)
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



//v.3.2.
/*
import WebKit
import UIKit

class HelpUsViewController: UIViewController, WKUIDelegate {

    //добавление заголовка
    override func viewWillAppear(_ animated: Bool) {
                //проверка языка локализации!!!!!!!!!!
          
        //v.2.3
        /*
        let locale = NSLocale.current
                let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
                var currentPhoneLangID = currentLangID
                //вычитаем 3 символа, чтобы получилось только ru (ru-US)
                let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
                currentPhoneLangID.removeSubrange(range)
                //если русский язык, отображать ЗАГОЛОВОК по-русски
        */  //v.2.3
        
        
        
        
                //заголовок по умолчанию
                self.navigationItem.title = "#Help"
        
                if currentPhoneLangID == "ru"     {
                     self.navigationItem.title = "#Справка"
               
                }
                else if currentPhoneLangID == "ar"{
                     self.navigationItem.title = "الأسئلة"
                    
                }
                //3) Венгерский = hu
                else if currentPhoneLangID == "hu"{
                     self.navigationItem.title = "#Kérdések"
                }
                //4) Вьетнамский = vi
                else if currentPhoneLangID == "vi"{
                     self.navigationItem.title = "#Câu hỏi"
                    
                }
                //5) Греческий = el
                else if currentPhoneLangID == "el"{
                     self.navigationItem.title = "#Ερωτήσεις"
                }
                //6) Датский = da
                else if currentPhoneLangID == "da"{
                     self.navigationItem.title = "#Spørgsmål"
                }
                //7) Иврит = he
                else if currentPhoneLangID == "he"{
                     self.navigationItem.title = "שאלות"
                }
                //8) Индонезийский = id
                else if currentPhoneLangID == "id"{
                     self.navigationItem.title = "#Pertanyaan"
                }
                //9) Испанский = es
                else if currentPhoneLangID == "es"{
                     self.navigationItem.title = "#Preguntas"
                }
                //10) Итальянский = it
                else if currentPhoneLangID == "it"{
                     self.navigationItem.title = "#Domande"
                }
                //11) Каталанский = ca
                else if currentPhoneLangID == "ca"{
                     self.navigationItem.title = "#Preguntes"
                }
                //12) Китайский = zh
                else if currentPhoneLangID == "zh"{
                      self.navigationItem.title = "#問題"
                    
                }
                //13) Корейский = ko
                else if currentPhoneLangID == "ko"{
                      self.navigationItem.title = "#질문"
                }
                //14) Малайский = ms
                else if currentPhoneLangID == "ms"{
                      self.navigationItem.title = "#Soalan"
                }
                //15) Немецкий = de
                else if currentPhoneLangID == "de"{
                      self.navigationItem.title = "#Fragen"
                }
                //16) Нидерландский = nl
                else if currentPhoneLangID == "nl"{
                      self.navigationItem.title = "#Vragen"
                }
                //17) Норвежский = nb
                else if currentPhoneLangID == "nb"{
                      self.navigationItem.title = "#Spørsmål"
                }
                //18) Польский = pl
                else if currentPhoneLangID == "pl"{
                      self.navigationItem.title = "#Pytania"
                }
                //19) Португальский = pt
                else if currentPhoneLangID == "pt"{
                       self.navigationItem.title = "#Questões"
                }
                //20) Румынский = ro
                else if currentPhoneLangID == "ro"{
                      self.navigationItem.title = "#Întrebări"
                }
                //21) Русский = ru
                
                //22) Словацкий = sk
                else if currentPhoneLangID == "sk"{
                      self.navigationItem.title = "#Otázky"
                }
                //23) Тайский = th
                else if currentPhoneLangID == "th"{
                      self.navigationItem.title = "#คำถาม"
                }
                //24) Турецкий = tr
                else if currentPhoneLangID == "tr"{
                      self.navigationItem.title = "#Sorular"
                }
                //25) Украинский = uk
                else if currentPhoneLangID == "uk"{
                        self.navigationItem.title = "#Запитання"
                       }
                //26) Финский = fi
                else if currentPhoneLangID == "fi"{
                        self.navigationItem.title = "#Kysymykset"
                       }
                //27) Французский = fr
                else if currentPhoneLangID == "fr"{
                        self.navigationItem.title = "#Des questions"
                       }
                //28) Хинди = hi
                else if currentPhoneLangID == "hi"{
                       self.navigationItem.title = "#प्रशन"
                       }
                //29) Хорватский = hr
                else if currentPhoneLangID == "hr"{
                        self.navigationItem.title = "#Pitanja"
                       }
                //30) Чешский = cs
                else if currentPhoneLangID == "cs"{
                        self.navigationItem.title = "#Otázky"
                       }
                //31) Шведский = sv
                else if currentPhoneLangID == "sv"{
                        self.navigationItem.title = "#Frågor"
                       }
                //32) Японский = ja
                else if currentPhoneLangID == "ja"{
                         self.navigationItem.title = "#ご質問"
                       }
        
        
  
        
        
            // v.2.3 закомментировали
            //self.navigationController?.isNavigationBarHidden = false
        
        //v.2.3 - строка ниже, чтобы срабатывала анимация скрытия navigationBar. возвращаем в первоначальное состояние. также прописана строка на viewController
        self.navigationController?.navigationBar.transform = .identity
        
        self.navigationController?.isNavigationBarHidden = false
        //v.2.3 для анмированного удаления navigationBar
        self.navigationController?.navigationBar.alpha = 0
        
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationController?.navigationBar.alpha = 1
           })
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
        

        
        //переменная "helpLink" отвечает за ссылку на раздел "Справка" - ссылка по умолчанию
        var helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/en/"
        
        //v.2.3
        //проверка языка локализации!!!!!!!!!!
       /* let locale = NSLocale.current
        let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
        var currentPhoneLangID = currentLangID
        //вычитаем 3 символа, чтобы получилось только ru (ru-US)
        let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
        currentPhoneLangID.removeSubrange(range)
        //в зависимости от языка телефона загружается ссылка
 */
 
        //v.2.3
        // if currentLangID == "ru-RU"
           
           if currentPhoneLangID == "ru"         {
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ru/"
            }
            
            else if currentPhoneLangID == "ar"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ar/"
            }
            //3) Венгерский = hu
            else if currentPhoneLangID == "hu"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/hu/"
            }
            //4) Вьетнамский = vi
            else if currentPhoneLangID == "vi"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/vi/"
                
            }
            //5) Греческий = el
            else if currentPhoneLangID == "el"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/el/"
            }
            //6) Датский = da
            else if currentPhoneLangID == "da"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/da/"
            }
            //7) Иврит = he
            else if currentPhoneLangID == "he"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/he/"
            }
            //8) Индонезийский = id
            else if currentPhoneLangID == "id"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/id/"
            }
            //9) Испанский = es
            else if currentPhoneLangID == "es"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/es/"
            }
            //10) Итальянский = it
            else if currentPhoneLangID == "it"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/it/"
            }
            //11) Каталанский = ca
            else if currentPhoneLangID == "ca"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ca/"
            }
            //12) Китайский = zh
            else if currentPhoneLangID == "zh"{
                 helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/zh/"
            }
            //13) Корейский = ko
            else if currentPhoneLangID == "ko"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ko/"
            }
            //14) Малайский = ms
            else if currentPhoneLangID == "ms"{
              helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ms/"
            }
            //15) Немецкий = de
            else if currentPhoneLangID == "de"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/de/"
            }
            //16) Нидерландский = nl
            else if currentPhoneLangID == "nl"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/nl/"
            }
            //17) Норвежский = nb
            else if currentPhoneLangID == "nb"{
                 helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/nb/"
            }
            //18) Польский = pl
            else if currentPhoneLangID == "pl"{
               helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/pl/"
            }
            //19) Португальский = pt
            else if currentPhoneLangID == "pt"{
                 helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/pt/"
            }
            //20) Румынский = ro
            else if currentPhoneLangID == "ro"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ro/"
            }
            //21) Русский = ru
            
            //22) Словацкий = sk
            else if currentPhoneLangID == "sk"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/sk/"
            }
            //23) Тайский = th
            else if currentPhoneLangID == "th"{
               helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/th/"
            }
            //24) Турецкий = tr
            else if currentPhoneLangID == "tr"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/tr/"
            }
            //25) Украинский = uk
            else if currentPhoneLangID == "uk"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/uk/"
                   }
            //26) Финский = fi
            else if currentPhoneLangID == "fi"{
                helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/fi/"
                   }
            //27) Французский = fr
            else if currentPhoneLangID == "fr"{
                 helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/fr/"
                   }
            //28) Хинди = hi
            else if currentPhoneLangID == "hi"{
                  helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/hi/"
                   }
            //29) Хорватский = hr
            else if currentPhoneLangID == "hr"{
                 helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/hr/"
                   }
            //30) Чешский = cs
            else if currentPhoneLangID == "cs"{
                  helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/cs/"
                   }
            //31) Шведский = sv
            else if currentPhoneLangID == "sv"{
                  helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/sv/"
                   }
            //32) Японский = ja
            else if currentPhoneLangID == "ja"{
                  helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ja/"
                   }
        
        
        
          
        
        

       let URL = NSURL(string: helpLink)
       webView.load(NSURLRequest(url: URL! as URL) as URLRequest)
        
    }
    

    //для UIRefreshControl
    //https://spin.atomicobject.com/2018/12/01/reload-wkwebview/
    @objc
    func refreshWebView(_ sender: UIRefreshControl) {
        
        //// The first time load web page fail at offline. Then webview.url be nil. Try the following code to refresh the view
        
        
        //переменная "helpLink" отвечает за ссылку на раздел "Справка" - по умолчанию
        var helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/en/"
      
        //v.2.3
        //проверка языка локализации!!!!!!!!!!
      /*  let locale = NSLocale.current
        let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
        var currentPhoneLangID = currentLangID
        //вычитаем 3 символа, чтобы получилось только ru (ru-US)
        let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
        currentPhoneLangID.removeSubrange(range)
        //в зависимости от языка телефона загружается ссылка
 */
 
        
        //v.2.3
        // if currentLangID == "ru-RU"
             if currentPhoneLangID == "ru"         {
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ru/"
                       }
                       
                       else if currentPhoneLangID == "ar"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ar/"
                       }
                       //3) Венгерский = hu
                       else if currentPhoneLangID == "hu"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/hu/"
                       }
                       //4) Вьетнамский = vi
                       else if currentPhoneLangID == "vi"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/vi/"
                           
                       }
                       //5) Греческий = el
                       else if currentPhoneLangID == "el"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/el/"
                       }
                       //6) Датский = da
                       else if currentPhoneLangID == "da"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/da/"
                       }
                       //7) Иврит = he
                       else if currentPhoneLangID == "he"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/he/"
                       }
                       //8) Индонезийский = id
                       else if currentPhoneLangID == "id"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/id/"
                       }
                       //9) Испанский = es
                       else if currentPhoneLangID == "es"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/es/"
                       }
                       //10) Итальянский = it
                       else if currentPhoneLangID == "it"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/it/"
                       }
                       //11) Каталанский = ca
                       else if currentPhoneLangID == "ca"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ca/"
                       }
                       //12) Китайский = zh
                       else if currentPhoneLangID == "zh"{
                            helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/zh/"
                       }
                       //13) Корейский = ko
                       else if currentPhoneLangID == "ko"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ko/"
                       }
                       //14) Малайский = ms
                       else if currentPhoneLangID == "ms"{
                         helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ms/"
                       }
                       //15) Немецкий = de
                       else if currentPhoneLangID == "de"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/de/"
                       }
                       //16) Нидерландский = nl
                       else if currentPhoneLangID == "nl"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/nl/"
                       }
                       //17) Норвежский = nb
                       else if currentPhoneLangID == "nb"{
                            helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/nb/"
                       }
                       //18) Польский = pl
                       else if currentPhoneLangID == "pl"{
                          helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/pl/"
                       }
                       //19) Португальский = pt
                       else if currentPhoneLangID == "pt"{
                            helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/pt/"
                       }
                       //20) Румынский = ro
                       else if currentPhoneLangID == "ro"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ro/"
                       }
                       //21) Русский = ru
                       
                       //22) Словацкий = sk
                       else if currentPhoneLangID == "sk"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/sk/"
                       }
                       //23) Тайский = th
                       else if currentPhoneLangID == "th"{
                          helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/th/"
                       }
                       //24) Турецкий = tr
                       else if currentPhoneLangID == "tr"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/tr/"
                       }
                       //25) Украинский = uk
                       else if currentPhoneLangID == "uk"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/uk/"
                              }
                       //26) Финский = fi
                       else if currentPhoneLangID == "fi"{
                           helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/fi/"
                              }
                       //27) Французский = fr
                       else if currentPhoneLangID == "fr"{
                            helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/fr/"
                              }
                       //28) Хинди = hi
                       else if currentPhoneLangID == "hi"{
                             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/hi/"
                              }
                       //29) Хорватский = hr
                       else if currentPhoneLangID == "hr"{
                            helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/hr/"
                              }
                       //30) Чешский = cs
                       else if currentPhoneLangID == "cs"{
                             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/cs/"
                              }
                       //31) Шведский = sv
                       else if currentPhoneLangID == "sv"{
                             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/sv/"
                              }
                       //32) Японский = ja
                       else if currentPhoneLangID == "ja"{
                             helpLink = "https://ilovebets.ru/mobileApp/iOS/Localization/Help/ja/"
                             }
        
        
              
        
        
        
        
        let URL = NSURL(string: helpLink)
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
 */ //v.3.2
