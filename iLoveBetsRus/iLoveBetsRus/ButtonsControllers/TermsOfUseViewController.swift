//
//  TermsOfUseViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 10.09.2020.
//  Copyright © 2020 Roman Bobrov. All rights reserved.
//


//v3.3

import UIKit
import WebKit

class TermsOfUseViewController: UIViewController, WKNavigationDelegate {

    
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var slideButtonOutlet: UIImageView!
    
    
    //https://www.youtube.com/watch?v=2ArlCvtL33I&feature=youtu.be
    //добавляем библиотеку в Build Phases - Webkit.Framework
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var ActInd: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //убирать кнопку slideButton, если ниже iOS13
        if #available(iOS 13, *)  {
            slideButtonOutlet.isHidden = false
               }   else   {
            slideButtonOutlet.isHidden = true
               }
        
        
        
        
       // let url = URL(string: "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse")
        
        var termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/en/"

        // if currentLangID == "ru-RU"
                  if currentPhoneLangID == "ru"     {
                        termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/ru/"
                  }
                
                  else if currentPhoneLangID == "ar"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/ar/"
                  }
                  //3) Венгерский = hu
                  else if currentPhoneLangID == "hu"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/hu/"
                  }
                  //4) Вьетнамский = vi
                  else if currentPhoneLangID == "vi"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/vi/"
                  }
                  //5) Греческий = el
                  else if currentPhoneLangID == "el"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/el/"
                  }
                  //6) Датский = da
                  else if currentPhoneLangID == "da"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/da/"
                  }
                  //7) Иврит = he
                  else if currentPhoneLangID == "he"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/he/"
                  }
                  //8) Индонезийский = id
                  else if currentPhoneLangID == "id"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/id/"
                  }
                  //9) Испанский = es
                  else if currentPhoneLangID == "es"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/es/"
                  }
                  //10) Итальянский = it
                  else if currentPhoneLangID == "it"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/it/"
                  }
                  //11) Каталанский = ca
                  else if currentPhoneLangID == "ca"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/ca/"
                  }
                  //12) Китайский = zh
                  else if currentPhoneLangID == "zh"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/zh/"
                  }
                  //13) Корейский = ko
                  else if currentPhoneLangID == "ko"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/ko/"
                  }
                  //14) Малайский = ms
                  else if currentPhoneLangID == "ms"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/ms/"
                  }
                  //15) Немецкий = de
                  else if currentPhoneLangID == "de"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/de/"
                  }
                  //16) Нидерландский = nl
                  else if currentPhoneLangID == "nl"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/nl/"
                  }
                  //17) Норвежский = nb
                  else if currentPhoneLangID == "nb"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/nb/"
                  }
                  //18) Польский = pl
                  else if currentPhoneLangID == "pl"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/pl/"
                  }
                  //19) Португальский = pt
                  else if currentPhoneLangID == "pt"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/pt/"
                  }
                  //20) Румынский = ro
                  else if currentPhoneLangID == "ro"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/ro/"
                  }
                  //21) Русский = ru
                  
                  //22) Словацкий = sk
                  else if currentPhoneLangID == "sk"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/sk/"
                  }
                  //23) Тайский = th
                  else if currentPhoneLangID == "th"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/th/"
                  }
                  //24) Турецкий = tr
                  else if currentPhoneLangID == "tr"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/tr/"
                  }
                  //25) Украинский = uk
                  else if currentPhoneLangID == "uk"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/uk/"
                  }
                  //26) Финский = fi
                  else if currentPhoneLangID == "fi"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/fi/"
                  }
                  //27) Французский = fr
                  else if currentPhoneLangID == "fr"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/fr/"
                  }
                  //28) Хинди = hi
                  else if currentPhoneLangID == "hi"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/hi/"
                  }
                  //29) Хорватский = hr
                  else if currentPhoneLangID == "hr"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/hr/"
                  }
                  //30) Чешский = cs
                  else if currentPhoneLangID == "cs"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/cs/"
                  }
                  //31) Шведский = sv
                  else if currentPhoneLangID == "sv"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/sv/"
                  }
                  //32) Японский = ja
                  else if currentPhoneLangID == "ja"{
                      termsOfUse = "https://ilovebets.ru/mobileApp/iOS/Localization/TermsOfUse/ja/"
                  }
        

        let url = URL(string: termsOfUse)
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
    
    
    
    

} //конец класса
