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
           
        
        //v2.3
        //проверка языка локализации!!!!!!!!!!
         /*   let locale = NSLocale.current
            let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
            var currentPhoneLangID = currentLangID
            //вычитаем 3 символа, чтобы получилось только ru (ru-US)
            let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
            currentPhoneLangID.removeSubrange(range)
            //если русский язык, отображать ЗАГОЛОВОК по-русски
 */        //v2.3
        
        
        
        //заголовок по умолчанию
        self.navigationItem.title = "#About Us"
        
        if currentPhoneLangID == "ru"       {
          self.navigationItem.title = "#О Нас"
           //добавление строки навигации при загрузке ViewControllera
        }
        
        else if currentPhoneLangID == "ar"{
           self.navigationItem.title = "#معلومات عنا"
            
        }
        //3) Венгерский = hu
        else if currentPhoneLangID == "hu"{
            self.navigationItem.title = "#Rólunk"
        }
        //4) Вьетнамский = vi
        else if currentPhoneLangID == "vi"{
             self.navigationItem.title = "#Về chúng tôi"
        }
        //5) Греческий = el
        else if currentPhoneLangID == "el"{
             self.navigationItem.title = "#Σχετικά με εμάς"
        }
        //6) Датский = da
        else if currentPhoneLangID == "da"{
             self.navigationItem.title = "#Om os"
        }
        //7) Иврит = he
        else if currentPhoneLangID == "he"{
             self.navigationItem.title = "#עלינו"
        }
        //8) Индонезийский = id
        else if currentPhoneLangID == "id"{
             self.navigationItem.title = "#Tentang kami"
        }
        //9) Испанский = es
        else if currentPhoneLangID == "es"{
             self.navigationItem.title = "#Sobre nosotros"
        }
        //10) Итальянский = it
        else if currentPhoneLangID == "it"{
             self.navigationItem.title = "#Riguardo a noi"
        }
        //11) Каталанский = ca
        else if currentPhoneLangID == "ca"{
             self.navigationItem.title = "#Sobre nosaltres"
        }
        //12) Китайский = zh
        else if currentPhoneLangID == "zh"{
             self.navigationItem.title = "#關於我們"              }
        //13) Корейский = ko
        else if currentPhoneLangID == "ko"{
             self.navigationItem.title = "#회사 소개"
        }
        //14) Малайский = ms
        else if currentPhoneLangID == "ms"{
             self.navigationItem.title = "#Tentang kita"
        }
        //15) Немецкий = de
        else if currentPhoneLangID == "de"{
             self.navigationItem.title = "#Über uns"
        }
        //16) Нидерландский = nl
        else if currentPhoneLangID == "nl"{
             self.navigationItem.title = "#Over ons"
        }
        //17) Норвежский = nb
        else if currentPhoneLangID == "nb"{
             self.navigationItem.title = "#Om oss"
        }
        //18) Польский = pl
        else if currentPhoneLangID == "pl"{
             self.navigationItem.title = "#O nas"
        }
        //19) Португальский = pt
        else if currentPhoneLangID == "pt"{
             self.navigationItem.title = "#Sobre nós"
        }
        //20) Румынский = ro
        else if currentPhoneLangID == "ro"{
             self.navigationItem.title = "#Despre noi"
        }
        //21) Русский = ru
        
        //22) Словацкий = sk
        else if currentPhoneLangID == "sk"{
             self.navigationItem.title = "#O nás"
        }
        //23) Тайский = th
        else if currentPhoneLangID == "th"{
             self.navigationItem.title = "#เกี่ยวกับเรา"
        }
        //24) Турецкий = tr
        else if currentPhoneLangID == "tr"{
             self.navigationItem.title = "#Hakkımızda"
        }
        //25) Украинский = uk
        else if currentPhoneLangID == "uk"{
             self.navigationItem.title = "#Про нас"
               }
        //26) Финский = fi
        else if currentPhoneLangID == "fi"{
             self.navigationItem.title = "#Meistä"
               }
        //27) Французский = fr
        else if currentPhoneLangID == "fr"{
             self.navigationItem.title = "#À propos de nous"
               }
        //28) Хинди = hi
        else if currentPhoneLangID == "hi"{
             self.navigationItem.title = "#हमारे बारे में"
               }
        //29) Хорватский = hr
        else if currentPhoneLangID == "hr"{
             self.navigationItem.title = "#O nama"
               }
        //30) Чешский = cs
        else if currentPhoneLangID == "cs"{
             self.navigationItem.title = "#O nás"
               }
        //31) Шведский = sv
        else if currentPhoneLangID == "sv"{
             self.navigationItem.title = "#Om oss"
               }
        //32) Японский = ja
        else if currentPhoneLangID == "ja"{
             self.navigationItem.title = "#私たちに関しては"
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
    
    
 //   let urlMy = URL(string: "https://ilovebets.ru/app/currentStatRus/")
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //для UIRefreshControl
        //https://spin.atomicobject.com/2018/12/01/reload-wkwebview/
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshWebView(_:)), for: UIControl.Event.valueChanged)
        webView.scrollView.addSubview(refreshControl)
        webView.scrollView.bounces = true
        
          
        
        
        //переменная "aboutUsLink" отвечает за ссылку на раздел "О нас" - ссылка по умолчанию
        var aboutUsLink = "https://ilovebets.ru/mobileApp/iOS/Localization/AboutUs/en/"
        
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
            if currentPhoneLangID == "ru"     {
                aboutUsLink = "https://ilovebets.ru/mobileApp/iOS/Localization/AboutUs/ru/"
            }
        
            else if currentPhoneLangID == "ar"{
                               
            }
            //3) Венгерский = hu
            else if currentPhoneLangID == "hu"{
                
            }
            //4) Вьетнамский = vi
            else if currentPhoneLangID == "vi"{
                 
                
            }
            //5) Греческий = el
            else if currentPhoneLangID == "el"{
                 
            }
            //6) Датский = da
            else if currentPhoneLangID == "da"{
                 
            }
            //7) Иврит = he
            else if currentPhoneLangID == "he"{
                   
            }
            //8) Индонезийский = id
            else if currentPhoneLangID == "id"{
                
            }
            //9) Испанский = es
            else if currentPhoneLangID == "es"{
                 
            }
            //10) Итальянский = it
            else if currentPhoneLangID == "it"{
                 
            }
            //11) Каталанский = ca
            else if currentPhoneLangID == "ca"{
                
            }
            //12) Китайский = zh
            else if currentPhoneLangID == "zh"{
                                }
            //13) Корейский = ko
            else if currentPhoneLangID == "ko"{
                
            }
            //14) Малайский = ms
            else if currentPhoneLangID == "ms"{
              
            }
            //15) Немецкий = de
            else if currentPhoneLangID == "de"{
                
            }
            //16) Нидерландский = nl
            else if currentPhoneLangID == "nl"{
                  
            }
            //17) Норвежский = nb
            else if currentPhoneLangID == "nb"{
                  
            }
            //18) Польский = pl
            else if currentPhoneLangID == "pl"{
               
            }
            //19) Португальский = pt
            else if currentPhoneLangID == "pt"{
                   
            }
            //20) Румынский = ro
            else if currentPhoneLangID == "ro"{
                  
            }
            //21) Русский = ru
            
            //22) Словацкий = sk
            else if currentPhoneLangID == "sk"{
                
            }
            //23) Тайский = th
            else if currentPhoneLangID == "th"{
               
            }
            //24) Турецкий = tr
            else if currentPhoneLangID == "tr"{
                  
            }
            //25) Украинский = uk
            else if currentPhoneLangID == "uk"{
                         
                   }
            //26) Финский = fi
            else if currentPhoneLangID == "fi"{
                    
                   }
            //27) Французский = fr
            else if currentPhoneLangID == "fr"{
                         
                   }
            //28) Хинди = hi
            else if currentPhoneLangID == "hi"{
                   
                   }
            //29) Хорватский = hr
            else if currentPhoneLangID == "hr"{
                      
                   }
            //30) Чешский = cs
            else if currentPhoneLangID == "cs"{
                       
                   }
            //31) Шведский = sv
            else if currentPhoneLangID == "sv"{
                        
                   }
            //32) Японский = ja
            else if currentPhoneLangID == "ja"{
                             
                          }
        
        
        
    let URL = NSURL(string: aboutUsLink)
    webView.load(NSURLRequest(url: URL! as URL) as URLRequest)
        
    }
    

    //для UIRefreshControl
    //https://spin.atomicobject.com/2018/12/01/reload-wkwebview/
    @objc
    func refreshWebView(_ sender: UIRefreshControl) {
        
        //// The first time load web page fail at offline. Then webview.url be nil. Try the following code to refresh the view
        
        
        //переменная "aboutUsLink" отвечает за ссылку на раздел "О нас" - по умолчанию
        var aboutUsLink = "https://ilovebets.ru/mobileApp/iOS/Localization/AboutUs/en/"
       
        
        //v2.3
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
            if currentPhoneLangID == "ru"     {
                aboutUsLink = "https://ilovebets.ru/mobileApp/iOS/Localization/AboutUs/ru/"
            }
        
            else if currentPhoneLangID == "ar"{
                                  
                
            }
            //3) Венгерский = hu
            else if currentPhoneLangID == "hu"{
                
            }
            //4) Вьетнамский = vi
            else if currentPhoneLangID == "vi"{
                 
                
            }
            //5) Греческий = el
            else if currentPhoneLangID == "el"{
                 
            }
            //6) Датский = da
            else if currentPhoneLangID == "da"{
                 
            }
            //7) Иврит = he
            else if currentPhoneLangID == "he"{
                   
            }
            //8) Индонезийский = id
            else if currentPhoneLangID == "id"{
                
            }
            //9) Испанский = es
            else if currentPhoneLangID == "es"{
                 
            }
            //10) Итальянский = it
            else if currentPhoneLangID == "it"{
                 
            }
            //11) Каталанский = ca
            else if currentPhoneLangID == "ca"{
                
            }
            //12) Китайский = zh
            else if currentPhoneLangID == "zh"{
                                }
            //13) Корейский = ko
            else if currentPhoneLangID == "ko"{
                
            }
            //14) Малайский = ms
            else if currentPhoneLangID == "ms"{
              
            }
            //15) Немецкий = de
            else if currentPhoneLangID == "de"{
                
            }
            //16) Нидерландский = nl
            else if currentPhoneLangID == "nl"{
                  
            }
            //17) Норвежский = nb
            else if currentPhoneLangID == "nb"{
                  
            }
            //18) Польский = pl
            else if currentPhoneLangID == "pl"{
               
            }
            //19) Португальский = pt
            else if currentPhoneLangID == "pt"{
                   
            }
            //20) Румынский = ro
            else if currentPhoneLangID == "ro"{
                  
            }
            //21) Русский = ru
            
            //22) Словацкий = sk
            else if currentPhoneLangID == "sk"{
                
            }
            //23) Тайский = th
            else if currentPhoneLangID == "th"{
               
            }
            //24) Турецкий = tr
            else if currentPhoneLangID == "tr"{
                  
            }
            //25) Украинский = uk
            else if currentPhoneLangID == "uk"{
                         
                   }
            //26) Финский = fi
            else if currentPhoneLangID == "fi"{
                    
                   }
            //27) Французский = fr
            else if currentPhoneLangID == "fr"{
                         
                   }
            //28) Хинди = hi
            else if currentPhoneLangID == "hi"{
                   
                   }
            //29) Хорватский = hr
            else if currentPhoneLangID == "hr"{
                      
                   }
            //30) Чешский = cs
            else if currentPhoneLangID == "cs"{
                       
                   }
            //31) Шведский = sv
            else if currentPhoneLangID == "sv"{
                        
                   }
            //32) Японский = ja
            else if currentPhoneLangID == "ja"{
                             
                          }
        
        
        
        
        
        let URL = NSURL(string: aboutUsLink)
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
