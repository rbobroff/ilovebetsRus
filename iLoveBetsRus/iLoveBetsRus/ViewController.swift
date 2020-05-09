//
//  ViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 29.10.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import UIKit
import MessageUI //библиотека для отправки e-mail

//Инструкция по отправке E-mail: https://www.youtube.com/watch?v=J-pn5V2jcfo&t=2s

class ViewController: UIViewController {
    


    @IBOutlet weak var bettingTipsButton: UIButton!
    @IBOutlet weak var statisticsButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var aboutUsButton: UIButton!
    

    //аутлет label вверху на главном экране = Ваш персональный помощник в мире спортивного беттинга:
    @IBOutlet weak var yourPersonalSportsBettingAdvisorLabel: UILabel!
    //аутлет iLoveBets label
    @IBOutlet weak var iLoveBetsLabel: UILabel!
    //аутлет label внизу на главном экране = Спортивные прогнозы:
    @IBOutlet weak var sportBetsLabel: UILabel!
    
    
    
    
    //аутлет верхнего,левого,правого Constraint ^ для label = Ваш персональный помощник в мире спортивного беттинга:
    @IBOutlet weak var upConstraintYourPersonalSportsBettingAdvisor: NSLayoutConstraint!
    @IBOutlet weak var leftConstraintYourPersonalSportsBettingAdvisor: NSLayoutConstraint!
    @IBOutlet weak var rightConstraintYourPersonalSportsBettingAdvisor: NSLayoutConstraint!
    
    
    //аутлет верхнего Constraint ^ для кнопки bettingTipsButton:
    @IBOutlet weak var bettingTipsButtonTopConstraint: NSLayoutConstraint!
    //аутлет верхнего Constraint ^ для кнопки bettingTipsButton:
    @IBOutlet weak var statisticsButtonTopConstraint: NSLayoutConstraint!
    
    
    //аутлет левого Constraint для нижнего label "Спортивные прогнозы" или "SportBettingTips"
    @IBOutlet weak var sportBetsLabelLeftConstraint: NSLayoutConstraint!
    //аутлет правого Constraint для нижнего label "Спортивные прогнозы" или "SportBettingTips"
    @IBOutlet weak var sportBetsLabelRightConstraint: NSLayoutConstraint!
    //аутлет нижнего Constraint для label "Спортивные прогнозы" или "SportBettingTips"
    @IBOutlet weak var sportBetsLabelBottomConstraint: NSLayoutConstraint!
    
    
    
    
    //аутлет высоты кнопок
    @IBOutlet weak var bettingTipsButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var statisticsButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var chatButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var emailButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var helpButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var aboutUsButtonHeight: NSLayoutConstraint!
    
    //top constraint для iLoveBets
    @IBOutlet weak var iLoveBetsTopConstraints: NSLayoutConstraint!
    
    
    
    //темный StatusBar на главном экране
 //   override func viewDidAppear(_ animated: Bool) {
      // 1
  //    let nav = self.navigationController?.navigationBar
      // 2
 //     nav?.barStyle = UIBarStyle.black
 //   }
    
    
   // скрывать navigation bar (или показывать)
   override func viewWillAppear(_ animated: Bool) {
    
    //v.2.3 комментируем
    //self.navigationController?.isNavigationBarHidden = true
    
    //v.2.3 для анимированного удаления navigationBar
        self.navigationController?.navigationBar.alpha = 1
    UIView.animate(withDuration: 0.3, animations: {
        //v.2.3 - строка ниже добавляем анимацию, чтобы увести navigationBar по оси "y" в -200
        self.navigationController?.navigationBar.transform = CGAffineTransform(translationX: 0, y: -200)
        self.navigationController?.navigationBar.alpha = 0 //убираем в ноль за 0.3 секунды
    }) { (bool) in
        self.navigationController?.isNavigationBarHidden = true
 }
 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    //v2.3 для анмированного navigationBar
     self.navigationController?.isNavigationBarHidden = true
        
        
        //снять комментарий после скриншотов
         
        //v2.3 комментируем
        //показать язык локализации и вывести в консоль
          /*
        let locale = NSLocale.current
        let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
        print("Текущий язык long телефон-Регион = ",currentLangID)
        var currentPhoneLangID = currentLangID
            // symbols.insert("!", at: symbols.endIndex)
            // print("измененный_Текущий язык = ",symbols)
        //https://swiftbook.ru/content/languageguide/strings-and-characters/
        //от полученного значения "языктелефона-Регион", вычитаем 3 символа, чтобы вместо "ru-Us" и тд, оставалось только "ru", то есть, проверялся только русский язык телефона, а регион не учитывался
        let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
        currentPhoneLangID.removeSubrange(range)
        print("Только текущий язык телефона, без региона = ",currentPhoneLangID)
        */
    
       
        //v2.3
        print("Текущий язык телефон-Регион = ",currentPhoneLangID) //выводим в консоль язык телефона
        
        //1) Английский США = en
        //2) Арабский = ar
        //3) Венгерский = hu
        //4) Вьетнамский = vi
        //5) Греческий = el
        //6) Датский = da
        //7) Иврит = he
        //8) Индонезийский = id
        //9) Испанский = es
        //10) Итальянский = it
        //11) Каталанский = ca
        //12) Китайский =zh
        //13) Корейский = ko
        //14) Малайский = ms
        //15) Немецкий = de
        //16) Нидерландский = nl
        //17) Норвежский = nb
        //18) Польский = pl
        //19) Португальский = pt
        //20) Румынский = ro
        //21) Русский = ru
        //22) Словацкий = sk
        //23) Тайский = th
        //24) Турецкий = tr
        //25) Украинский = uk
        //26) Финский = fi
        //27) Французский = fr
        //28) Хинди = hi
        //29) Хорватский = hr
        //30) Чешский = cs
        //31) Шведский = sv
        //32) Японский = ja
        
        
        
        //Локализуем главный вид приложения!!!
        if currentPhoneLangID == "ru" {
            yourPersonalSportsBettingAdvisorLabel.text = "ВАШ ПЕРСОНАЛЬНЫЙ ПОМОЩНИК В МИРЕ СПОРТИВНОГО бЕТТИНГА"
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 17)
            sportBetsLabel.text = "Спортивные прогнозы"
            sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        
                    //Заменяем картинки из Assets.xcassets на кнопках, если русский язык
                    let button1 = UIImage(named: "1. BettingTips")
                    bettingTipsButton.setImage(button1, for: UIControl.State.normal)
                    
                    let button2 = UIImage(named: "2. Statistics")
                    statisticsButton.setImage(button2, for: UIControl.State.normal)
                    
                    let button3 = UIImage(named: "3. Chat")
                    chatButton.setImage(button3, for: UIControl.State.normal)
                    
                    let button4 = UIImage(named: "4. E-Mail")
                    emailButton.setImage(button4, for: UIControl.State.normal)
                    
                    let button5 = UIImage(named: "5. Help")
                    helpButton.setImage(button5, for: UIControl.State.normal)

                    let button6 = UIImage(named: "6. AboutUS")
                    aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //2) Арабский = ar
        else if currentPhoneLangID == "ar"{
                yourPersonalSportsBettingAdvisorLabel.text = "مرشد الرياضة الرياضي الخاص بك"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "نصائح الرهان الرياضي"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //3) Венгерский = hu
        else if currentPhoneLangID == "hu"{
                yourPersonalSportsBettingAdvisorLabel.text = "Az Ön személyes sportfogadási tanácsadója"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Sportfogadási tippek"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //4) Вьетнамский = vi
        else if currentPhoneLangID == "vi"{
                yourPersonalSportsBettingAdvisorLabel.text = "Cố vấn cá cược thể thao cá nhân của bạn"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Mẹo cá cược thể thao"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //5) Греческий = el
        else if currentPhoneLangID == "el"{
                yourPersonalSportsBettingAdvisorLabel.text = "Ο προσωπικός σας σύμβουλος αθλητικών στοιχημάτων"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 20)
                sportBetsLabel.text = "Συμβουλές για αθλητικά στοιχήματα"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //6) Датский = da
        else if currentPhoneLangID == "da"{
                yourPersonalSportsBettingAdvisorLabel.text = "Din personlige sportsvæddelsesrådgiver"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Tips til sportsspil"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //7) Иврит = he
        else if currentPhoneLangID == "he"{
                yourPersonalSportsBettingAdvisorLabel.text = "יועץ ההימורים האישי שלך"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "טיפים להימורי ספורט"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //8) Индонезийский = id
        else if currentPhoneLangID == "id"{
                yourPersonalSportsBettingAdvisorLabel.text = "Penasihat Taruhan Olahraga Pribadi Anda"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Tips Taruhan Olahraga"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //9) Испанский = es
        else if currentPhoneLangID == "es"{
                yourPersonalSportsBettingAdvisorLabel.text = "Su asesor personal de apuestas deportivas"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Consejos de apuestas deportivas"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //10) Итальянский = it
        else if currentPhoneLangID == "it"{
                yourPersonalSportsBettingAdvisorLabel.text = "Il tuo consulente di scommesse sportive personali"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Suggerimenti per le scommesse sportive"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //11) Каталанский = ca
        else if currentPhoneLangID == "ca"{
                yourPersonalSportsBettingAdvisorLabel.text = "El vostre assessor d'apostes personals d'esports"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Consells d'apostes esportives"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //12) Китайский = zh
        else if currentPhoneLangID == "zh"{
                yourPersonalSportsBettingAdvisorLabel.text = "您的个人体育博彩顾问"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "体育博彩技巧"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //13) Корейский = ko
        else if currentPhoneLangID == "ko"{
                yourPersonalSportsBettingAdvisorLabel.text = "개인 스포츠 베팅 어드바이저"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "스포츠 베팅 팁"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //14) Малайский = ms
        else if currentPhoneLangID == "ms"{
                yourPersonalSportsBettingAdvisorLabel.text = "Penasihat Pertaruhan Sukan Peribadi anda"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Petua Pertaruhan Sukan"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //15) Немецкий = de
        else if currentPhoneLangID == "de"{
                yourPersonalSportsBettingAdvisorLabel.text = "Ihr persönlicher Sportwettenberater"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Sportwetten Tipps"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //16) Нидерландский = nl
        else if currentPhoneLangID == "nl"{
                yourPersonalSportsBettingAdvisorLabel.text = "Uw persoonlijke adviseur voor sportweddenschappen"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Tips voor sportweddenschappen"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //17) Норвежский = nb
        else if currentPhoneLangID == "nb"{
                yourPersonalSportsBettingAdvisorLabel.text = "Din personlige sportsrådgiver"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Tips om sportsspill"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //18) Польский = pl
        else if currentPhoneLangID == "pl"{
                yourPersonalSportsBettingAdvisorLabel.text = "Twój osobisty doradca bukmacherski"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Prognozy sportowe"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //19) Португальский = pt
        else if currentPhoneLangID == "pt"{
                yourPersonalSportsBettingAdvisorLabel.text = "O seu conselheiro pessoal de apostas desportivas"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Dicas de apostas esportivas"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //20) Румынский = ro
        else if currentPhoneLangID == "ro"{
                yourPersonalSportsBettingAdvisorLabel.text = "Consilierul dvs. personal de pariuri sportive"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Sfaturi pentru pariuri sportive"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //21) Русский = ru
        
        //22) Словацкий = sk
        else if currentPhoneLangID == "sk"{
                yourPersonalSportsBettingAdvisorLabel.text = "Váš osobný športový poradca"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Tipy na športové stávky"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //23) Тайский = th
        else if currentPhoneLangID == "th"{
                yourPersonalSportsBettingAdvisorLabel.text = "ที่ปรึกษาการเดิมพันกีฬาส่วนบุคคลของคุณ"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "เคล็ดลับการเดิมพันกีฬา"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //24) Турецкий = tr
        else if currentPhoneLangID == "tr"{
                yourPersonalSportsBettingAdvisorLabel.text = "Kişisel Spor Bahis Danışmanınız"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Spor Bahis İpuçları"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        //25) Украинский = uk
        else if currentPhoneLangID == "uk"{
                       yourPersonalSportsBettingAdvisorLabel.text = "Ваш особистий радник на спортивні ставки"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 16)
                       sportBetsLabel.text = "Спортивні прогнози"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
               }
        //26) Финский = fi
        else if currentPhoneLangID == "fi"{
                       yourPersonalSportsBettingAdvisorLabel.text = "Henkilökohtainen urheiluvedonlyöntisi"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                       sportBetsLabel.text = "Vedonlyönnin vinkkejä"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
               }
        //27) Французский = fr
        else if currentPhoneLangID == "fr"{
                       yourPersonalSportsBettingAdvisorLabel.text = "Votre conseiller en paris sportifs personnels"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                       sportBetsLabel.text = "Conseils de paris sportifs"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
               }
        //28) Хинди = hi
        else if currentPhoneLangID == "hi"{
                       yourPersonalSportsBettingAdvisorLabel.text = "आपकी व्यक्तिगत खेल सट्टेबाजी सलाहकार"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                       sportBetsLabel.text = "खेल सट्टेबाजी युक्तियाँ"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
               }
        //29) Хорватский = hr
        else if currentPhoneLangID == "hr"{
                       yourPersonalSportsBettingAdvisorLabel.text = "Vaš osobni savjetnik za klađenje u sportu"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                       sportBetsLabel.text = "Savjeti za klađenje u sportu"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
               }
        //30) Чешский = cs
        else if currentPhoneLangID == "cs"{
                       yourPersonalSportsBettingAdvisorLabel.text = "Váš osobní sportovní sázkový poradce"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                       sportBetsLabel.text = "Tipy pro sportovní sázení"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
               }
        //31) Шведский = sv
        else if currentPhoneLangID == "sv"{
                       yourPersonalSportsBettingAdvisorLabel.text = "Din personliga sportspelrådgivare"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                       sportBetsLabel.text = "Sportspel tips"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
               }
        //32) Японский = ja
        else if currentPhoneLangID == "ja"{
                              yourPersonalSportsBettingAdvisorLabel.text = "あなたのパーソナルスポーツベッティングアドバイザー"
                              yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 14)
                              sportBetsLabel.text = "スポーツ賭博のヒント"
                              sportBetsLabel.font = UIFont.systemFont(ofSize: 18)
                      }
        
        
        
        
        
        
        
        //белая рамка вокруг кнопок
        bettingTipsButton.layer.borderWidth = 2
        bettingTipsButton.layer.borderColor = UIColor.white.cgColor
        statisticsButton.layer.borderWidth = 2
        statisticsButton.layer.borderColor = UIColor.white.cgColor
        chatButton.layer.borderWidth = 2
        chatButton.layer.borderColor = UIColor.white.cgColor
        emailButton.layer.borderWidth = 2
        emailButton.layer.borderColor = UIColor.white.cgColor
        helpButton.layer.borderWidth = 2
        helpButton.layer.borderColor = UIColor.white.cgColor
        aboutUsButton.layer.borderWidth = 2
        aboutUsButton.layer.borderColor = UIColor.white.cgColor
      
    //высота экрана iphone SE = 568.0
    //высота экрана iphone 5S = 568.0
        
    //высота экрана iphone 6 = 667.0 (w=375)
    //высота экрана iphone 6S = 667.0
    //высота экрана iphone 7 = 667.0
    //высота экрана iphone 8 = 667.0
        
    //высота экрана iphone 6 Plus = 736.0
    //высота экрана iphone 6S Plus = 736.0
    //высота экрана iphone 7 Plus = 736.0
    //высота экрана iphone 8 Plus = 736.0
    
    //высота экрана iphone X = 812.0
    //высота экрана iphone 11 Pro = 812.0
        
    //высота экрана iphone 11 = 896.0
    //высота экрана iphone 11 Pro Max = 896.0
     
    //iPadPro 9.7, iPad Air2, iPad Air, iPad 5th gen
        // Высота экрана iPadPro 9.7 =  1024.0
        // Ширина экрана iPadPro 9. =  768.0
        
    //iPad Pro (12.9) 2nd, 4th gen
        //Высота экрана =  1366.0
        //Ширина экрана =  1024.0
        
    //iPad Pro (11) 2nd gen
        //Высота экрана =  1194.0
        //Ширина экрана =  834.0
        
    //iPadPro (10.5-inch), iPad Air (3rd gen)
        //Высота экрана =  1112.0
        //Ширина экрана =  834.0
        
    //iPad 7th gen
        //Высота экрана =  1080.0
        //Ширина экрана =  810.0
        
        
        //проверяем размер экрана!!!!
        let h = UIScreen.main.bounds.height
        let w = UIScreen.main.bounds.width
        print("//Высота экрана = ",h)
        print("//Ширина экрана = ",w)
        
       
        
        //если размер экрана не iphone 5S и SE, то показывать нижний label на главном экране = "Спортивные прогнозы"
        if UIScreen.main.bounds.height != 568 {
            sportBetsLabel.isHidden = false
        }
        
        //Для iPhone 5S, SE (с высотой экрана 568.0, width = 320) - настроены Constraints
        if UIScreen.main.bounds.height == 568 {
             //top Constraint для верхнего label
            //17
            upConstraintYourPersonalSportsBettingAdvisor.constant = 12
            //top Constraint для верхних двух кнопок "Прогнозы" и "Статистика". Тк все кнопки привязаны к верхним кнопкам, они автоматически подтягиваются
            //93
            bettingTipsButtonTopConstraint.constant = 80
            statisticsButtonTopConstraint.constant = 80
        }
        
        //Для iPhone 6, 6S, 7, 8, SE_2nd (с высотой экрана 667.0, width = 375) - настроены Constraints
        if UIScreen.main.bounds.height == 667 {
            
            //top Constraint для верхнего label
            upConstraintYourPersonalSportsBettingAdvisor.constant = 17
            
            //top Constraint для верхних двух кнопок "Прогнозы" и "Статистика". Тк все кнопки привязаны к верхним кнопкам, они автоматически подтягиваются
            bettingTipsButtonTopConstraint.constant = 88
            statisticsButtonTopConstraint.constant = 88
        
            //левый и правый constraint нижнего Label = Спортивные прогнозы
            sportBetsLabelLeftConstraint.constant = 100
            sportBetsLabelRightConstraint.constant = 100
       
        }

        
        //Для iPhone 6+, 6S+ 7+, 8+ (с высотой экрана 736.0, width - 414) - настроены Constraints
        if UIScreen.main.bounds.height == 736 {

            //top Constraint для верхних двух кнопок "Прогнозы" и "Статистика". Тк все кнопки привязаны к верхним кнопкам, они автоматически подтягиваются
            bettingTipsButtonTopConstraint.constant = 111
            statisticsButtonTopConstraint.constant = 111
            //left right Constraint для нижнего label "Спортивные прогнозы" "Sport Betting Tips"
            sportBetsLabelLeftConstraint.constant = 120
            sportBetsLabelRightConstraint.constant = 120
            leftConstraintYourPersonalSportsBettingAdvisor.constant = 36
            rightConstraintYourPersonalSportsBettingAdvisor.constant = 36
        }
        
        
        //Для iPhone X, 11pro (с высотой экрана 812.0, width = 375) - настроены Constraints
            if UIScreen.main.bounds.height == 812 {
                bettingTipsButtonTopConstraint.constant = 111
                statisticsButtonTopConstraint.constant = 111
            }
        
        
        //Для iPhone 11, 11 Pro Max (с высотой экрана 896.0, width = 414) - настроены Constraints
        if UIScreen.main.bounds.height == 896 {
            bettingTipsButtonTopConstraint.constant = 161
            statisticsButtonTopConstraint.constant = 161
            sportBetsLabelLeftConstraint.constant = 100
            sportBetsLabelRightConstraint.constant = 100
            
        }
        
        //iPadPro 9.7, iPad Air2, iPad Air, iPad 5th gen
        if UIScreen.main.bounds.height == 1024 && UIScreen.main.bounds.width == 768 {
            bettingTipsButtonHeight.constant = 235
            statisticsButtonHeight.constant = 235
            chatButtonHeight.constant = 235
            emailButtonHeight.constant = 235
            helpButtonHeight.constant = 235
            aboutUsButtonHeight.constant = 235
            bettingTipsButtonTopConstraint.constant = 130
            statisticsButtonTopConstraint.constant = 130
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 30)
            iLoveBetsLabel.font = UIFont.systemFont(ofSize: 80)
            sportBetsLabel.font = UIFont.systemFont(ofSize: 30)
            iLoveBetsTopConstraints.constant  = 15
            if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 20)
            }
        }
        
        
        //ipad Pro (12.9-inch) 2nd, 4th gen
        //Высота экрана =  1366.0
        //Ширина экрана =  1024.0
        if UIScreen.main.bounds.height == 1366 && UIScreen.main.bounds.width == 1024 {
            bettingTipsButtonHeight.constant = 280
            statisticsButtonHeight.constant = 280
            chatButtonHeight.constant = 280
            emailButtonHeight.constant = 280
            helpButtonHeight.constant = 280
            aboutUsButtonHeight.constant = 280
            bettingTipsButtonTopConstraint.constant = 250
            statisticsButtonTopConstraint.constant = 250
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 40.2)
            iLoveBetsLabel.font = UIFont.systemFont(ofSize: 106.72)
            sportBetsLabel.font = UIFont.systemFont(ofSize: 40.2)
            iLoveBetsTopConstraints.constant  = 50
            sportBetsLabelBottomConstraint.constant = 60
        }
            if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 26.68)
            }
        
        
        //iPad Pro (11-inch) 2nd gen
        //Высота экрана =  1194.0
        //Ширина экрана =  834.0
        if UIScreen.main.bounds.height == 1194 && UIScreen.main.bounds.width == 834 {
            bettingTipsButtonHeight.constant = 250
            statisticsButtonHeight.constant = 250
            chatButtonHeight.constant = 250
            emailButtonHeight.constant = 250
            helpButtonHeight.constant = 250
            aboutUsButtonHeight.constant = 250
            bettingTipsButtonTopConstraint.constant = 171
            statisticsButtonTopConstraint.constant = 171
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 35)
            iLoveBetsLabel.font = UIFont.systemFont(ofSize: 93.28)
            sportBetsLabel.font = UIFont.systemFont(ofSize: 34.98)
            iLoveBetsTopConstraints.constant  = 17.49
            if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 23.32)
            }
        }
        
        
        //iPadPro (10.5-inch), iPad Air (3rd gen)
            //Высота экрана =  1112.0
            //Ширина экрана =  834.0
        if UIScreen.main.bounds.height == 1112 && UIScreen.main.bounds.width == 834 {
            bettingTipsButtonHeight.constant = 250
            statisticsButtonHeight.constant = 250
            chatButtonHeight.constant = 250
            emailButtonHeight.constant = 250
            helpButtonHeight.constant = 250
            aboutUsButtonHeight.constant = 250
            bettingTipsButtonTopConstraint.constant = 171
            statisticsButtonTopConstraint.constant = 171
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 35)
            iLoveBetsLabel.font = UIFont.systemFont(ofSize: 93.28)
            sportBetsLabel.font = UIFont.systemFont(ofSize: 34.98)
            iLoveBetsTopConstraints.constant  = 17.49
            if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 23.32)
            }
        }
        
        //iPad 7th gen
        if UIScreen.main.bounds.height == 1080 && UIScreen.main.bounds.width == 810 {
            bettingTipsButtonHeight.constant = 235
            statisticsButtonHeight.constant = 235
            chatButtonHeight.constant = 235
            emailButtonHeight.constant = 235
            helpButtonHeight.constant = 235
            aboutUsButtonHeight.constant = 235
            bettingTipsButtonTopConstraint.constant = 160
            statisticsButtonTopConstraint.constant = 160
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 30)
            iLoveBetsLabel.font = UIFont.systemFont(ofSize: 80)
            sportBetsLabel.font = UIFont.systemFont(ofSize: 30)
            iLoveBetsTopConstraints.constant  = 25
            if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 20)
            }
        }
        
        
    } //конец функции viewDidLoad


    
    
    
    //вызов почтового клиента при нажатии по кнопке
    @IBAction func emailButtonTapped(_ sender: Any) {
        //это необходимо тестировать на устройстве
        showMailComposer()
    }
    
        func showMailComposer() {
        //проверяем, что устройство может отправлять e-mail:
            guard MFMailComposeViewController.canSendMail() else {
                //показать оповещение, что пользователь не может отправить сообщение. но в старой версии приложения, я закомментировал это
            return
            }
        
            //v.3.2
            /*
            //проверка языка локализации!!!!!!!!!!
            let locale = NSLocale.current
            let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
            var currentPhoneLangID = currentLangID
            //вычитаем 3 символа, чтобы получилось только ru (ru-US)
            let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
            currentPhoneLangID.removeSubrange(range)
            */
            
            let composer = MFMailComposeViewController()
            
            //v.2.3
           // if currentLangID == "ru-RU"
               if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
            composer.mailComposeDelegate = self
            composer.setToRecipients(["ilovebets@ya.ru"])
            composer.setSubject("Обратная связь iLoveBets")
            composer.setMessageBody("<b>Имя:</b>&nbsp<br><br><b>Сообщение:</b>&nbsp", isHTML: true)
            }else{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Write to iLoveBets")
                composer.setMessageBody("<b>Name:</b>&nbsp<br><br><b>Message:</b>&nbsp", isHTML: true)
                
            }
    
            present(composer, animated: true)
    }


}

extension ViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //Показать оповещение об ошибке
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case . failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email Sent")
        }
        
        controller.dismiss(animated: true)
    }
}
