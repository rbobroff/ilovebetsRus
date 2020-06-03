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
            if currentPhoneLangID == "ru" {
            //заголовок ViewController
                senderDisplayName = "Пользователь"
                defaults.set(senderId, forKey: "jsq_id")
                defaults.synchronize()
                //вывести сообщение о соглашении EULA!!!!!!!!!!!!
                showDisplayEULADialog()
                //v3.1 - этот метод уже не надо выводить. его выполнение запихивается в кнопку yes. ввод имени
                //showDisplayNameDialog()
            }
            
                //v.3.2
                //2) арабский
                else if currentPhoneLangID == "ar"{
                    senderDisplayName = "المستعمل"
                    defaults.set(senderId, forKey: "jsq_id")
                    defaults.synchronize()
                    showDisplayEULADialog()
                }
                //3) Венгерский = hu
                else if currentPhoneLangID == "hu"{
                                         senderDisplayName = "Felhasználó"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //4) Вьетнамский = vi
                else if currentPhoneLangID == "vi"{
                                         senderDisplayName = "Người dùng"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                    
                }
                //5) Греческий = el
                else if currentPhoneLangID == "el"{
                                         senderDisplayName = "Χρήστης"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //6) Датский = da
                else if currentPhoneLangID == "da"{
                                         senderDisplayName = "Bruger"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //7) Иврит = he
                else if currentPhoneLangID == "he"{
                                         senderDisplayName = "משתמש"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //8) Индонезийский = id
                else if currentPhoneLangID == "id"{
                                         senderDisplayName = "Pengguna"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //9) Испанский = es
                else if currentPhoneLangID == "es"{
                                         senderDisplayName = "Usuario(a)"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //10) Итальянский = it
                else if currentPhoneLangID == "it"{
                                         senderDisplayName = "Utente"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //11) Каталанский = ca
                else if currentPhoneLangID == "ca"{
                                         senderDisplayName = "Usuari"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //12) Китайский = zh
                else if currentPhoneLangID == "zh"{
                                         senderDisplayName = "用戶"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                  
                }
                //13) Корейский = ko
                else if currentPhoneLangID == "ko"{
                                         senderDisplayName = "사용자"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //14) Малайский = ms
                else if currentPhoneLangID == "ms"{
                                         senderDisplayName = "Pengguna"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //15) Немецкий = de
                else if currentPhoneLangID == "de"{
                                         senderDisplayName = "Benutzer"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //16) Нидерландский = nl
                else if currentPhoneLangID == "nl"{
                                         senderDisplayName = "Gebruiker"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //17) Норвежский = nb
                else if currentPhoneLangID == "nb"{
                                         senderDisplayName = "Bruker"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //18) Польский = pl
                else if currentPhoneLangID == "pl"{
                                         senderDisplayName = "Użytkownik"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //19) Португальский = pt
                else if currentPhoneLangID == "pt"{
                                         senderDisplayName = "Do utilizador"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //20) Румынский = ro
                else if currentPhoneLangID == "ro"{
                                         senderDisplayName = "Utilizator"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //21) Русский = ru
                
                //22) Словацкий = sk
                else if currentPhoneLangID == "sk"{
                                         senderDisplayName = "Užívateľ"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //23) Тайский = th
                else if currentPhoneLangID == "th"{
                                         senderDisplayName = "ผู้ใช้งาน"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //24) Турецкий = tr
                else if currentPhoneLangID == "tr"{
                                         senderDisplayName = "Kullanıcı"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //25) Украинский = uk
                else if currentPhoneLangID == "uk"{
                                         senderDisplayName = "Користувач"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //26) Финский = fi
                else if currentPhoneLangID == "fi"{
                                         senderDisplayName = "Käyttäjän"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //27) Французский = fr
                else if currentPhoneLangID == "fr"{
                                         senderDisplayName = "Utilisateur"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //28) Хинди = hi
                else if currentPhoneLangID == "hi"{
                                         senderDisplayName = "उपयोगकर्ता"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //29) Хорватский = hr
                else if currentPhoneLangID == "hr"{
                                         senderDisplayName = "Korisnik"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //30) Чешский = cs
                else if currentPhoneLangID == "cs"{
                                         senderDisplayName = "Uživatel"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //31) Шведский = sv
                else if currentPhoneLangID == "sv"{
                                         senderDisplayName = "Användare"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //32) Японский = ja
                else if currentPhoneLangID == "ja"{
                                         senderDisplayName = "ユーザー"
                     defaults.set(senderId, forKey: "jsq_id")
                     defaults.synchronize()
                     showDisplayEULADialog()
                }
                //другой язык не из списка или английский
                else {
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
            if currentPhoneLangID == "ru" {
            //заголовок ViewController
            title = "Чат: \(senderDisplayName!)"
            }
                         //v.3.2
                         //2) арабский
                         else if currentPhoneLangID == "ar"{
                              title = "دردشة: \(senderDisplayName!)"
                             
                         }
                         //3) Венгерский = hu
                         else if currentPhoneLangID == "hu"{
                             title = "Csevegés: \(senderDisplayName!)"
                         }
                         //4) Вьетнамский = vi
                         else if currentPhoneLangID == "vi"{
                             title = "Trò chuyện: \(senderDisplayName!)"
                             
                         }
                         //5) Греческий = el
                         else if currentPhoneLangID == "el"{
                              title = "Κουβέντα: \(senderDisplayName!)"
                         }
                         //6) Датский = da
                         else if currentPhoneLangID == "da"{
                             title = "Snak: \(senderDisplayName!)"
                         }
                         //7) Иврит = he
                         else if currentPhoneLangID == "he"{
                              title = "צ'אט: \(senderDisplayName!)"
                         }
                         //8) Индонезийский = id
                         else if currentPhoneLangID == "id"{
                              title = "Obrolan: \(senderDisplayName!)"
                         }
                         //9) Испанский = es
                         else if currentPhoneLangID == "es"{
                              title = "Charla: \(senderDisplayName!)"
                         }
                         //10) Итальянский = it
                         else if currentPhoneLangID == "it"{
                             title = "Chiacchierare: \(senderDisplayName!)"
                         }
                         //11) Каталанский = ca
                         else if currentPhoneLangID == "ca"{
                             title = "Xatejar: \(senderDisplayName!)"
                         }
                         //12) Китайский = zh
                         else if currentPhoneLangID == "zh"{
                              title = "聊天室: \(senderDisplayName!)"
                           
                         }
                         //13) Корейский = ko
                         else if currentPhoneLangID == "ko"{
                             title = "잡담: \(senderDisplayName!)"
                         }
                         //14) Малайский = ms
                         else if currentPhoneLangID == "ms"{
                             title = "Berbual: \(senderDisplayName!)"
                         }
                         //15) Немецкий = de
                         else if currentPhoneLangID == "de"{
                             title = "Plaudern: \(senderDisplayName!)"
                         }
                         //16) Нидерландский = nl
                         else if currentPhoneLangID == "nl"{
                             title = "Chat: \(senderDisplayName!)"
                         }
                         //17) Норвежский = nb
                         else if currentPhoneLangID == "nb"{
                             title = "Chat: \(senderDisplayName!)"
                         }
                         //18) Польский = pl
                         else if currentPhoneLangID == "pl"{
                             title = "Czat: \(senderDisplayName!)"
                         }
                         //19) Португальский = pt
                         else if currentPhoneLangID == "pt"{
                             title = "Bate-papo: \(senderDisplayName!)"
                         }
                         //20) Румынский = ro
                         else if currentPhoneLangID == "ro"{
                             title = "Conversație: \(senderDisplayName!)"
                         }
                         //21) Русский = ru
                         
                         //22) Словацкий = sk
                         else if currentPhoneLangID == "sk"{
                             title = "Chat: \(senderDisplayName!)"
                         }
                         //23) Тайский = th
                         else if currentPhoneLangID == "th"{
                             title = "การพูดคุย: \(senderDisplayName!)"
                         }
                         //24) Турецкий = tr
                         else if currentPhoneLangID == "tr"{
                              title = "Sohbet: \(senderDisplayName!)"
                         }
                         //25) Украинский = uk
                         else if currentPhoneLangID == "uk"{
                             title = "Чат: \(senderDisplayName!)"
                         }
                         //26) Финский = fi
                         else if currentPhoneLangID == "fi"{
                             title = "Chat: \(senderDisplayName!)"
                         }
                         //27) Французский = fr
                         else if currentPhoneLangID == "fr"{
                             title = "Bavarder: \(senderDisplayName!)"
                         }
                         //28) Хинди = hi
                         else if currentPhoneLangID == "hi"{
                             title = "चैट: \(senderDisplayName!)"
                         }
                         //29) Хорватский = hr
                         else if currentPhoneLangID == "hr"{
                             title = "Razgovor: \(senderDisplayName!)"
                         }
                         //30) Чешский = cs
                         else if currentPhoneLangID == "cs"{
                             title = "Povídat si: \(senderDisplayName!)"
                         }
                         //31) Шведский = sv
                         else if currentPhoneLangID == "sv"{
                             title = "Chatt: \(senderDisplayName!)"
                         }
                         //32) Японский = ja
                         else if currentPhoneLangID == "ja"{
                             title = "チャット: \(senderDisplayName!)"
                         }
            
                        //Заголовок по умолчанию или на Английском языке
                        else
                        {
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
                    var alertEULA = UIAlertController(title: "User generated contents rules", message: "By clicking “Agree” you agree with our content generated rules. By posting User Content you warrant that you own all rights in and to the User Content shared by you and that you are not breaching any other party’s rights to privacy, publicity rights, copyrights or contractual rights. User Content must not be illegal, obscene, threatening, defamatory, invasive of privacy, infringing of intellectual property rights, violate any confidentiality agreement or other contract or be otherwise injurious to third parties or objectionable and must not consist of or contain software viruses, political campaigning, commercial solicitation, chain letters, mass mailings, or any form of spam. We have the right but not the obligation to refuse to post, remove or edit any posting or submission User Content. Any User Content submitted by you will remain on “iLoveBets App“ indefinitely. You will not have the option to remove your User Content from “iLoveBets App“ at any time, except where you submit a request by email to “iLoveBets App“ (ilovebets@ya.ru) to remove your or other inappropriate User Content (copy the text from a message and send to us). You understand and agree that if you post any User Content to “iLoveBets App“ which breaches any of these Terms, we have the right to remove the content, terminate your account and you will be responsible to us for any issues arising out of breach of these Terms.", preferredStyle: .actionSheet)
        
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
        
        
        /* упрощенный вариант сообщения
By posting User Content you warrant that you own all rights in and to the User Content shared by you and that you are not breaching any other party’s rights to privacy, publicity rights, copyrights or contractual rights. User Content must not be illegal, obscene, threatening, defamatory, invasive of privacy, infringing of intellectual property rights, violate any confidentiality agreement or other contract or be otherwise injurious to third parties or objectionable and must not consist of or contain software viruses, political campaigning, commercial solicitation, chain letters, mass mailings, or any form of spam. We have the right but not the obligation to refuse to post, remove or edit any posting or submission User Content. Any User Content submitted by you will remain in the mobile application indefinitely. You will not have the option to remove your User Content at any time, except where you submit a request by email to ilovebets@ya.ru to remove your or other inappropriate User Content. You understand and agree that if you post any User Content to the Application which breaches any of these Terms, we have the right to remove the content, terminate your account and you will be responsible to us for any issues arising out of breach of these Terms.
         */
           
        
        //v.3.1 EULA для русского языка
                if currentPhoneLangID == "ru" {
                    alertEULA = UIAlertController(title: "Пользовательское соглашение", message: "Нажав “Согласен”, вы соглашаетесь с нашими правилами, созданными для контента. Размещая Пользовательский контент, вы гарантируете, что вы владеете всеми правами на Пользовательский контент, которым вы делитесь, и что вы не нарушаете права любой другой стороны на неприкосновенность частной жизни, права на публичность, авторские права или договорные права. Пользовательский контент не должен быть незаконным, непристойным, угрожающим, дискредитирующим, нарушающим конфиденциальность, нарушающим права интеллектуальной собственности, нарушающим любое соглашение о конфиденциальности или иной договор, или причиняющим иные вредные последствия для третьих сторон и не должен состоять из политических кампаний, коммерческих предложений, рассылки писем, массовых рассылок или любой формы спама. Мы имеем право, но не обязаны отказать в размещении, удалении или редактировании любого Пользовательского контента. Любой предоставленный вами Пользовательский контент останется в “iLoveBets App“ на неопределенный срок. У вас не будет возможности удалить ваш Пользовательский контент из приложения “iLoveBets App“ в любое время, кроме случаев отправления запроса по электронной почте в приложении “iLoveBets App“ (ilovebets@ya.ru), чтобы удалить ваш или другой неподходящий Пользовательский контент (необходимо скопировать текст из сообщения и отправить нам). Вы понимаете и соглашаетесь с тем, что если вы публикуете какой-либо Пользовательский контент в “iLoveBets App“, который нарушает какое-либо из этих Условий, мы имеем право удалить его по собственному усмотрению и закрыть ваш аккаунт. Вы будете нести ответственность перед нами за любые возникающие проблемы из-за нарушения настоящих Условий.", preferredStyle: .actionSheet)
           
                    yesAgreeEULA = UIAlertAction(title: "Согласен", style: .default, handler: { action in
                        //при нажатии кнопка "yes", показать окно ввода имени
                        self.showDisplayNameDialog()
                    })
           
                    noAgreeEULA = UIAlertAction(title: "Отмена", style: .destructive, handler: { action in
                        //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                        self.inputToolbar.contentView.rightBarButtonItem = nil
                        self.title = " "
                    })
                } // конец локализации EULA для русского языка
        
    
                     //v.3.2
                     //2) арабский
                     else if currentPhoneLangID == "ar"{
                        alertEULA = UIAlertController(title: "قواعد المحتويات التي ينشئها المستخدم", message: "بالنقر فوق “يوافق على“ ، فإنك توافق على قواعد إنشاءمن خلال نشر محتوى المستخدم ، فإنك تضمن أنك تمتلك جميع الحقوق في محتوى المستخدم الذي تشاركه وأنك لا تنتهك حقوق أي طرف آخر في الخصوصية أو حقوق الدعاية أو حقوق النشر أو الحقوق التعاقدية. يجب ألا يكون محتوى المستخدم غير قانوني ، أو فاحش ، أو تهديد ، أو تشهيري ، أو اعتداء على الخصوصية ، أو انتهاك حقوق الملكية الفكرية ، أو انتهاك أي اتفاقية سرية أو عقد آخر ، أو أن يكون ضارًا بطرف آخر أو مرفوضًا ويجب ألا يتكون من أو يحتوي على فيروسات برمجية أو سياسية الحملة أو الالتماس التجاري أو الرسائل المتسلسلة أو الرسائل الجماعية أو أي شكل من أشكال البريد العشوائي. لدينا الحق ولكن ليس من واجبنا رفض نشر أو إزالة أو تحرير أي محتوى مستخدم أو إرسال. سيبقى أي محتوى مستخدم قدمته في تطبيق الهاتف المحمول إلى أجل غير مسمى. لن يكون لديك خيار إزالة محتوى المستخدم الخاص بك في أي وقت ، باستثناء المكان الذي ترسل فيه طلبًا عبر البريد الإلكتروني إلى ilovebets@ya.ru لإزالة محتوى المستخدم الخاص بك أو غير ذلك من المحتويات غير اللائقة. أنت تدرك وتوافق على أنه إذا قمت بنشر أي محتوى مستخدم في التطبيق يخالف أيًا من هذه الشروط ، فيحق لنا إزالة المحتوى وإنهاء حسابك وستكون مسؤولاً أمامنا عن أي مشاكل تنشأ عن خرق هذه الشروط ."
                            
                            , preferredStyle: .actionSheet)
                          
                            yesAgreeEULA = UIAlertAction(title: "يوافق على", style: .default, handler: { action in
                                       //при нажатии кнопка "yes", показать окно ввода имени
                                       self.showDisplayNameDialog()
                            })
                          
                            noAgreeEULA = UIAlertAction(title: "إلغاء", style: .destructive, handler: { action in
                                       //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                       self.inputToolbar.contentView.rightBarButtonItem = nil
                                       self.title = " "
                            })
                         
                     }
                     //3) Венгерский = hu
                     else if currentPhoneLangID == "hu"{
                          alertEULA = UIAlertController(title: "A felhasználó által létrehozott tartalomszabályok", message: "A Felhasználói Tartalom elküldésével szavatolja, hogy az Ön által megosztott Felhasználói Tartalomhoz és az ahhoz fűződő összes joghoz tartozik, és hogy nem sérti meg a másik fél magánélethez, nyilvánosságra hozatalhoz, szerzői jogokhoz vagy szerződéses jogokhoz fűződő jogait. A felhasználói tartalom nem lehet illegális, obszcén, fenyegető, rágalmazó, magánéletbe sértő, a szellemi tulajdonhoz fűződő jogokat sértő, megsértheti a titoktartási megállapodásokat vagy más szerződéseket, és egyéb módon harmadik személyeket nem károsíthat, illetve nem lehet kifogásolható, és nem tartalmazhat szoftvervírusokat, nem tartalmazhat politikai vírusokat, kampányok, kereskedelmi felhívások, lánclevelek, tömeges levelek vagy bármilyen spam formájában. Jogunk van, de nem kötelességünk megtagadni minden hozzászólási vagy benyújtási felhasználói tartalom feladását, eltávolítását vagy szerkesztését. Az Ön által benyújtott felhasználói tartalom határozatlan ideig marad a mobil alkalmazásban. A Felhasználó Tartalma bármikor eltávolítható, kivéve akkor, ha e-mailben kérelmet nyújt be az ilovebets@ya.ru e-mail címre az Ön vagy más nem megfelelő Felhasználói Tartalom eltávolításához. Ön tudomásul veszi és elfogadja, hogy ha olyan felhasználói tartalmat tesz közzé az alkalmazásba, amely megsérti a jelen feltételeket, akkor jogaink van a tartalmat eltávolítani, megszüntetni az Ön fiókját, és Ön felelős velünk minden olyan kérdésért, amely e szabályok megszegéséből származik.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Egyetért", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Megszünteti", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //4) Вьетнамский = vi
                     else if currentPhoneLangID == "vi"{
                          alertEULA = UIAlertController(title: "Quy tắc nội dung do người dùng tạo", message: "Bằng cách đăng Nội dung người dùng, bạn đảm bảo rằng bạn sở hữu tất cả các quyền đối với Nội dung người dùng được chia sẻ bởi bạn và bạn không vi phạm bất kỳ quyền nào của bên khác về quyền riêng tư, quyền công khai, bản quyền hoặc quyền hợp đồng. Nội dung người dùng không được bất hợp pháp, tục tĩu, đe dọa, nói xấu, xâm phạm quyền riêng tư, xâm phạm quyền sở hữu trí tuệ, vi phạm bất kỳ thỏa thuận bảo mật hoặc hợp đồng nào khác hoặc gây tổn hại cho bên thứ ba hoặc bị phản đối và không được bao gồm hoặc chứa virus phần mềm, chính trị vận động, chào mời thương mại, thư dây chuyền, gửi thư hàng loạt hoặc bất kỳ hình thức thư rác nào. Chúng tôi có quyền nhưng không có nghĩa vụ từ chối đăng, xóa hoặc chỉnh sửa bất kỳ bài đăng hoặc gửi Nội dung người dùng. Bất kỳ Nội dung người dùng nào do bạn gửi sẽ vẫn còn trong ứng dụng di động vô thời hạn. Bạn sẽ không có tùy chọn xóa Nội dung người dùng của mình bất cứ lúc nào, ngoại trừ nơi bạn gửi yêu cầu qua email đến ilovebets@ya.ru để xóa Nội dung người dùng không phù hợp hoặc khác của bạn. Bạn hiểu và đồng ý rằng nếu bạn đăng bất kỳ Nội dung người dùng nào lên Ứng dụng vi phạm bất kỳ Điều khoản nào trong số này, chúng tôi có quyền xóa nội dung, chấm dứt tài khoản của bạn và bạn sẽ chịu trách nhiệm với chúng tôi về mọi vấn đề phát sinh do vi phạm các Điều khoản này.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Đồng ý", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Hủy bỏ", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                         
                     }
                     //5) Греческий = el
                     else if currentPhoneLangID == "el"{
                          alertEULA = UIAlertController(title: "Κανόνες περιεχομένου που δημιουργούνται από τον χρήστη", message: "Με την ανάρτηση περιεχομένου χρήστη, εγγυάστε ότι είστε κάτοχος όλων των δικαιωμάτων εντός και του Περιεχομένου χρήστη που μοιράζεστε από εσάς και ότι δεν παραβιάζετε τα δικαιώματα τρίτων σε σχέση με το απόρρητο, τα δικαιώματα δημοσιότητας, τα πνευματικά δικαιώματα ή τα συμβατικά δικαιώματα. Το Περιεχόμενο Χρήστη δεν πρέπει να είναι παράνομο, άσεμνο, απειλητικό, δυσφημιστικό, διεισδυτικό στην ιδιωτική ζωή, παραβίαση δικαιωμάτων πνευματικής ιδιοκτησίας, παραβίαση οποιασδήποτε συμφωνίας εμπιστευτικότητας ή άλλου συμβολαίου ή άλλως ζημιογόνο για τρίτα μέρη ή απαράδεκτο και δεν πρέπει να αποτελείται ή να περιέχει ιούς λογισμικού, πολιτικούς εκστρατεία, εμπορική πρόσκληση, αλυσίδες επιστολών, μαζικές αποστολές ή οποιαδήποτε μορφή ανεπιθύμητου περιεχομένου. Έχουμε το δικαίωμα αλλά όχι την υποχρέωση να αρνηθούμε να δημοσιεύσουμε, να αφαιρέσουμε ή να επεξεργαστούμε οποιαδήποτε ανάρτηση ή υποβολή Περιεχομένου χρήστη. Οποιοδήποτε περιεχόμενο χρήστη υποβάλλεται από εσάς θα παραμείνει στην εφαρμογή για κινητά επ 'αόριστον. Δεν θα έχετε την επιλογή να καταργήσετε το Περιεχόμενο Χρήστη σας ανά πάσα στιγμή, εκτός εάν υποβάλετε αίτημα μέσω email στη διεύθυνση ilovebets@ya.ru για κατάργηση του ή άλλου ακατάλληλου Περιεχομένου Χρήστη. Καταλαβαίνετε και συμφωνείτε ότι αν δημοσιεύσετε οποιοδήποτε Περιεχόμενο χρήστη στην Εφαρμογή που παραβιάζει οποιονδήποτε από αυτούς τους Όρους, έχουμε το δικαίωμα να καταργήσουμε το περιεχόμενο, να τερματίσουμε τον λογαριασμό σας και θα είστε υπεύθυνοι απέναντί ​​μας για τυχόν ζητήματα που προκύπτουν από παραβίαση αυτών των Όρων.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Συμφωνώ", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Ματαίωση", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //6) Датский = da
                     else if currentPhoneLangID == "da"{
                          alertEULA = UIAlertController(title: "Brugergenereret indholdsregler", message: "Ved at offentliggøre brugerindhold garanterer du, at du ejer alle rettigheder til og til det brugerindhold, der deles af dig, og at du ikke krænker nogen anden parts rettigheder til privatliv, reklamationsrettigheder, ophavsret eller kontraktmæssige rettigheder. Brugerindhold må ikke være ulovligt, uanstændigt, truende, ærekrænkende, invasivt for privatlivets fred, krænkelse af intellektuel ejendomsret, overtræde enhver fortrolighedsaftale eller anden kontrakt eller på anden måde være skadelig for tredjepart eller tilstrækkelig og må ikke bestå af eller indeholde softwarevirus, politiske kampagne, kommerciel anmodning, kæde breve, masseforsendelser eller enhver form for spam. Vi har ret, men ikke pligten til at nægte at sende, fjerne eller redigere ethvert indlæg eller indsendelse af brugerindhold. Ethvert brugerindhold sendt af dig forbliver i mobilapplikationen på ubestemt tid. Du har ikke muligheden for at fjerne dit brugerindhold på ethvert tidspunkt, undtagen hvor du sender en anmodning via e-mail til ilovebets@ya.ru om at fjerne dit eller andet upassende brugerindhold. Du forstår og accepterer, at hvis du sender et brugerindhold til applikationen, der overtræder nogen af ​​disse betingelser, har vi ret til at fjerne indholdet, afslutte din konto, og du vil være ansvarlig over for os for eventuelle problemer, der opstår som følge af overtrædelse af disse betingelser.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Enig", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Afbestille", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //7) Иврит = he
                     else if currentPhoneLangID == "he"{
                          alertEULA = UIAlertController(title: "כללי תוכן שנוצרו על ידי משתמשים", message: "על ידי פרסום תוכן משתמש אתה מתחייב כי אתה הבעלים של כל הזכויות על תוכן המשתמש המשותף על ידך ושאינך מפר את הזכויות של צד אחר לפרטיות, זכויות פרסום, זכויות יוצרים או זכויות חוזיות. אסור שתוכן המשתמש יהיה בלתי חוקי, מגונה, מאיים, משמיץ, פולש לפרטיות, פוגע בזכויות קניין רוחני, להפר כל הסכם סודיות או חוזה אחר, או לפגוע בדרך כלשהי בצדדים שלישיים או מעורר התנגדות ואסור להכיל או להכיל וירוסי תוכנה, פוליטיים. קמפיינים, שידול מסחרי, מכתבי שרשרת, דיוור המוני או כל סוג של ספאם. יש לנו את הזכות אך לא את החובה לסרב לפרסם, להסיר או לערוך כל תוכן או פרסום של תוכן המשתמש. כל תוכן משתמש שנשלח על ידך יישאר ביישום הנייד ללא הגבלת זמן. לא תהיה לך אפשרות להסיר את תוכן המשתמש שלך בכל עת, אלא אם תגיש בקשה בדוא“ל לכתובת ilovebets@ya.ru להסיר את תוכן המשתמש שלך או שאינו הולם אחר. אתה מבין ומסכים כי אם תפרסם תוכן משתמש כלשהו באפליקציה המפר תנאי מתנאי זה, יש לנו את הזכות להסיר את התוכן, לסיים את חשבונך ואתה תהיה אחראי כלפינו לכל סוגיה הנובעת מהפרה של תנאים אלה.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "מסכים", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "בטל", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //8) Индонезийский = id
                     else if currentPhoneLangID == "id"{
                          alertEULA = UIAlertController(title: "Aturan konten yang dibuat pengguna", message: "Dengan memposting Konten Pengguna Anda menjamin bahwa Anda memiliki semua hak di dalam dan untuk Konten Pengguna yang dibagikan oleh Anda dan bahwa Anda tidak melanggar hak pihak lain atas privasi, hak publisitas, hak cipta, atau hak kontraktual. Konten Pengguna tidak boleh ilegal, cabul, mengancam, memfitnah, melanggar privasi, melanggar hak kekayaan intelektual, melanggar perjanjian kerahasiaan apa pun atau kontrak lainnya atau dapat merusak pihak ketiga atau tidak menyenangkan dan tidak boleh terdiri dari atau mengandung virus perangkat lunak, politik kampanye, permintaan komersial, surat berantai, surat massal, atau segala bentuk spam. Kami memiliki hak tetapi tidak berkewajiban untuk menolak memposting, menghapus, atau mengedit setiap postingan atau mengirimkan Konten Pengguna. Konten Pengguna apa pun yang Anda kirimkan akan tetap ada dalam aplikasi seluler tanpa batas. Anda tidak akan memiliki opsi untuk menghapus Konten Pengguna Anda kapan saja, kecuali jika Anda mengirimkan permintaan melalui email ke ilovebets@ya.ru untuk menghapus Konten Pengguna Anda yang tidak pantas atau lainnya. Anda memahami dan menyetujui bahwa jika Anda memposting Konten Pengguna apa pun ke Aplikasi yang melanggar salah satu Ketentuan ini, kami memiliki hak untuk menghapus konten, mengakhiri akun Anda dan Anda akan bertanggung jawab kepada kami untuk setiap masalah yang timbul karena pelanggaran terhadap Ketentuan ini.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Setuju", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Membatalkan", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //9) Испанский = es
                     else if currentPhoneLangID == "es"{
                          alertEULA = UIAlertController(title: "Reglas de contenido generado por el usuario", message: "Al publicar el Contenido del usuario, usted garantiza que posee todos los derechos sobre el Contenido del usuario compartido por usted y que no está violando los derechos de privacidad, derechos de publicidad, derechos de autor o derechos contractuales de ninguna otra parte. El Contenido del usuario no debe ser ilegal, obsceno, amenazante, difamatorio, invasivo de la privacidad, infringir los derechos de propiedad intelectual, violar ningún acuerdo de confidencialidad u otro contrato o ser perjudicial para terceros u objetable y no debe consistir o contener virus de software, políticos campañas, solicitudes comerciales, cadenas de cartas, correos masivos o cualquier forma de spam. Tenemos el derecho pero no la obligación de negarnos a publicar, eliminar o editar cualquier publicación o envío de Contenido del usuario. Cualquier Contenido de usuario enviado por usted permanecerá en la aplicación móvil indefinidamente. No tendrá la opción de eliminar su Contenido de usuario en ningún momento, excepto cuando envíe una solicitud por correo electrónico a ilovebets@ya.ru para eliminar su u otro Contenido de usuario inapropiado. Usted comprende y acepta que si publica cualquier Contenido de usuario en la Aplicación que viole cualquiera de estos Términos, tenemos el derecho de eliminar el contenido, cancelar su cuenta y usted será responsable ante nosotros por cualquier problema que surja del incumplimiento de estos Términos.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "De acuerdo", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Cancelar", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //10) Итальянский = it
                     else if currentPhoneLangID == "it"{
                          alertEULA = UIAlertController(title: "Regole dei contenuti generate dall'utente", message: "Pubblicando i Contenuti dell'utente, garantisci di essere proprietario di tutti i diritti relativi ai Contenuti dell'utente condivisi da te e che non stai violando i diritti di terzi di privacy, diritti di pubblicità, diritti d'autore o diritti contrattuali. I Contenuti dell'utente non devono essere illegali, osceni, minacciosi, diffamatori, invasivi della privacy, violare i diritti di proprietà intellettuale, violare qualsiasi accordo di riservatezza o altro contratto o essere altrimenti dannosi per terzi o discutibili e non devono essere costituiti da o contenenti virus software, politici campagne, sollecitazioni commerciali, lettere a catena, mailing di massa o qualsiasi forma di spam. Abbiamo il diritto, ma non l'obbligo, di rifiutare di pubblicare, rimuovere o modificare qualsiasi contenuto dell'utente di invio o invio. Qualsiasi contenuto utente inviato dall'utente rimarrà nell'applicazione mobile indefinitamente. Non avrai la possibilità di rimuovere i Contenuti dell'utente in qualsiasi momento, tranne nei casi in cui invii una richiesta via e-mail a ilovebets@ya.ru per rimuovere il tuo o altri Contenuti dell'utente inappropriati. Comprendi e accetti che se pubblichi qualsiasi Contenuto dell'utente sull'applicazione che viola uno di questi Termini, abbiamo il diritto di rimuovere il contenuto, chiudere il tuo account e sarai responsabile nei nostri confronti per qualsiasi problema derivante dalla violazione di questi Termini.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Essere d'accordo", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Annulla", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //11) Каталанский = ca
                     else if currentPhoneLangID == "ca"{
                          alertEULA = UIAlertController(title: "Regles de contingut generat per l’usuari", message: "En publicar Contingut de l’Usuari garanteix que posseeix tots els drets sobre el contingut de l’usuari que els comparteix i que no incompleix els drets d’altres parts sobre privadesa, drets de publicitat, drets d’autor o drets contractuals. El contingut de l’usuari no ha de ser il·legal, obscè, amenaçador, difamador, invasiu de la privadesa, infracció de drets de propietat intel·lectual, violar qualsevol acord de confidencialitat o un altre contracte o perjudicar-se d’altra banda a tercers o no pot ser objectiu i no hagi de consistir ni contenir virus de programari, polític. fer campanyes, sol·licitud comercial, cartes en cadena, enviaments massius o qualsevol forma de correu brossa. Tenim el dret, però no l’obligació de rebutjar publicar, suprimir o editar qualsevol publicació o enviació de contingut d’Usuari. Qualsevol contingut de l’usuari enviat per vostès romandrà a l’aplicació mòbil indefinidament. No tindreu l’opció d’eliminar el vostre Contingut d’Usuari en cap moment, excepte en el cas que envieu una sol·licitud per correu electrònic a ilovebets@ya.ru per eliminar el vostre contingut d’Usuari o un usuari inapropiat. Enteneu i accepteu que si publiqueu qualsevol contingut d’usuari a l’aplicació que incompleixi qualsevol d’aquests termes, tenim el dret de suprimir el contingut, acabar el vostre compte i ens farem responsables de qualsevol problema derivat de l’incompliment d’aquests termes.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Acordar", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Cancel · lar", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //12) Китайский = zh
                     else if currentPhoneLangID == "zh"{
                          alertEULA = UIAlertController(title: "用戶生成的內容規則", message: "通過發布用戶內容，您保證擁有對您共享的用戶內容的所有權利，並且您沒有侵犯任何其他方的隱私權，公開權，版權或合同權。用戶內容不得為非法，淫穢，威脅，誹謗，侵犯隱私，侵犯知識產權，違反任何保密協議或其他合同，或對第三方有害或令人反感，並且不得包含或包含軟件病毒，政治廣告活動，招攬商業活動，連鎖信件，大量郵件或任何形式的垃圾郵件。我們有權但無義務拒絕發布，刪除或編輯任何發布或提交的用戶內容。您提交的任何用戶內容將無限期保留在移動應用程序中。除通過電子郵件向ilovebets@ya.ru提交請求以刪除您或其他不適當的用戶內容的請求外，您無法隨時選擇刪除用戶內容。您理解並同意，如果您在應用程序中發布任何違反這些條款的用戶內容，我們有權刪除該內容，終止您的帳戶，對於因違反這些條款而引起的任何問題，您將對我們負責。", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "同意", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "取消", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                       
                     }
                     //13) Корейский = ko
                     else if currentPhoneLangID == "ko"{
                          alertEULA = UIAlertController(title: "사용자 생성 컨텐츠 규칙", message: "사용자 콘텐츠를 게시함으로써 귀하는 귀하가 공유하는 사용자 콘텐츠에 대한 모든 권리를 보유하고 있으며 귀하는 개인 정보, 홍보 권리, 저작권 또는 계약상의 권리에 대한 다른 당사자의 권리를 침해하지 않는다는 것을 보증합니다. 사용자 콘텐츠는 불법적이거나 외설적이거나 위협적이거나 명예를 훼손하거나 개인 정보를 침해하거나 지적 재산권을 침해하거나 기밀 계약 또는 기타 계약을 위반하거나 제 3 자에게 해를 끼치거나 반대 할 수 없으며 소프트웨어 바이러스로 구성되거나 포함되어서는 안됩니다. 캠페인, 상업 광고, 연쇄 편지, 대량 메일 발송 또는 모든 형태의 스팸. 우리는 게시 또는 제출 사용자 콘텐츠의 게시, 제거 또는 편집을 거부 할 권리는 있지만 의무는 없습니다. 귀하가 제출 한 모든 사용자 컨텐츠는 모바일 애플리케이션에 무기한으로 남아 있습니다. 귀하는 ilovebets@ya.ru에 전자 메일로 요청을 제출하여 귀하 또는 기타 부적절한 사용자 콘텐츠를 제거하는 경우를 제외하고는 언제든지 사용자 콘텐츠를 제거 할 수있는 옵션이 없습니다. 귀하는 본 약관을 위반하는 사용자 콘텐츠를 애플리케이션에 게시하는 경우 콘텐츠를 제거하고 계정을 종료 할 권리가 있으며 본 약관을 위반하여 발생하는 모든 문제에 대해 당사가 책임을진다는 것을 이해하고 동의합니다 .", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "동의하다", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "취소", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //14) Малайский = ms
                     else if currentPhoneLangID == "ms"{
                          alertEULA = UIAlertController(title: "Peraturan kandungan yang dihasilkan pengguna", message: "Dengan menyiarkan Kandungan Pengguna, anda menjamin bahawa anda memiliki semua hak ke dalam dan ke atas Kandungan Pengguna yang anda kongsi dan bahawa anda tidak melanggar hak pihak lain terhadap privasi, hak publisiti, hak cipta atau hak kontrak. Kandungan Pengguna tidak boleh menyalahi undang-undang, cabul, mengancam, memfitnah, menyerang privasi, melanggar hak harta intelek, melanggar perjanjian kerahsiaan atau kontrak lain atau memudaratkan pihak ketiga atau tidak dibenarkan dan tidak boleh terdiri daripada atau mengandungi virus perisian, politik berkempen, permintaan komersial, surat berantai, surat massal, atau segala bentuk spam. Kami berhak tetapi tidak berkewajiban untuk menolak menyiarkan, menghapus atau menyunting sebarang pengeposan atau penyerahan Kandungan Pengguna. Sebarang Kandungan Pengguna yang dihantar oleh anda akan kekal dalam aplikasi mudah alih selama-lamanya. Anda tidak akan mempunyai pilihan untuk membuang Kandungan Pengguna anda pada bila-bila masa, kecuali jika anda mengemukakan permintaan melalui e-mel ke ilovebets@ya.ru untuk membuang Kandungan Pengguna anda yang lain atau tidak sesuai. Anda memahami dan bersetuju bahawa jika anda mengeposkan Kandungan Pengguna ke Aplikasi yang melanggar mana-mana Syarat ini, kami berhak untuk membuang kandungan tersebut, menghentikan akaun anda dan anda akan bertanggungjawab kepada kami atas segala masalah yang timbul akibat pelanggaran Syarat ini.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Setuju", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Batal", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //15) Немецкий = de
                     else if currentPhoneLangID == "de"{
                          alertEULA = UIAlertController(title: "Benutzergenerierte Inhaltsregeln", message: "Durch das Posten von Benutzerinhalten garantieren Sie, dass Sie alle Rechte an und für die von Ihnen geteilten Benutzerinhalte besitzen und dass Sie nicht die Rechte anderer Parteien auf Datenschutz, Publizitätsrechte, Urheberrechte oder vertragliche Rechte verletzen. Benutzerinhalte dürfen nicht illegal, obszön, bedrohlich, diffamierend, die Privatsphäre verletzend, die Rechte des geistigen Eigentums verletzend, gegen Vertraulichkeitsvereinbarungen oder andere Verträge verstoßend oder auf andere Weise für Dritte schädlich oder anstößig sein und dürfen nicht aus politischen Softwareviren bestehen oder diese enthalten Kampagnen, kommerzielle Werbung, Kettenbriefe, Massenmailings oder jede Form von Spam. Wir sind berechtigt, aber nicht verpflichtet, das Posten, Entfernen oder Bearbeiten von Benutzerinhalten zu veröffentlichen, zu entfernen oder zu bearbeiten. Von Ihnen eingereichte Benutzerinhalte bleiben auf unbestimmte Zeit in der mobilen Anwendung. Sie haben zu keinem Zeitpunkt die Möglichkeit, Ihre Benutzerinhalte zu entfernen, es sei denn, Sie senden eine Anfrage per E-Mail an ilovebets@ya.ru, um Ihre oder andere unangemessene Benutzerinhalte zu entfernen. Sie verstehen und stimmen zu, dass wir das Recht haben, den Inhalt zu entfernen, Ihr Konto zu kündigen, wenn Sie Benutzerinhalte in der Anwendung veröffentlichen, die gegen eine dieser Bedingungen verstoßen, und dass Sie uns gegenüber für alle Probleme verantwortlich sind, die sich aus einem Verstoß gegen diese Bedingungen ergeben.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Zustimmen", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Stornieren", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //16) Нидерландский = nl
                     else if currentPhoneLangID == "nl"{
                          alertEULA = UIAlertController(title: "Door gebruiker gegenereerde inhoudsregels", message: "Door gebruikersinhoud te plaatsen, garandeert u dat u alle rechten bezit in en op de door u gedeelde gebruikersinhoud en dat u de rechten van andere partijen op privacy, publiciteitsrechten, auteursrechten of contractuele rechten niet schendt. Gebruikersinhoud mag niet illegaal, obsceen, bedreigend, lasterlijk, inbreukmakend op de privacy, inbreuk op intellectuele eigendomsrechten, schending van enige vertrouwelijkheidsovereenkomst of ander contract of anderszins schadelijk voor derden of aanstootgevend zijn en mag niet bestaan ​​uit of softwarevirussen bevatten, politieke campagne voeren, commerciële verzoeken, kettingbrieven, massamailings of elke vorm van spam. We hebben het recht, maar niet de plicht, te weigeren om berichten of gebruikersinhoud te plaatsen, verwijderen of bewerken. Alle gebruikersinhoud die door u wordt ingediend, blijft voor onbepaalde tijd in de mobiele applicatie. U heeft op geen enkel moment de mogelijkheid om uw Gebruikersinhoud te verwijderen, behalve wanneer u een verzoek per e-mail indient bij ilovebets@ya.ru om uw of andere ongepaste Gebruikersinhoud te verwijderen. U begrijpt en gaat ermee akkoord dat als u Gebruikersinhoud plaatst in de Applicatie die een van deze Voorwaarden schendt, we het recht hebben om de inhoud te verwijderen, uw account te beëindigen en dat u verantwoordelijk bent voor alle problemen die voortkomen uit schending van deze Voorwaarden.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Mee eens", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Annuleren", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //17) Норвежский = nb
                     else if currentPhoneLangID == "nb"{
                          alertEULA = UIAlertController(title: "Brukergenererte innholdsregler", message: "Ved å legge ut Brukerinnhold garanterer du at du eier alle rettigheter i og til Brukerinnholdet som er delt av deg, og at du ikke krenker noen parts rettigheter til personvern, publisitetsrettigheter, opphavsrett eller kontraktsrettigheter. Brukerinnhold må ikke være ulovlig, uanstendig, truende, ærekrenkende, inngripende for personvern, krenke immaterielle rettigheter, krenke noen konfidensialitetsavtale eller annen kontrakt eller være på annen måte skadelig for tredjepart eller innbydelig og må ikke bestå av eller inneholde programvarevirus, politiske kampanjer, kommersiell oppfordring, kjedebrev, masseutsendelser eller noen form for spam. Vi har rett, men ikke plikten til å nekte å legge ut, fjerne eller redigere et innlegg eller innsending av brukerinnhold. Alt brukerinnhold sendt inn av deg vil forbli i mobilapplikasjonen på ubestemt tid. Du har ikke muligheten til å fjerne brukerinnholdet ditt på noe tidspunkt, bortsett fra der du sender en forespørsel per e-post til ilovebets@ya.ru om å fjerne ditt eller annet upassende brukerinnhold. Du forstår og samtykker i at hvis du legger ut noe brukerinnhold i applikasjonen som bryter noen av disse vilkårene, har vi rett til å fjerne innholdet, avslutte kontoen din, og du vil være ansvarlig overfor oss for eventuelle problemer som oppstår som følge av brudd på disse vilkårene.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Bli enige", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Avbryt", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //18) Польский = pl
                     else if currentPhoneLangID == "pl"{
                          alertEULA = UIAlertController(title: "Reguły treści generowane przez użytkownika", message: "Publikując Treści użytkownika, gwarantujesz, że posiadasz wszystkie prawa do Treści użytkownika, które udostępniasz i że nie naruszasz żadnych praw stron trzecich do prywatności, praw do reklamy, praw autorskich ani praw umownych. Treści użytkownika nie mogą być nielegalne, obsceniczne, grożące, zniesławiające, naruszające prywatność, naruszające prawa własności intelektualnej, naruszające jakąkolwiek umowę o poufności lub inną umowę ani w jakikolwiek inny sposób wyrządzające szkodę stronom trzecim lub budzące zastrzeżenia i nie mogą składać się z wirusów programowych ani zawierać takich wirusów, politycznych kampanie, pozyskiwanie informacji handlowych, łańcuszki, masowe wysyłki lub wszelkie formy spamu. Mamy prawo, ale nie obowiązek odmowy opublikowania, usunięcia lub edycji jakiegokolwiek zamieszczania lub przesyłania Treści użytkownika. Wszelkie treści użytkownika przesłane przez Ciebie pozostaną w aplikacji mobilnej na czas nieokreślony. Nie będziesz mieć możliwości usunięcia Treści użytkownika w żadnym momencie, z wyjątkiem przypadków, gdy prześlesz prośbę e-mailem na adres ilovebets@ya.ru o usunięcie swojej lub innej nieodpowiedniej Treści użytkownika. Rozumiesz i zgadzasz się, że jeśli opublikujesz Treść użytkownika w Aplikacji, która narusza którykolwiek z niniejszych Warunków, mamy prawo do usunięcia treści, zamknięcia twojego konta i będziesz odpowiedzialny za nas za wszelkie problemy wynikające z naruszenia niniejszych Warunków.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Zgodzić się", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Anuluj", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //19) Португальский = pt
                     else if currentPhoneLangID == "pt"{
                          alertEULA = UIAlertController(title: "Regras de conteúdo gerado pelo usuário", message: "Ao publicar o Conteúdo do Usuário, você garante que possui todos os direitos sobre o Conteúdo do Usuário compartilhados por você e que não está violando os direitos de nenhuma outra parte sobre privacidade, direitos de publicidade, direitos autorais ou direitos contratuais. O Conteúdo do Usuário não deve ser ilegal, obsceno, ameaçador, difamatório, invasivo da privacidade, violar direitos de propriedade intelectual, violar qualquer acordo de confidencialidade ou outro contrato ou ser prejudicial a terceiros ou censurável e não deve consistir em ou conter vírus de software, políticos campanha, solicitação comercial, correntes, correspondência em massa ou qualquer forma de spam. Temos o direito, mas não a obrigação, de recusar a publicação, remoção ou edição de qualquer publicação ou envio de Conteúdo do Usuário. Qualquer Conteúdo do usuário enviado por você permanecerá no aplicativo móvel indefinidamente. Você não terá a opção de remover o conteúdo do usuário a qualquer momento, exceto quando enviar uma solicitação por e-mail para ilovebets@ya.ru para remover seu ou outro conteúdo inapropriado do usuário. Você entende e concorda que, se publicar algum Conteúdo do Usuário no Aplicativo que viole algum destes Termos, temos o direito de remover o conteúdo, encerrar sua conta e você será responsável por quaisquer problemas decorrentes da violação desses Termos.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Aceita", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Cancelar", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //20) Румынский = ro
                     else if currentPhoneLangID == "ro"{
                          alertEULA = UIAlertController(title: "Reguli de conținut generate de utilizator", message: "Prin publicarea Conținutului utilizatorului garantezi că deții toate drepturile asupra și asupra conținutului utilizatorului împărtășit de către tine și că nu încalci drepturile oricărei alte părți la confidențialitate, drepturi de publicitate, drepturi de autor sau drepturi contractuale. Conținutul utilizatorului nu trebuie să fie ilegal, obscen, amenințător, defăimător, invaziv de confidențialitate, încălcarea drepturilor de proprietate intelectuală, să încalce orice acord de confidențialitate sau alt contract sau să fie vătămător pentru terți sau obiectabil și nu trebuie să constea sau să conțină viruși software, politici campanie, solicitare comercială, scrisori în lanț, corespondență în masă sau orice formă de spam. Avem dreptul, dar nu obligația de a refuza să postăm, să eliminăm sau să edităm orice postare sau transmitere a Conținutului utilizatorului. Orice conținut de utilizator trimis de dvs. va rămâne în aplicația mobilă la nesfârșit. Nu veți avea opțiunea de a elimina Conținutul utilizatorului în niciun moment, cu excepția cazului în care trimiteți o solicitare prin e-mail la ilovebets@ya.ru pentru a elimina sau alt conținut de utilizator necorespunzător. Înțelegeți și sunteți de acord că dacă postați conținutul utilizatorului în aplicație care încalcă oricare dintre acești termeni, avem dreptul de a elimina conținutul, de a încheia contul dvs. și veți fi responsabili pentru noi pentru orice probleme care apar din încălcarea acestor condiții.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "De acord", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Anulare", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //21) Русский = ru
                     
                     //22) Словацкий = sk
                     else if currentPhoneLangID == "sk"{
                          alertEULA = UIAlertController(title: "Pravidlá obsahu generované používateľom", message: "Zverejnením obsahu používateľa zaručujete, že vlastníte všetky práva na užívateľský obsah zdieľaný vami a že neporušujete práva žiadnej inej strany na súkromie, práva na publicitu, autorské práva ani zmluvné práva. Obsah používateľa nesmie byť nezákonný, obscénny, výhražný, hanlivý, invázny do súkromia, porušujúci práva duševného vlastníctva, porušovať akékoľvek dohody o mlčanlivosti alebo inú zmluvu ani inak poškodzovať tretie strany alebo nevhodný a nesmie pozostávať zo softvérových vírusov ani obsahujúcich kampane, obchodné ponuky, reťazové listy, hromadné korešpondencie alebo akékoľvek formy spamu. Máme právo, ale nie povinnosť, odmietnuť zverejnenie, odstránenie alebo úpravu akéhokoľvek zverejnenia alebo odoslania obsahu používateľa. Akýkoľvek užívateľský obsah, ktorý ste zadali, zostane v mobilnej aplikácii na dobu neurčitú. Nebudete mať možnosť kedykoľvek odstrániť svoj užívateľský obsah, okrem prípadu, keď odošlete e-mailom na adresu ilovebets@ya.ru e-mailovú žiadosť o odstránenie svojho alebo iného nevhodného obsahu používateľa. Beriete na vedomie a súhlasíte s tým, že ak do aplikácie zverejníte akýkoľvek užívateľský obsah, ktorý porušuje ktorýkoľvek z týchto podmienok, máme právo tento obsah odstrániť, ukončiť váš účet a budete zodpovedať za akékoľvek problémy, ktoré vzniknú v dôsledku porušenia týchto podmienok.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Súhlasiť", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Zrušiť", style: .destructive, handler: { action in
                                
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //23) Тайский = th
                     else if currentPhoneLangID == "th"{
                          alertEULA = UIAlertController(title: "ผู้ใช้สร้างกฎเนื้อหา", message: "โดยการโพสต์เนื้อหาของผู้ใช้คุณรับประกันว่าคุณเป็นเจ้าของสิทธิ์ทั้งหมดและในเนื้อหาของผู้ใช้ที่คุณแบ่งปันและคุณไม่ได้ละเมิดสิทธิ์ของบุคคลอื่น ๆ ในเรื่องความเป็นส่วนตัวสิทธิ์ในการประชาสัมพันธ์ลิขสิทธิ์หรือสิทธิ์ตามสัญญา เนื้อหาของผู้ใช้จะต้องไม่ผิดกฎหมายหยาบคายข่มขู่หมิ่นประมาทล่วงละเมิดความเป็นส่วนตัวละเมิดสิทธิ์ในทรัพย์สินทางปัญญาละเมิดข้อตกลงการรักษาความลับหรือสัญญาอื่น ๆ หรือเป็นอันตรายต่อบุคคลที่สามหรือไม่เหมาะสมและต้องไม่ประกอบด้วยหรือมีไวรัสซอฟต์แวร์การเมือง การรณรงค์การชักชวนเชิงพาณิชย์จดหมายลูกโซ่การส่งจดหมายจำนวนมากหรือจดหมายขยะในรูปแบบใด ๆ เรามีสิทธิ์ แต่ไม่ใช่ข้อผูกพันในการปฏิเสธที่จะโพสต์ลบหรือแก้ไขการโพสต์หรือส่งเนื้อหาของผู้ใช้ เนื้อหาของผู้ใช้ที่ส่งโดยคุณจะยังคงอยู่ในแอปพลิเคชันมือถืออย่างไม่มีกำหนด คุณจะไม่มีตัวเลือกในการลบเนื้อหาผู้ใช้ของคุณได้ตลอดเวลายกเว้นที่คุณส่งคำขอทางอีเมลไปที่ ilovebets@ya.ru เพื่อลบเนื้อหาผู้ใช้ของคุณหรือที่ไม่เหมาะสมอื่น ๆ คุณเข้าใจและยอมรับว่าหากคุณโพสต์เนื้อหาของผู้ใช้ไปยังแอปพลิเคชันที่ละเมิดข้อกำหนดเหล่านี้เรามีสิทธิ์ที่จะลบเนื้อหายกเลิกบัญชีของคุณและคุณจะต้องรับผิดชอบต่อเราสำหรับปัญหาใด ๆ ที่เกิดขึ้นจากการฝ่าฝืนข้อกำหนดเหล่านี้.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "ตกลง", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "ยกเลิก", style: .destructive, handler: { action in
                                         print("hello")
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //24) Турецкий = tr
                     else if currentPhoneLangID == "tr"{
                          alertEULA = UIAlertController(title: "Kullanıcı tarafından oluşturulan içerik kuralları", message: "Kullanıcı İçeriği yayınlayarak, sizin tarafınızdan paylaşılan ve Kullanıcı İçeriği ile ilgili tüm haklara sahip olduğunuzu ve başka bir tarafın gizlilik, tanıtım hakları, telif hakları veya sözleşme haklarına ilişkin haklarını ihlal etmediğinizi garanti edersiniz. Kullanıcı İçeriği yasadışı, müstehcen, tehdit edici, iftira niteliğinde, istismarı, fikri mülkiyet haklarını ihlal etmemeli, herhangi bir gizlilik sözleşmesini veya başka bir sözleşmeyi ihlal etmemeli veya üçüncü taraflara zarar vermemeli veya sakıncalı olmamalı ve yazılım virüslerinden, politikasından oluşmamalı veya içermemelidir kampanya, ticari talep, zincir mektuplar, toplu postalar veya herhangi bir spam türü. Herhangi bir gönderi veya gönderi Kullanıcı İçeriğini göndermeyi, kaldırmayı veya düzenlemeyi reddetme hakkımız vardır, ancak yükümlülüğümüz yoktur. Tarafınızdan gönderilen Kullanıcı İçeriği mobil uygulamada süresiz olarak kalacaktır. İlovebets@ya.ru adresine e-postanızı veya diğer uygunsuz Kullanıcı İçeriğinizi kaldırmak için e-postayla istek göndermeniz dışında Kullanıcı İçeriğinizi hiçbir zaman kaldırma seçeneğiniz olmayacaktır. Uygulamaya, bu Şartlardan herhangi birini ihlal eden herhangi bir Kullanıcı İçeriği gönderirseniz, içeriği kaldırma, hesabınızı feshetme hakkımız olduğunu ve bu Şartların ihlalinden kaynaklanan sorunlardan bizden sorumlu olacağınızı anlar ve kabul edersiniz.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Katılıyorum", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "İptal etmek", style: .destructive, handler: { action in
                                         print("hello")
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //25) Украинский = uk
                     else if currentPhoneLangID == "uk"{
                          alertEULA = UIAlertController(title: "Користувача угода", message: "Розміщуючи користувача контент, ви гарантуєте, що ви володієте всіма правами на користувача контент, яким ви ділитеся, і що ви не порушуєте права будь-якої іншої сторони на недоторканність приватного життя, права на публічність, авторські права або договірні права. Призначений для користувача контент не повинен бути незаконним, непристойним, загрозливим, таким, що дискредитує, що порушує конфіденційність, що порушує права інтелектуальної власності, що порушує будь-яка угода про конфіденційність або інший договір, або заподіює інші шкідливі наслідки для третіх сторін і не повинен складатися з політичних кампаній, комерційних пропозицій, розсилки листів, масових розсилок або будь-якої форми спаму. Ми маємо право, але не зобов'язані відмовити в розміщенні, видаленні або редагуванні будь-якого Користувача контенту. Будь наданий вами користувача контент залишиться в “iLoveBets App“ на невизначений термін. У вас не буде можливості видалити ваш користувача контент з програми “iLoveBets App“ в будь-який час, крім випадків відправлення запиту по електронній пошті в додатку “iLoveBets App“ (ilovebets@ya.ru), щоб видалити ваш або іншої невідповідний для користувача контент (необхідно скопіювати текст з повідомлення і відправити нам). Ви розумієте і погоджуєтеся з тим, що якщо ви публікуєте будь-якої користувача контент в “iLoveBets App“, який порушує будь-яке з цих Умов, ми маємо право видалити його на власний розсуд і закрити ваш обліковий запис. Ви будете нести відповідальність перед нами за будь-які проблеми, що виникають через порушення цих Умов.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Прийняти", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Відмовитися", style: .destructive, handler: { action in

                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //26) Финский = fi
                     else if currentPhoneLangID == "fi"{
                          alertEULA = UIAlertController(title: "Käyttäjän luoma sisältösäännöt", message: "Lähettämällä käyttäjäsisältöä vakuutat, että omistat kaikki oikeutesi käyttäjän jakamaan käyttäjän sisältöön ja siihen ja että et riko muiden osapuolten yksityisyyden, julkisuusoikeuksien, tekijänoikeuksien tai sopimusoikeuksien oikeuksia. Käyttäjäsisältö ei saa olla laitonta, säädytöntä, uhkaavaa, loukkaavaa, loukkaavaa yksityisyyttä, loukkaavaa immateriaalioikeuksia, rikkoa mitään luottamuksellisuutta koskevaa sopimusta tai muuta sopimusta tai olla muuten vahingollista kolmansille osapuolille tai haastavaa, eikä se saa koostua ohjelmistoviruksista, kampanjoita, kaupallisia tarjouksia, ketjukirjeitä, joukkopostituksia tai mitä tahansa roskapostia. Meillä on oikeus, mutta ei velvollisuutta kieltäytyä lähettämästä, poistamasta tai muokkaamasta lähettämistä tai lähettämistä koskevaa käyttäjän sisältöä. Kaikki lähettämäsi käyttäjän sisältö pysyy mobiilisovelluksessa määräämättömän ajan. Sinulla ei ole mahdollisuutta poistaa käyttäjän sisältöä milloin tahansa, paitsi jos lähetät sähköpostilla osoitteeseen ilovebets@ya.ru pyynnön sinun tai muun sopimattoman käyttäjän sisällön poistamiseksi. Ymmärrät ja suostut siihen, että jos lähetät sovellukselle käyttäjän sisältöä, joka rikkoo mitä tahansa näistä ehdoista, meillä on oikeus poistaa sisältö, lopettaa tilisi ja olet vastuussa meille kaikista asioista, jotka johtuvat näiden ehtojen rikkomisesta.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Olla samaa mieltä", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Peruuttaa", style: .destructive, handler: { action in
  
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //27) Французский = fr
                     else if currentPhoneLangID == "fr"{
                          alertEULA = UIAlertController(title: "Règles de contenu généré par l'utilisateur", message: "En publiant du contenu utilisateur, vous garantissez que vous êtes propriétaire de tous les droits relatifs au contenu utilisateur que vous partagez et que vous ne violez aucun droit de tiers à la vie privée, à la publicité, aux droits d'auteur ou aux droits contractuels. Le Contenu utilisateur ne doit pas être illégal, obscène, menaçant, diffamatoire, envahissant la vie privée, portant atteinte aux droits de propriété intellectuelle, violer tout accord de confidentialité ou autre contrat ou être autrement préjudiciable à des tiers ou répréhensible et ne doit pas être constitué ou contenir des virus logiciels, politiques campagne, sollicitation commerciale, chaînes de lettres, envois de masse ou toute autre forme de spam. Nous avons le droit mais pas l'obligation de refuser de publier, de supprimer ou de modifier tout contenu utilisateur de publication ou de soumission. Tout contenu utilisateur soumis par vous restera indéfiniment dans l'application mobile. Vous n'aurez pas la possibilité de supprimer votre Contenu Utilisateur à tout moment, sauf si vous soumettez une demande par e-mail à ilovebets@ya.ru pour supprimer votre Contenu Utilisateur ou tout autre Contenu inapproprié. Vous comprenez et acceptez que si vous publiez un Contenu utilisateur sur l'Application qui enfreint l'une de ces Conditions, nous avons le droit de supprimer le contenu, de résilier votre compte et vous serez responsable envers nous de tout problème résultant d'une violation de ces Conditions.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Se mettre d'accord", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Annuler", style: .destructive, handler: { action in

                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //28) Хинди = hi
                     else if currentPhoneLangID == "hi"{
                          alertEULA = UIAlertController(title: "उपयोगकर्ता ने सामग्री नियम बनाए", message: "उपयोगकर्ता सामग्री को पोस्ट करके आप वारंट करते हैं कि आपके द्वारा साझा किए गए उपयोगकर्ता सामग्री में और आपके पास सभी अधिकार हैं, और आप गोपनीयता, प्रचार अधिकार, कॉपीराइट या अनुबंध संबंधी अधिकारों के लिए किसी अन्य पार्टी के अधिकारों का उल्लंघन नहीं कर रहे हैं। उपयोगकर्ता सामग्री गैरकानूनी, अश्लील, धमकी देने वाली, बदनाम करने वाली, गोपनीयता की आक्रामक, बौद्धिक संपदा अधिकारों का उल्लंघन करने वाली, किसी भी गोपनीयता समझौते या अन्य अनुबंध का उल्लंघन करने वाली नहीं होनी चाहिए या अन्यथा तृतीय पक्षों या आपत्तिजनक लोगों के लिए हानिकारक हो सकती है और इसमें सॉफ्टवेयर वायरस शामिल नहीं होने चाहिए, राजनीतिक प्रचार, वाणिज्यिक याचना, श्रृंखला पत्र, जन मेल या स्पैम का कोई भी रूप। किसी भी पोस्टिंग को सबमिट करने या हटाने या उपयोगकर्ता सामग्री को पोस्ट करने, हटाने या संपादित करने से इंकार करने का हमारा अधिकार नहीं है। आपके द्वारा सबमिट की गई कोई भी उपयोगकर्ता सामग्री मोबाइल एप्लिकेशन में अनिश्चित काल तक रहेगी। आपके पास किसी भी समय अपनी उपयोगकर्ता सामग्री को निकालने का विकल्प नहीं होगा, सिवाय इसके कि आप अपनी या अन्य अनुचित उपयोगकर्ता सामग्री को हटाने के लिए ilovebets@ya.ru पर ईमेल द्वारा अनुरोध सबमिट करें। आप समझते हैं और सहमत हैं कि यदि आप किसी भी उपयोगकर्ता सामग्री को पोस्ट करते हैं जो इन शर्तों में से किसी को भी भंग करती है, तो हमें सामग्री को हटाने, अपना खाता समाप्त करने का अधिकार है और इन शर्तों के उल्लंघन से उत्पन्न होने वाले किसी भी मुद्दे के लिए आप हमारे लिए जिम्मेदार होंगे। ।", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "इस बात से सहमत", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "रद्द करना", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //29) Хорватский = hr
                     else if currentPhoneLangID == "hr"{
                          alertEULA = UIAlertController(title: "Pravila o sadržaju generirana od strane korisnika", message: "Objavljivanjem Korisničkog sadržaja jamčite da posjedujete sva prava na i na Korisničkom sadržaju koji dijelite s vama i da ne kršite prava nijedne druge na privatnost, prava oglašavanja, autorska prava ili ugovorna prava. Korisnički sadržaj ne smije biti ilegalni, opsceni, prijeteći, klevetnički, invazivni na privatnost, kršenje prava intelektualnog vlasništva, kršiti bilo kakav ugovor o povjerljivosti ili drugi ugovor ili biti na drugi način štetan za treće strane ili prigovor i ne smije se sastojati od softverskih virusa ili ih sadržavati kampanji, komercijalnom pozivu, lančanim porukama, masovnoj pošti ili bilo kojem obliku neželjene pošte. Imamo pravo, ali ne i obvezu da odbijemo objavljivanje, uklanjanje ili uređivanje bilo kojeg objavljivanja ili slanja Korisničkog sadržaja. Bilo koji Korisnički sadržaj koji pošaljete ostat će u mobilnoj aplikaciji neograničeno. Nećete imati mogućnost uklanjanja svog Korisničkog sadržaja u bilo kojem trenutku, osim ako podnesete zahtjev e-poštom na ilovebets@ya.ru za uklanjanje vašeg ili drugog neprikladnog korisničkog sadržaja. Razumijete i suglasni ste da ako objavite bilo koji Korisnički sadržaj u aplikaciji koji krši bilo koji od ovih Uvjeta, imamo pravo ukloniti sadržaj, ukinuti vaš račun i bit ćete odgovorni prema nama za bilo koja pitanja koja proizlaze iz kršenja ovih Uvjeta.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Složiti", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Otkazati", style: .destructive, handler: { action in

                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //30) Чешский = cs
                     else if currentPhoneLangID == "cs"{
                          alertEULA = UIAlertController(title: "Uživatelem generovaná pravidla obsahu", message: "Zveřejněním uživatelského obsahu zaručujete, že vlastníte všechna práva k uživatelskému obsahu, který sdílíte, a že neporušujete práva žádné jiné strany na soukromí, publicita, autorská práva nebo smluvní práva. Obsah uživatele nesmí být nezákonný, obscénní, vyhrožující, hanlivý, narušující soukromí, porušující práva duševního vlastnictví, porušovat jakoukoli dohodu o zachování důvěrnosti nebo jinou smlouvu ani jinak poškozovat třetí strany nebo nevhodný a nesmí sestávat ani obsahovat softwarové viry, politické kampaně, komerční nabízení, řetězové dopisy, hromadné korespondence nebo jakákoli forma spamu. Máme právo, ale nikoli povinnost odmítnout zveřejnit, odstranit nebo upravit jakýkoli příspěvek nebo příspěvek Uživatelský obsah. Veškerý vámi zadaný uživatelský obsah zůstane v mobilní aplikaci neomezeně dlouho. Nebudete mít možnost kdykoli odstranit svůj uživatelský obsah, kromě případů, kdy odešlete e-mailem na adresu ilovebets@ya.ru e-mailem o odstranění svého nebo jiného nevhodného uživatelského obsahu. Berete na vědomí a souhlasíte s tím, že pokud do aplikace zaúčtujete jakýkoli uživatelský obsah, který porušuje některou z těchto podmínek, máme právo odstranit obsah, ukončit váš účet a vy budete zodpovědní za jakékoli problémy vzniklé v důsledku porušení těchto podmínek.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Souhlasit", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Zrušení", style: .destructive, handler: { action in
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //31) Шведский = sv
                     else if currentPhoneLangID == "sv"{
                          alertEULA = UIAlertController(title: "Användargenererade innehållsregler", message: "Genom att publicera användarinnehåll garanterar du att du äger alla rättigheter till och till det användarinnehåll som delas av dig och att du inte bryter mot någon annan parts rättigheter till integritet, publicitetsrättigheter, upphovsrätt eller avtalsrättigheter. Användarinnehåll får inte vara olagligt, obscen, hotande, ärekränkande, inkräktande av integritet, intrång i immateriella rättigheter, kränka något konfidentiellt avtal eller annat avtal eller på annat sätt vara skadligt för tredje part eller kränkande och får inte bestå av eller innehålla programvaruvirus, politiska kampanj, kommersiell uppmaning, kedjebrev, massmeddelanden eller någon form av skräppost. Vi har rätt men inte skyldigheten att vägra att lägga ut, ta bort eller redigera användarinnehåll för inlägg eller inlägg. Allt användarinnehåll som du lämnar in kommer att förbli i mobilapplikationen på obestämd tid. Du har inte möjlighet att ta bort ditt användarinnehåll när som helst, utom när du skickar en begäran via e-post till ilovebets@ya.ru om att ta bort ditt eller annat olämpligt användarinnehåll. Du förstår och samtycker till att om du publicerar något användarinnehåll i applikationen som bryter mot något av dessa villkor, har vi rätten att ta bort innehållet, avsluta ditt konto och du kommer att vara ansvarig gentemot oss för alla problem som uppstår i strid med dessa villkor.", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "Hålla med", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "Avbryt", style: .destructive, handler: { action in
    
                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
                     //32) Японский = ja
                     else if currentPhoneLangID == "ja"{
                          alertEULA = UIAlertController(title: "ユーザー生成コンテンツルール", message: "ユーザーコンテンツを投稿することにより、あなたは、あなたが共有するユーザーコンテンツに対するすべての権利を所有し、プライバシー、パブリシティ権、著作権、または契約上の権利に対する他の当事者の権利を侵害しないことを保証します。ユーザーコンテンツは、違法、わいせつ、脅迫的、中傷的、プライバシーの侵害、知的財産権の侵害、機密保持契約またはその他の契約の違反、または第三者への害や不快なものであってはならず、ソフトウェアウイルスで構成または含まれていてはなりません。キャンペーン、商業的勧誘、チェーンレター、大量メール、またはあらゆる形態のスパム。当社には、投稿または送信のユーザーコンテンツの投稿、削除、編集を拒否する権利がありますが、義務はありません。あなたが提出したユーザーコンテンツは、無期限にモバイルアプリケーションに残ります。ユーザーまたはその他の不適切なユーザーコンテンツを削除するリクエストをメールでilovebets@ya.ruに送信する場合を除き、ユーザーコンテンツをいつでも削除するオプションはありません。これらの規約に違反するアプリケーションにユーザーコンテンツを投稿した場合、当社はそのコンテンツを削除し、アカウントを終了する権利を有し、これらの規約の違反から生じた問題について私たちに責任があることを理解し、同意するものとします。 。", preferredStyle: .actionSheet)
                            
                              yesAgreeEULA = UIAlertAction(title: "同意する", style: .default, handler: { action in
                                         //при нажатии кнопка "yes", показать окно ввода имени
                                         self.showDisplayNameDialog()
                              })
                            
                              noAgreeEULA = UIAlertAction(title: "キャンセル", style: .destructive, handler: { action in

                                         //если нажимают Cancel, то пропадает кнопка отправить и стирается заголовок чата
                                         self.inputToolbar.contentView.rightBarButtonItem = nil
                                         self.title = " "
                              })
                     }
        
        
        
        
    alertEULA.addAction(yesAgreeEULA)
    alertEULA.addAction(noAgreeEULA)
        
        
        
        
    //v.3.1. Без этих строк на ipad уведомление с типом actionSheet вызывает ошибку выполнения приложения. Решение: https://medium.com/@nickmeehan/actionsheet-popover-on-ipad-in-swift-5768dfa82094
    //добавил строчку для корректной работы оповещения на iPad
    if let popoverController = alertEULA.popoverPresentationController {
    popoverController.sourceView = self.view
        //v.3.2 - закомментировал, чтобы выводилось сообщение EULA по центру на ipad
        //  popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)

    popoverController.permittedArrowDirections = []
        }
        
    //
        
        
        
        
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
        var alert = UIAlertController(title: "Your Display Name", message: "Before you can chat, please choose a display name. Others will see this name when you send chat messages. You can change your display name again by tapping the navigation bar.", preferredStyle: .alert)
           
              
        //v.2.3
        //если русский язык телефона, отображать всплывающее сообщение о вводе имени по-русски
        if currentPhoneLangID == "ru" {
        //Сообщение, где предлагается ввести имя
        //для русской версии, v.3.1 - изменил preferredStyle: .alert на actionSheet, чтобы было 2 сообщения
               alert = UIAlertController(title: "Введите имя", message: "Прежде чем Вы сможете общаться, введите имя. Другие пользователи увидят Ваше имя при отправке сообщений чата. Вы можете изменить свое имя, нажав на панель навигации", preferredStyle: .alert)
           }
        
        //v.3.2
        //Enter your name
        //You can change your display name again by tapping the navigation bar
        //2) арабский
        else if currentPhoneLangID == "ar"{
                         alert = UIAlertController(title: "أدخل أسمك", message: "يمكنك تغيير اسم العرض الخاص بك مرة أخرى عن طريق النقر على شريط التنقل", preferredStyle: .alert)
        }
        //3) Венгерский = hu
        else if currentPhoneLangID == "hu"{
                          alert = UIAlertController(title: "Adja meg nevét", message: "Megjelenítési nevét megváltoztathatja a navigációs sáv megérintésével", preferredStyle: .alert)
        }
        //4) Вьетнамский = vi
        else if currentPhoneLangID == "vi"{
                          alert = UIAlertController(title: "Điền tên của bạn", message: "Bạn có thể thay đổi tên hiển thị của mình một lần nữa bằng cách nhấn vào thanh điều hướng", preferredStyle: .alert)
        }
        //5) Греческий = el
        else if currentPhoneLangID == "el"{
                          alert = UIAlertController(title: "Εισάγετε το όνομά σας", message: "Μπορείτε να αλλάξετε ξανά το εμφανιζόμενο όνομα πατώντας τη γραμμή πλοήγησης", preferredStyle: .alert)
        }
        //6) Датский = da
        else if currentPhoneLangID == "da"{
                         alert = UIAlertController(title: "Indtast dit navn", message: "Du kan ændre dit visningsnavn igen ved at trykke på navigationslinjen", preferredStyle: .alert)
        }
        //7) Иврит = he
        else if currentPhoneLangID == "he"{
                          alert = UIAlertController(title: "הזן את שמך", message: "אתה יכול לשנות את שם התצוגה שלך שוב על ידי הקשה על סרגל הניווט", preferredStyle: .alert)
        }
        //8) Индонезийский = id
        else if currentPhoneLangID == "id"{
                           alert = UIAlertController(title: "Masukkan nama Anda", message: "Anda dapat mengubah nama tampilan lagi dengan mengetuk bilah navigasi", preferredStyle: .alert)
        }
        //9) Испанский = es
        else if currentPhoneLangID == "es"{
                          alert = UIAlertController(title: "Introduzca su nombre", message: "Puede cambiar su nombre para mostrar nuevamente tocando la barra de navegación", preferredStyle: .alert)
        }
        //10) Итальянский = it
        else if currentPhoneLangID == "it"{
                        alert = UIAlertController(title: "Inserisci il tuo nome", message: "È possibile modificare nuovamente il nome visualizzato toccando la barra di navigazione", preferredStyle: .alert)
        }
        //11) Каталанский = ca
        else if currentPhoneLangID == "ca"{
                          alert = UIAlertController(title: "Introdueixi el seu nom", message: "Podeu canviar el nom de la pantalla de nou tocant la barra de navegació", preferredStyle: .alert)
        }
        //12) Китайский = zh
        else if currentPhoneLangID == "zh"{
                          alert = UIAlertController(title: "輸入你的名字", message: "您可以通過點擊導航欄再次更改顯示名稱", preferredStyle: .alert)
        }
        //13) Корейский = ko
        else if currentPhoneLangID == "ko"{
                          alert = UIAlertController(title: "당신의 이름을 입력", message: "탐색 표시 줄을 눌러 표시 이름을 다시 변경할 수 있습니다", preferredStyle: .alert)
        }
        //14) Малайский = ms
        else if currentPhoneLangID == "ms"{
                       alert = UIAlertController(title: "Masukkan nama anda", message: "Anda boleh menukar nama paparan anda sekali lagi dengan mengetuk bar navigasi", preferredStyle: .alert)
        }
        //15) Немецкий = de
        else if currentPhoneLangID == "de"{
                          alert = UIAlertController(title: "Gib deinen Namen ein", message: "Sie können Ihren Anzeigenamen erneut ändern, indem Sie auf die Navigationsleiste tippen", preferredStyle: .alert)
        }
        //16) Нидерландский = nl
        else if currentPhoneLangID == "nl"{
                          alert = UIAlertController(title: "Vul uw naam in", message: "U kunt uw weergavenaam opnieuw wijzigen door op de navigatiebalk te tikken", preferredStyle: .alert)
        }
        //17) Норвежский = nb
        else if currentPhoneLangID == "nb"{
                           alert = UIAlertController(title: "Skriv inn navnet ditt", message: "Du kan endre visningsnavnet igjen ved å trykke på navigasjonslinjen", preferredStyle: .alert)
        }
        //18) Польский = pl
        else if currentPhoneLangID == "pl"{
                          alert = UIAlertController(title: "Wpisz swoje imię", message: "Możesz ponownie zmienić nazwę wyświetlaną, dotykając paska nawigacji", preferredStyle: .alert)
        }
        //19) Португальский = pt
        else if currentPhoneLangID == "pt"{
                         alert = UIAlertController(title: "Digite seu nome", message: "Você pode alterar seu nome de exibição novamente tocando na barra de navegação", preferredStyle: .alert)
        }
        //20) Румынский = ro
        else if currentPhoneLangID == "ro"{
                        alert = UIAlertController(title: "Introdu numele tau", message: "Puteți schimba din nou numele afișajului atingând bara de navigare", preferredStyle: .alert)
        }
        //21) Русский = ru
        
        //22) Словацкий = sk
        else if currentPhoneLangID == "sk"{
                           alert = UIAlertController(title: "Zadajte svoje meno", message: "Svoje zobrazované meno môžete znova zmeniť klepnutím na navigačnú lištu", preferredStyle: .alert)
        }
        //23) Тайский = th
        else if currentPhoneLangID == "th"{
                          alert = UIAlertController(title: "ใส่ชื่อของคุณ", message: "คุณสามารถเปลี่ยนชื่อที่แสดงได้อีกครั้งโดยแตะที่แถบนำทาง", preferredStyle: .alert)
        }
        //24) Турецкий = tr
        else if currentPhoneLangID == "tr"{
                         alert = UIAlertController(title: "Adınızı giriniz", message: "Gezinme çubuğuna dokunarak görünen adınızı tekrar değiştirebilirsiniz", preferredStyle: .alert)
        }
        //25) Украинский = uk
        else if currentPhoneLangID == "uk"{
                       alert = UIAlertController(title: "Введіть ім'я", message: "Ви можете знову змінити відображуване ім’я, торкнувшись панелі навігації", preferredStyle: .alert)
        }
        //26) Финский = fi
        else if currentPhoneLangID == "fi"{
                       alert = UIAlertController(title: "Kirjoita nimesi", message: "Voit muuttaa näyttönimen uudelleen napauttamalla navigointipalkkia", preferredStyle: .alert)
        }
        //27) Французский = fr
        else if currentPhoneLangID == "fr"{
                          alert = UIAlertController(title: "Entrez votre nom", message: "Vous pouvez à nouveau modifier votre nom d'affichage en appuyant sur la barre de navigation", preferredStyle: .alert)
        }
        //28) Хинди = hi
        else if currentPhoneLangID == "hi"{
                          alert = UIAlertController(title: "अपना नाम दर्ज करें", message: "आप नेविगेशन बार को टैप करके अपना प्रदर्शन नाम फिर से बदल सकते हैं", preferredStyle: .alert)
        }
        //29) Хорватский = hr
        else if currentPhoneLangID == "hr"{
                        alert = UIAlertController(title: "Unesite svoje ime", message: "Svoje prikazno ime možete ponovo promijeniti dodirom na navigacijsku traku", preferredStyle: .alert)
        }
        //30) Чешский = cs
        else if currentPhoneLangID == "cs"{
                        alert = UIAlertController(title: "Zadejte své jméno", message: "Zobrazované jméno můžete znovu změnit klepnutím na navigační lištu", preferredStyle: .alert)
        }
        //31) Шведский = sv
        else if currentPhoneLangID == "sv"{
                           alert = UIAlertController(title: "Ange ditt namn", message: "Du kan ändra visningsnamnet igen genom att trycka på navigeringsfältet", preferredStyle: .alert)
        }
        //32) Японский = ja
        else if currentPhoneLangID == "ja"{
                          alert = UIAlertController(title: "あなたの名前を入力してください", message: "ナビゲーションバーをタップすると、表示名を再度変更できます", preferredStyle: .alert)
      
        }
        
        
        
        //v.3.1 - Создание оповещения при вводе имени Anonymous или anonymous - по умолчанию
            var noAnonymousAlert = UIAlertController(title: "You can't use this name", message: nil, preferredStyle: .alert)
            var yesAction = UIAlertAction(title: "Try again", style: .cancel, handler: {action in
                 //v.3.1 - повторно вывести сообщение с вводом имени
            self.present(alert, animated: true, completion: nil)
        })
        
            //локализация для русского языка. Оповещение при вводе имени Аноним или аноним и тд
            if currentPhoneLangID == "ru" {
                noAnonymousAlert = UIAlertController(title: "Вы не можете использовать это имя", message: nil, preferredStyle: .alert)
                yesAction = UIAlertAction(title: "Попробуйте еще раз", style: .cancel, handler: {action in
                //v.3.1 - повторно вывести сообщение с вводом имени
                self.present(alert, animated: true, completion: nil)
                })
            }
                    
        //v.3.2
        //2) арабский
        else if currentPhoneLangID == "ar"{
           noAnonymousAlert = UIAlertController(title: "لا يمكنك استخدام هذا الاسم", message: nil, preferredStyle: .alert)
           yesAction = UIAlertAction(title: "حاول مجددا", style: .cancel, handler: {action in
           self.present(alert, animated: true, completion: nil)
           })
        }
        //3) Венгерский = hu
        else if currentPhoneLangID == "hu"{
           noAnonymousAlert = UIAlertController(title: "Ezt a nevet nem lehet használni", message: nil, preferredStyle: .alert)
           yesAction = UIAlertAction(title: "Próbáld újra", style: .cancel, handler: {action in
           self.present(alert, animated: true, completion: nil)
           })
        }
        //4) Вьетнамский = vi
        else if currentPhoneLangID == "vi"{
           noAnonymousAlert = UIAlertController(title: "Bạn không thể sử dụng tên này", message: nil, preferredStyle: .alert)
           yesAction = UIAlertAction(title: "Thử lại", style: .cancel, handler: {action in
           self.present(alert, animated: true, completion: nil)
           })
        }
        //5) Греческий = el
        else if currentPhoneLangID == "el"{
           noAnonymousAlert = UIAlertController(title: "Δεν μπορείτε να χρησιμοποιήσετε αυτό το όνομα", message: nil, preferredStyle: .alert)
           yesAction = UIAlertAction(title: "Προσπάθησε ξανά", style: .cancel, handler: {action in
           self.present(alert, animated: true, completion: nil)
           })
        }
        //6) Датский = da
        else if currentPhoneLangID == "da"{
           noAnonymousAlert = UIAlertController(title: "Du kan ikke bruge dette navn", message: nil, preferredStyle: .alert)
           yesAction = UIAlertAction(title: "Prøv igen", style: .cancel, handler: {action in
           self.present(alert, animated: true, completion: nil)
           })
        }
        //7) Иврит = he
        else if currentPhoneLangID == "he"{
           noAnonymousAlert = UIAlertController(title: "אינך יכול להשתמש בשם זה", message: nil, preferredStyle: .alert)
           yesAction = UIAlertAction(title: "נסה שוב", style: .cancel, handler: {action in
           self.present(alert, animated: true, completion: nil)
           })
        }
        //8) Индонезийский = id
        else if currentPhoneLangID == "id"{
            noAnonymousAlert = UIAlertController(title: "Anda tidak dapat menggunakan nama ini", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Coba lagi", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
            })
        }
        //9) Испанский = es
        else if currentPhoneLangID == "es"{
           noAnonymousAlert = UIAlertController(title: "No puedes usar este nombre", message: nil, preferredStyle: .alert)
           yesAction = UIAlertAction(title: "Inténtalo de nuevo", style: .cancel, handler: {action in
           self.present(alert, animated: true, completion: nil)
           })
        }
        //10) Итальянский = it
        else if currentPhoneLangID == "it"{
           noAnonymousAlert = UIAlertController(title: "Non puoi usare questo nome", message: nil, preferredStyle: .alert)
           yesAction = UIAlertAction(title: "Riprova", style: .cancel, handler: {action in
           self.present(alert, animated: true, completion: nil)
           })
        }
        //11) Каталанский = ca
        else if currentPhoneLangID == "ca"{
            noAnonymousAlert = UIAlertController(title: "No podeu fer servir aquest nom", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Torna-ho a provar", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //12) Китайский = zh
        else if currentPhoneLangID == "zh"{
            noAnonymousAlert = UIAlertController(title: "您不能使用這個名字", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "再試一次", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //13) Корейский = ko
        else if currentPhoneLangID == "ko"{
            noAnonymousAlert = UIAlertController(title: "이 이름을 사용할 수 없습니다", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "다시 시도하십시오", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //14) Малайский = ms
        else if currentPhoneLangID == "ms"{
            noAnonymousAlert = UIAlertController(title: "Anda tidak boleh menggunakan nama ini", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Cuba lagi", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //15) Немецкий = de
        else if currentPhoneLangID == "de"{
            noAnonymousAlert = UIAlertController(title: "Sie können diesen Namen nicht verwenden", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Versuch es noch einmal", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //16) Нидерландский = nl
        else if currentPhoneLangID == "nl"{
            noAnonymousAlert = UIAlertController(title: "Je mag deze naam niet gebruiken", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Probeer het opnieuw", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //17) Норвежский = nb
        else if currentPhoneLangID == "nb"{
            noAnonymousAlert = UIAlertController(title: "Du kan ikke bruke dette navnet", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Prøv igjen", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
            })
        }
        //18) Польский = pl
        else if currentPhoneLangID == "pl"{
            noAnonymousAlert = UIAlertController(title: "Nie możesz użyć tej nazwy", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Spróbuj ponownie", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //19) Португальский = pt
        else if currentPhoneLangID == "pt"{
            noAnonymousAlert = UIAlertController(title: "Você não pode usar este nome", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Tente novamente", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //20) Румынский = ro
        else if currentPhoneLangID == "ro"{
            noAnonymousAlert = UIAlertController(title: "Nu poți folosi acest nume", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Încearcă din nou", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //21) Русский = ru
        
        //22) Словацкий = sk
        else if currentPhoneLangID == "sk"{
            noAnonymousAlert = UIAlertController(title: "Toto meno nemôžete použiť", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Skúste to znova", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
            })
        }
        //23) Тайский = th
        else if currentPhoneLangID == "th"{
            noAnonymousAlert = UIAlertController(title: "คุณไม่สามารถใช้ชื่อนี้", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "ลองอีกครั้ง", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //24) Турецкий = tr
        else if currentPhoneLangID == "tr"{
            noAnonymousAlert = UIAlertController(title: "Bu adı kullanamazsınız", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Tekrar deneyin", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //25) Украинский = uk
        else if currentPhoneLangID == "uk"{
           noAnonymousAlert = UIAlertController(title: "Ви не можете використовувати це ім'я", message: nil, preferredStyle: .alert)
           yesAction = UIAlertAction(title: "Спробуйте ще раз", style: .cancel, handler: {action in
           self.present(alert, animated: true, completion: nil)
        })
        }
        //26) Финский = fi
        else if currentPhoneLangID == "fi"{
            noAnonymousAlert = UIAlertController(title: "Et voi käyttää tätä nimeä", message: nil, preferredStyle: .alert)
           yesAction = UIAlertAction(title: "Yritä uudelleen", style: .cancel, handler: {action in
           self.present(alert, animated: true, completion: nil)
        })
        }
        //27) Французский = fr
        else if currentPhoneLangID == "fr"{
            noAnonymousAlert = UIAlertController(title: "Vous ne pouvez pas utiliser ce nom", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Réessayer", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //28) Хинди = hi
        else if currentPhoneLangID == "hi"{
            noAnonymousAlert = UIAlertController(title: "आप इस नाम का उपयोग नहीं कर सकते", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "पुनः प्रयास करें", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //29) Хорватский = hr
        else if currentPhoneLangID == "hr"{
            noAnonymousAlert = UIAlertController(title: "Ne možete koristiti ovo ime", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Pokušajte ponovo", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //30) Чешский = cs
        else if currentPhoneLangID == "cs"{
            noAnonymousAlert = UIAlertController(title: "Toto jméno nemůžete použít", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Zkus to znovu", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //31) Шведский = sv
        else if currentPhoneLangID == "sv"{
            noAnonymousAlert = UIAlertController(title: "Du kan inte använda det här namnet", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "Försök igen", style: .cancel, handler: {action in
            self.present(alert, animated: true, completion: nil)
        })
        }
        //32) Японский = ja
        else if currentPhoneLangID == "ja"{
            noAnonymousAlert = UIAlertController(title: "この名前は使用できません", message: nil, preferredStyle: .alert)
            yesAction = UIAlertAction(title: "再試行", style: .cancel, handler: {action in
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
        
        //v3.2
        //вместо id добавлю язык телефона и цифры
        //let message = ["sender_id": senderId, "name": senderDisplayName + "_id" + senderId, "text": text]
        let message = ["sender_id": senderId, "name": senderDisplayName + "_" + currentPhoneLangID + senderId, "text": text]
        

        ref.setValue(message)

        finishSendingMessage()
    }
    
    
    
} //скобка закрытия класса
