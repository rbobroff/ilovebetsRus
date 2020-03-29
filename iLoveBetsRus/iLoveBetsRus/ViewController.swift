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
    
    //аутлет label внизу на главном экране = Спортивные прогнозы:
    @IBOutlet weak var sportBetsLabel: UILabel!
     //аутлет label вверху на главном экране = Ваш персональный помощник в мире спортивного беттинга:
    @IBOutlet weak var yourPersonalSportsBettingAdvisorLabel: UILabel!
    //аутлет iLoveBets label
    @IBOutlet weak var iLoveBetsLabel: UILabel!
    
    
    
    
    
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
     print("Текущий язык телефон-Регион = ",currentLangID)
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
        //снять комментарий после скриншотов
      
        
        
        //тк по умолчанию уже кнопки и надписи на английском языке
         /*
                } else {
        yourPersonalSportsBettingAdvisorLabel.text = "Your Personal Sports Betting Advisor"
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                    
                    sportBetsLabel.text = "Sports Betting Tips"
                    sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
        }
        */
        
        
        
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
        
        //проверяем размер экрана!!!!
        var h = UIScreen.main.bounds.height
        var w = UIScreen.main.bounds.width
        print("Высота экрана = ",h)
        print("Ширина экрана = ",w)
        
       
        
        //если размер экрана не iphone 5S и SE, то показывать нижний label на главном экране = "Спортивные прогнозы"
        if UIScreen.main.bounds.height != 568 {
            sportBetsLabel.isHidden = false
        }
        
        //Для iPhone 5S, SE (с высотой экрана 568.0) - настроены Constraints
        if UIScreen.main.bounds.height == 568 {
             //top Constraint для верхнего label
    upConstraintYourPersonalSportsBettingAdvisor.constant = 17
            //top Constraint для верхних двух кнопок "Прогнозы" и "Статистика". Тк все кнопки привязаны к верхним кнопкам, они автоматически подтягиваются
            bettingTipsButtonTopConstraint.constant = 93
            statisticsButtonTopConstraint.constant = 93
        }
        
        //Для iPhone 6, 6S, 7, 8 (с высотой экрана 667.0) - настроены Constraints
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

        
        //Для iPhone 6+, 6S+ 7+, 8+ (с высотой экрана 736.0, 414) - настроены Constraints
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
        
        
        //Для iPhone X, 11pro (с высотой экрана 812.0) - настроены Constraints
            if UIScreen.main.bounds.height == 812 {
                bettingTipsButtonTopConstraint.constant = 111
                statisticsButtonTopConstraint.constant = 111
            }
        
        
        //Для iPhone 11, 11 Pro Max (с высотой экрана 896.0) - настроены Constraints
        if UIScreen.main.bounds.height == 896 {
            bettingTipsButtonTopConstraint.constant = 161
            statisticsButtonTopConstraint.constant = 161
            sportBetsLabelLeftConstraint.constant = 100
            sportBetsLabelRightConstraint.constant = 100
            
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
               if currentPhoneLangID == "ru" {
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
