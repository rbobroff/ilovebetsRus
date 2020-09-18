//
//  PrivacyPolicyViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 13.09.2020.
//  Copyright © 2020 Roman Bobrov. All rights reserved.
//

import UIKit
import WebKit

class PrivacyPolicyViewController: UIViewController, WKNavigationDelegate {


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
                
        
                  var privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/en/"

                  if currentPhoneLangID == "ru"     {
                        privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/ru/"
                  }
                
                  else if currentPhoneLangID == "ar"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/ar/"
                  }
                  //3) Венгерский = hu
                  else if currentPhoneLangID == "hu"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/hu/"
                  }
                  //4) Вьетнамский = vi
                  else if currentPhoneLangID == "vi"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/vi/"
                  }
                  //5) Греческий = el
                  else if currentPhoneLangID == "el"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/el/"
                  }
                  //6) Датский = da
                  else if currentPhoneLangID == "da"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/da/"
                  }
                  //7) Иврит = he
                  else if currentPhoneLangID == "he"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/he/"
                  }
                  //8) Индонезийский = id
                  else if currentPhoneLangID == "id"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/id/"
                  }
                  //9) Испанский = es
                  else if currentPhoneLangID == "es"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/es/"
                  }
                  //10) Итальянский = it
                  else if currentPhoneLangID == "it"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/it/"
                  }
                  //11) Каталанский = ca
                  else if currentPhoneLangID == "ca"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/ca/"
                  }
                  //12) Китайский = zh
                  else if currentPhoneLangID == "zh"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/zh/"
                  }
                  //13) Корейский = ko
                  else if currentPhoneLangID == "ko"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/ko/"
                  }
                  //14) Малайский = ms
                  else if currentPhoneLangID == "ms"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/ms/"
                  }
                  //15) Немецкий = de
                  else if currentPhoneLangID == "de"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/de/"
                  }
                  //16) Нидерландский = nl
                  else if currentPhoneLangID == "nl"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/nl/"
                  }
                  //17) Норвежский = nb
                  else if currentPhoneLangID == "nb"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/nb/"
                  }
                  //18) Польский = pl
                  else if currentPhoneLangID == "pl"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/pl/"
                  }
                  //19) Португальский = pt
                  else if currentPhoneLangID == "pt"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/pt/"
                  }
                  //20) Румынский = ro
                  else if currentPhoneLangID == "ro"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/ro/"
                  }
                  //21) Русский = ru
                  
                  //22) Словацкий = sk
                  else if currentPhoneLangID == "sk"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/sk/"
                  }
                  //23) Тайский = th
                  else if currentPhoneLangID == "th"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/th/"
                  }
                  //24) Турецкий = tr
                  else if currentPhoneLangID == "tr"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/tr/"
                  }
                  //25) Украинский = uk
                  else if currentPhoneLangID == "uk"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/uk/"
                  }
                  //26) Финский = fi
                  else if currentPhoneLangID == "fi"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/fi/"
                  }
                  //27) Французский = fr
                  else if currentPhoneLangID == "fr"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/fr/"
                  }
                  //28) Хинди = hi
                  else if currentPhoneLangID == "hi"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/hi/"
                  }
                  //29) Хорватский = hr
                  else if currentPhoneLangID == "hr"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/hr/"
                  }
                  //30) Чешский = cs
                  else if currentPhoneLangID == "cs"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/cs/"
                  }
                  //31) Шведский = sv
                  else if currentPhoneLangID == "sv"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/sv/"
                  }
                  //32) Японский = ja
                  else if currentPhoneLangID == "ja"{
                      privacyPolicy = "https://ilovebets.ru/mobileApp/iOS/Localization/PrivacyPolicy/ja/"
                  }
        
        
        
                let url = URL(string: privacyPolicy)
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
