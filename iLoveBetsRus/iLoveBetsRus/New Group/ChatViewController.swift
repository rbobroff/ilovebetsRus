//
//  ChatViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 07.12.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

//настройка чата: https://learnappmaking.com/chat-app-ios-firebase-swift-xcode/

import UIKit
import JSQMessagesViewController


class ChatViewController: JSQMessagesViewController {
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
       
        // v.2.3 закомментировали
        //добавление строки навигации при загрузке ViewControllera
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

    
    
    
    //mwssages сохраняет в себе множественные объекты из массима JSQMessage, к которым позже можно обращаться по индексам
    var messages = [JSQMessage]()
  
    
        //Create message bubbles in the right colors
    lazy var outgoingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleGreen())
    }()

    lazy var incomingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
            //этот блок использовался для тестирования чата для одного пользователя
            /*   senderId = "1234"
        senderDisplayName = "RomanB" */
        
        
 //multiple users
        let defaults = UserDefaults.standard

        if  let id = defaults.string(forKey: "jsq_id"),
            let name = defaults.string(forKey: "jsq_name")
        {
            senderId = id
            senderDisplayName = name
        }
        else
        {
            senderId = String(arc4random_uniform(999999))
            
            //v.3.1 - если пустое имя, вводить user
            if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
            //заголовок ViewController
                senderDisplayName = "Пользователь"
                defaults.set(senderId, forKey: "jsq_id")
                defaults.synchronize()
                //вывести сообщение о соглашении EULA!!!!!!!!!!!!
                showDisplayEULADialog()
                //v3.1 - этот метод уже не надо выводить. его выполнение запихивается в кнопку yes. ввод имени
                //showDisplayNameDialog()
            } else {
                senderDisplayName = "User"
                defaults.set(senderId, forKey: "jsq_id")
                defaults.synchronize()
                //вывести сообщение о соглашении EULA!!!!!!!!!!!!
                showDisplayEULADialog()
                //v3.1 - этот метод уже не надо выводить. его выполнение запихивается в кнопку yes. ввод имени
                //showDisplayNameDialog()
            }
           
            //senderDisplayName = "user"

            //тк добавил условие выше, это комментирую
            /*
            defaults.set(senderId, forKey: "jsq_id")
            defaults.synchronize()

            //вывести сообщение о соглашении EULA!!!!!!!!!!!!
            showDisplayEULADialog()
            //v3.1 - этот метод уже не надо выводить. его выполнение запихивается в кнопку yes. ввод имени
            //showDisplayNameDialog()
            
            */
            
        }

        
        //v.2.3 комментируем
        //проверка языка локализации!!!!!!!!!!
             /*      let locale = NSLocale.current
                   let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
                   var currentPhoneLangID = currentLangID
                   //вычитаем 3 символа, чтобы получилось только ru (ru-US)
                   let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
                   currentPhoneLangID.removeSubrange(range)
                */
        
        /*
        //убираем слово Чат или Chat из заголовка Чата
        //v2.3
        //если русский язык, отображать ЗАГОЛОВОК по-русски
        if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
        //заголовок ViewController
            title = "Чат: \(senderDisplayName! + "_id" + senderId)"
        } else {
            title = "Chat: \(senderDisplayName! + "_id" + senderId)"
        }
        */
        
        
        //v3.1
        //если русский язык, отображать ЗАГОЛОВОК по-русски
        if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
        //заголовок ViewController
            title = "Чат: \(senderDisplayName!)"
        } else {
            title = "Chat: \(senderDisplayName!)"
        }
        
        //v.3.1
        //заголовок чата после 2-го входа в чат. при первом входе записывается имя заголовка "Чат" или "Chat"
       //title = senderDisplayName!
        //+ "_id" + senderId
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showDisplayNameDialog))
        tapGesture.numberOfTapsRequired = 1

        navigationController?.navigationBar.addGestureRecognizer(tapGesture)

        
        
        //The first line hides the attachment button on the left of the chat text input field. The other two lines of code set the avatar size to zero, again, hiding it.
        inputToolbar.contentView.leftBarButtonItem = nil
        
collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        
       
        //Observing Firebase For New Chat Messages
        let query = Constants.refs.databaseChats.queryLimited(toLast: 50)

        _ = query.observe(.childAdded, with: { [weak self] snapshot in

            if  let data        = snapshot.value as? [String: String],
                let id          = data["sender_id"],
                let name        = data["name"],
                let text        = data["text"],
                !text.isEmpty
            {
                if let message = JSQMessage(senderId: id, displayName: name, text: text)
                {
                    self?.messages.append(message)

                    self?.finishReceivingMessage()
                }
            }
        })
    } //закрытие viewDidLoad =============================================
    

    
    //v.3.1 - создание оповещения согласия EULA
    func showDisplayEULADialog() {
    //v.3.1 - создание оповещения согласия EULA
        //по умолчанию
                    var alertEULA = UIAlertController(title: "User generated contents rules", message: "By clicking “Agree” you agree with our content generated rules. By posting User Content you warrant that you own all rights in and to the User Content shared by you and that you are not breaching any other party’s rights to privacy, publicity rights, copyrights or contractual rights. User Content must not be illegal, obscene, threatening, defamatory, invasive of privacy, infringing of intellectual property rights, violate any confidentiality agreement or other contract or be otherwise injurious to third parties or objectionable and must not consist of or contain software viruses, political campaigning, commercial solicitation, chain letters, mass mailings, or any form of spam. We have the right but not the obligation to refuse to post, remove or edit any posting or submission User Content. Any User Content submitted by you will remain on iLoveBets App indefinitely. You will not have the option to remove your User Content from iLoveBets App at any time, except where you submit a request by email to iLoveBets App (ilovebets@ya.ru) to remove your or other inappropriate User Content (copy the text from a message and send to us). You understand and agree that if you post any User Content to iLoveBets App which breaches any of these Terms, we have the right to remove the content, terminate your account and you will be responsible to us for any issues arising out of breach of these Terms.", preferredStyle: .actionSheet)
        
                    var yesAgreeEULA = UIAlertAction(title: "Agree", style: .default, handler: { action in
                        //при нажатии кнопка "yes", показать окно ввода имени
                        self.showDisplayNameDialog()
                    })
        
                    //при нажатии "нет" убирать кнопку Send и заголовок чата
                    var noAgreeEULA = UIAlertAction(title: "Cancel", style: .destructive, handler: { action in
                        print("hello")
                        //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                        self.inputToolbar.contentView.rightBarButtonItem = nil
                        self.title = " "
                    })
        
        //v.3.1 EULA для русского языка
        if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
            alertEULA = UIAlertController(title: "Пользовательское соглашение", message: "Нажав “Согласен”, вы соглашаетесь с нашими правилами, созданными для контента. Размещая Пользовательский контент, вы гарантируете, что вы владеете всеми правами на Пользовательский контент, которым вы делитесь, и что вы не нарушаете права любой другой стороны на неприкосновенность частной жизни, права на публичность, авторские права или договорные права. Пользовательский контент не должен быть незаконным, непристойным, угрожающим, дискредитирующим, нарушающим конфиденциальность, нарушающим права интеллектуальной собственности, нарушающим любое соглашение о конфиденциальности или иной договор, или причиняющим иные вредные последствия для третьих сторон и не должен состоять из политических кампаний, коммерческих предложений, рассылки писем, массовых рассылок или любой формы спама. Мы имеем право, но не обязаны отказать в размещении, удалении или редактировании любого Пользовательского контента. Любой предоставленный вами Пользовательский контент останется в iLoveBets App на неопределенный срок. У вас не будет возможности удалить ваш Пользовательский контент из приложения iLoveBets App в любое время, кроме случаев отправления запроса по электронной почте в приложении iLoveBets App (ilovebets@ya.ru), чтобы удалить ваш или другой неподходящий Пользовательский контент (необходимо скопировать текст из сообщения и отправить нам). Вы понимаете и соглашаетесь с тем, что если вы публикуете какой-либо Пользовательский контент в iLoveBets App, который нарушает какое-либо из этих Условий, мы имеем право удалить его по собственному усмотрению и закрыть ваш аккаунт. Вы будете нести ответственность перед нами за любые возникающие проблемы из-за нарушения настоящих Условий.", preferredStyle: .actionSheet)
           
            yesAgreeEULA = UIAlertAction(title: "Согласен", style: .default, handler: { action in
                //при нажатии кнопка "yes", показать окно ввода имени
                self.showDisplayNameDialog()
            })
           
            noAgreeEULA = UIAlertAction(title: "Отмена", style: .destructive, handler: { action in
                print("hello")
                //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                self.inputToolbar.contentView.rightBarButtonItem = nil
                self.title = " "
            })
        } // конец локализации EULA для русского языка
        
    
    alertEULA.addAction(yesAgreeEULA)
    alertEULA.addAction(noAgreeEULA)
        
        //v.3.1. Без этих строк на ipad уведомление с типом actionSheet вызывает ошибку выполнения приложения. Решение: https://medium.com/@nickmeehan/actionsheet-popover-on-ipad-in-swift-5768dfa82094
        //добавил строчку для корректной работы оповещения на iPad
    if let popoverController = alertEULA.popoverPresentationController {
    popoverController.sourceView = self.view
    popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
    //popoverController.permittedArrowDirections = []
        }
        
        
      //показать оповещение
    self.present(alertEULA, animated: true, completion: nil)
    } //конец функции func showDisplayEULADialog()
    
    

    
    //Setting A User’s Display Name With A Dialog
    //чтобы были разные имена у пользователей
    @objc func showDisplayNameDialog()
    {
        let defaults = UserDefaults.standard

        
        
        //v2.3
        //проверка языка локализации!!!!!!!!!!
                /*          let locale = NSLocale.current
                          let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
                          var currentPhoneLangID = currentLangID
                          //вычитаем 3 символа, чтобы получилось только ru (ru-US)
                          let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
                          currentPhoneLangID.removeSubrange(range)
        */
        
        //сообщение при входе в чат о необходимости ввести имя. по умолчанию - английский язык
        //v.3.1 - изменил: preferredStyle: .alert на .actionSheet - чтобы было 2 кнопки
            var alert = UIAlertController(title: "Your Display Name", message: "Before you can chat, please choose a display name. Others will see this name when you send chat messages. You can change your display name again by tapping the navigation bar.", preferredStyle: .actionSheet)
           
                        
        
        //v.3.1 - Создание оповещения при вводе имени Anonymous или anonymous
            var noAnonymousAlert = UIAlertController(title: "You can't use this name", message: nil, preferredStyle: .alert)
            var yesAction = UIAlertAction(title: "Try again", style: .cancel, handler: {action in
                 //v.3.1 - повторно вывести сообщение с вводом имени
            self.present(alert, animated: true, completion: nil)
        })
        
            //локализация для русского языка. Оповещение при вводе имени Аноним или аноним и тд
                if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
                    noAnonymousAlert = UIAlertController(title: "Вы не можете использовать это имя", message: nil, preferredStyle: .alert)
                    yesAction = UIAlertAction(title: "Попробуйте еще раз", style: .cancel, handler: {action in
                //v.3.1 - повторно вывести сообщение с вводом имени
                self.present(alert, animated: true, completion: nil)
                    })
                }

            noAnonymousAlert.addAction(yesAction)
        //для iPad оповещения, если ввели имя "аноним" и тд. без этих строк ниже, ошибка при появлении данного оповещения
        if let popoverController = noAnonymousAlert.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        
        
        //v.2.3
        //если русский язык телефона, отображать всплывающее сообщение о вводе имени по-русски
        if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
        //Сообщение, где предлагается ввести имя
     //для русской версии, v.3.1 - изменил preferredStyle: .alert на actionSheet, чтобы бло 2 сообщения
            alert = UIAlertController(title: "Введите имя", message: "Прежде чем Вы сможете общаться, введите имя. Другие пользователи увидят Ваше имя при отправке сообщений чата. Вы можете изменить свое имя, нажав на панель навигации", preferredStyle: .alert)
        
        } else {
        
      //  для английской версии
            alert = UIAlertController(title: "Your Display Name", message: "Before you can chat, please choose a display name. Others will see this name when you send chat messages. You can change your display name again by tapping the navigation bar.", preferredStyle: .alert)
        }
        
        
        
        alert.addTextField { textField in

            if let name = defaults.string(forKey: "jsq_name")
            {
                textField.text = name
            
            }
            else
            {
                let names = ["Ford", "Arthur", "Zaphod", "Trillian", "Slartibartfast", "Humma Kavula", "Deep Thought"]
                textField.text = names[Int(arc4random_uniform(UInt32(names.count)))]
            }
        }

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self, weak alert] _ in

            
            
            if let textField = alert?.textFields?[0], !textField.text!.isEmpty {
               //v.3.1 - если имя пользователя анонимный, то вывести предупреждение, когда нажимаю ОК, что это недопустимое имя
                if textField.text!.isEmpty || textField.text == "anonymous" || textField.text == "Anonymous" || textField.text == "fuck" || textField.text == "Fuck" || textField.text == " " || textField.text == "Аноним" || textField.text == "аноним" || textField.text == "хуй" || textField.text == "Хуй" || textField.text == "Сука" || textField.text == "сука" || textField.text == "Пизда" || textField.text == "пизда" || textField.text == "Пиздец" || textField.text == "пиздец" {
                    print("привет анонимный пользователь")
                   
// для уведомления
                    
                    self?.present(noAnonymousAlert, animated: true, completion: nil)
                    
                }
                
                self?.senderDisplayName = textField.text
                
              
                
                
                //v.2.3
                //проверка языка локализации!!!!!!!!!!
               /* let locale = NSLocale.current
                let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
                var currentPhoneLangID = currentLangID
                //вычитаем 3 символа, чтобы получилось только ru (ru-US)
                let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
                currentPhoneLangID.removeSubrange(range)
                */
              
                //v.3.1
                /*
            //v.2.3
            if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
                self?.title = "Чат: \(self!.senderDisplayName!)"
            } else {
                self?.title = "Chat: \(self!.senderDisplayName!)"
            }
                */
                
                
                defaults.set(textField.text, forKey: "jsq_name")
                defaults.synchronize()
            }
        }))

        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    //2 следующих метода
    //OK, next up: JSQMVC needs access to the data from messages in order to show those message bubbles
    //Providing JSQMVC with the message data
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData!
    {
        return messages[indexPath.item]
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return messages.count
    }
    
    
     //Create message bubbles in the right colors
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource!
    {
        return messages[indexPath.item].senderId == senderId ? outgoingBubble : incomingBubble
    }

    
//Hide avatars for message bubbles
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource!
    {
        return nil
    }
    

    // Set the name label for message bubbles
    //is called when the label text is needed
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString!
    {

        //v.3.1 добавить имя пользователя и к моим сообщениям
        return NSAttributedString(string: messages[indexPath.item].senderDisplayName)
        //убрать имя пользователя из моих сообщений:
        /*return messages[indexPath.item].senderId == senderId ? nil : NSAttributedString(string: messages[indexPath.item].senderDisplayName)*/
    
    }
//is called when the height of the top label is needed - для отображения имени у сообщений
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat
    {
        //v.3.1 добавить имя пользователя и к моим сообщениям
        return messages[indexPath.item].senderId == senderId ? 15 : 15
        // 0 - убрать имя пользователя с моих сообщений:
        //return messages[indexPath.item].senderId == senderId ? 0 : 15
        
    }
    
    
    //при нажатии кнопки отправить
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!)
    {
        let ref = Constants.refs.databaseChats.childByAutoId()
        //создается словарь message
        //!!!!добавление id к имени пользователя при отправке сообщения!!!!
        let message = ["sender_id": senderId, "name": senderDisplayName + "_id" + senderId, "text": text]

        ref.setValue(message)

        finishSendingMessage()
    }
    
    
    
} //скобка закрытия класса
