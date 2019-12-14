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
    
    
    //темный StatusBar на главном экране
 //   override func viewDidAppear(_ animated: Bool) {
      // 1
  //    let nav = self.navigationController?.navigationBar
      // 2
 //     nav?.barStyle = UIBarStyle.black
 //   }
    
    
   // скрывать navigation bar (или показывать)
     override func viewWillAppear(_ animated: Bool) {
   self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
            let composer = MFMailComposeViewController()
            composer.mailComposeDelegate = self
            composer.setToRecipients(["ilovebets@ya.ru"])
            composer.setSubject("Обратная связь iLoveBets")
            composer.setMessageBody("<b>Имя:</b>&nbsp<br><br><b>Сообщение:</b>&nbsp", isHTML: true)
  
    
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
