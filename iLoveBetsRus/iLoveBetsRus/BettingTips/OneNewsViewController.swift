//
//  OneNewsViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 08.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import UIKit

class OneNewsViewController: UIViewController {

    
    //default "imageHeight" = 450
    //UIScreen.main.bounds.width == 375
    //for iPhone 6, 6S, 7, 8, SE_2nd, iPhone X, 11pro
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    
    //добавление заголовка
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        //Масштабирование КАРТИНКИ для разной ширины экрана
        //iPhone 5S, SE
       if UIScreen.main.bounds.width == 320 {
            imageHeightConstraint.constant = 384
        }
        //iPhone 6+, 6S+ 7+, 8+, iPhone 11, 11 Pro Max
       else if UIScreen.main.bounds.width == 414 {
            imageHeightConstraint.constant = 496.8
        }
        //iPadPro 9.7, iPad Air2, iPad Air, iPad 5th gen
        else if UIScreen.main.bounds.height == 1024 && UIScreen.main.bounds.width == 768 {
            imageHeightConstraint.constant = 921.6
            imageViewTopConstraint.constant = 0
       }
        //ipad Pro (12.9) 2nd, 4th gen
        else if UIScreen.main.bounds.height == 1366 && UIScreen.main.bounds.width == 1024 {
            imageHeightConstraint.constant = 1229.41
            imageViewTopConstraint.constant = 0
       }
        //iPad Pro (11) 2nd gen
       else if UIScreen.main.bounds.height == 1194 && UIScreen.main.bounds.width == 834 {
            imageHeightConstraint.constant = 1074.60
            imageViewTopConstraint.constant = 0
        }
        //iPadPro (10.5-inch), iPad Air (3rd gen)
        else if UIScreen.main.bounds.height == 1112 && UIScreen.main.bounds.width == 834 {
            imageHeightConstraint.constant = 1074.60
            imageViewTopConstraint.constant = 0
         }
        //iPad 7th gen
        else if UIScreen.main.bounds.height == 1080 && UIScreen.main.bounds.width == 810 {
            imageHeightConstraint.constant = 972
            imageViewTopConstraint.constant = 0
         }
        
        
        
        
        
        //v.2.5 - масштабируем изображение
               //Для iPhone 11, 11 Pro Max (с высотой экрана 896.0) - настроены Constraints
        //    if UIScreen.main.bounds.height == 896 {
            
                //Для iPhone 5S, SE (с высотой экрана 568.0) - настроены Constraints
     //   if UIScreen.main.bounds.height == 568 {
        
        
        
        
        //закомментировать после скриншотов
        
        //v.3.2
        //Заголовок по умолчанию
        self.navigationItem.title = "#Tip"
       // self.navigationController?.isNavigationBarHidden = false
        //закомментировать после скриншотов
        
        //снять комментарий после скриншотов
         
        
        
        //v.2.3 - комментируем, тк объявляем глобальную переменную
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
        
               //    if currentLangID == "ru-RU"
       
        //v.2.3
        if currentPhoneLangID == "ru"    {
                   self.navigationItem.title = "#Прогноз"
                   //добавление строки навигации при загрузке ViewControllera
                   }
            
                   //v.3.2
                   //2) арабский
                   else if currentPhoneLangID == "ar"{
                        self.navigationItem.title = "نصائح الرهان"
                       
                   }
                   //3) Венгерский = hu
                   else if currentPhoneLangID == "hu"{
                        self.navigationItem.title = "#Fogadási tippek"
                   }
                   //4) Вьетнамский = vi
                   else if currentPhoneLangID == "vi"{
                        self.navigationItem.title = "#Mẹo cá cược"
                       
                   }
                   //5) Греческий = el
                   else if currentPhoneLangID == "el"{
                        self.navigationItem.title = "#Προβλέψεις"
                   }
                   //6) Датский = da
                   else if currentPhoneLangID == "da"{
                        self.navigationItem.title = "#Væddemålstip"
                   }
                   //7) Иврит = he
                   else if currentPhoneLangID == "he"{
                        self.navigationItem.title = "תחזיות ספורט"
                   }
                   //8) Индонезийский = id
                   else if currentPhoneLangID == "id"{
                        self.navigationItem.title = "#Kiat taruhan"
                   }
                   //9) Испанский = es
                   else if currentPhoneLangID == "es"{
                        self.navigationItem.title = "#Predicción"
                   }
                   //10) Итальянский = it
                   else if currentPhoneLangID == "it"{
                        self.navigationItem.title = "#Predizioni"
                   }
                   //11) Каталанский = ca
                   else if currentPhoneLangID == "ca"{
                        self.navigationItem.title = "#Prediccions"
                   }
                   //12) Китайский = zh
                   else if currentPhoneLangID == "zh"{
                        self.navigationItem.title = "#投注技巧"
                     
                   }
                   //13) Корейский = ko
                   else if currentPhoneLangID == "ko"{
                        self.navigationItem.title = "#도박 팁"
                   }
                   //14) Малайский = ms
                   else if currentPhoneLangID == "ms"{
                        self.navigationItem.title = "#Ramalan Sukan"
                   }
                   //15) Немецкий = de
                   else if currentPhoneLangID == "de"{
                        self.navigationItem.title = "#Wett-Tipps"
                   }
                   //16) Нидерландский = nl
                   else if currentPhoneLangID == "nl"{
                        self.navigationItem.title = "#Voorspellingen"
                   }
                   //17) Норвежский = nb
                   else if currentPhoneLangID == "nb"{
                        self.navigationItem.title = "#Spilltips"
                   }
                   //18) Польский = pl
                   else if currentPhoneLangID == "pl"{
                        self.navigationItem.title = "#Prognozy"
                   }
                   //19) Португальский = pt
                   else if currentPhoneLangID == "pt"{
                        self.navigationItem.title = "#Previsões"
                   }
                   //20) Румынский = ro
                   else if currentPhoneLangID == "ro"{
                        self.navigationItem.title = "#Predictii"
                   }
                   //21) Русский = ru
                   
                   //22) Словацкий = sk
                   else if currentPhoneLangID == "sk"{
                        self.navigationItem.title = "#Stávkové tipy"
                   }
                   //23) Тайский = th
                   else if currentPhoneLangID == "th"{
                        self.navigationItem.title = "#การทำนายผลกีฬา"
                   }
                   //24) Турецкий = tr
                   else if currentPhoneLangID == "tr"{
                        self.navigationItem.title = "#Bahis ipuçları"
                   }
                   //25) Украинский = uk
                   else if currentPhoneLangID == "uk"{
                        self.navigationItem.title = "#Прогноз"
                   }
                   //26) Финский = fi
                   else if currentPhoneLangID == "fi"{
                        self.navigationItem.title = "#Urheiluennusteet"
                   }
                   //27) Французский = fr
                   else if currentPhoneLangID == "fr"{
                        self.navigationItem.title = "#Prédictions"
                   }
                   //28) Хинди = hi
                   else if currentPhoneLangID == "hi"{
                        self.navigationItem.title = "#भविष्यवाणियों"
                   }
                   //29) Хорватский = hr
                   else if currentPhoneLangID == "hr"{
                        self.navigationItem.title = "#Predviđanja"
                   }
                   //30) Чешский = cs
                   else if currentPhoneLangID == "cs"{
                        self.navigationItem.title = "#Sázkové tipy"
                   }
                   //31) Шведский = sv
                   else if currentPhoneLangID == "sv"{
                        self.navigationItem.title = "#Sportprognoser"
                   }
                   //32) Японский = ja
                   else if currentPhoneLangID == "ja"{
                        self.navigationItem.title = "#スポーツ予測"
                   }
        
        
        
        
        
        //v2.3
        //self.navigationController?.isNavigationBarHidden = false
         
        
    //v.2.3 - строка ниже, чтобы срабатывала анимация скрытия navigationBar. возвращаем в первоначальное состояние. также прописана строка на viewController
    //  self.navigationController?.navigationBar.transform = .identity
        
    //   self.navigationController?.isNavigationBarHidden = false
        //v.2.3 для анмированного удаления navigationBar
    //   self.navigationController?.navigationBar.alpha = 0
        
    //   UIView.animate(withDuration: 0.3, animations: {
    //       self.navigationController?.navigationBar.alpha = 1
    //      })
        }
        
        //снять комментарий после скриншотов
        
        
    
    
    
    
    
    //создаем переменную, в которую будем передавать из нашего TableViewController
    var article: Article!
    
    //вытаскиваем элементы, с которыми будем работать (из одной новости)
 
    
 
    @IBOutlet weak var imageView: UIImageView!
    
    //Название Чемпионата
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    //дата прогноза
    @IBOutlet weak var publishedAt: UILabel!
    
    //команды
    @IBOutlet weak var url: UILabel!
    
    //ставка, tip
    @IBOutlet weak var author: UILabel!
    
    //коэффициент
    @IBOutlet weak var content: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//на основании переменной article, в которую записываются данные из структуры Article, заполняем все поля для экрана с одной новостью
        labelTitle.text = article.title //чемпионат
        labelDescription.text = article.description
        publishedAt.text = article.publishedAt
        url.text = article.url
        author.text = article.author
        content.text = article.content
        
 //       urlImage.text = article.urlToImage
 
        
        //v2.3 - закомментировали. ниже новый код, чтобы не замораживался интерфейс
        //загрузка картинки 1-я версия
/*          DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
*/
        //v2.3
        //загрузка картинки не в основном потоке. чтобы не замораживался экран при загрузке картинки
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }
        }
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
