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
            senderDisplayName = ""

            defaults.set(senderId, forKey: "jsq_id")
            defaults.synchronize()

            showDisplayNameDialog()
        }

        //в русской-английской версии заменить слово Чат
        title = "Чат: \(senderDisplayName!)"
//для английской версии
            //  title = "Chat: \(senderDisplayName!)"
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showDisplayNameDialog))
        tapGesture.numberOfTapsRequired = 1

        navigationController?.navigationBar.addGestureRecognizer(tapGesture)
        
        
        
        
        //The first line hides the attachment button on the left of the chat text input field. The other two lines of code set the avatar size to zero, again, hiding it.
        inputToolbar.contentView.leftBarButtonItem = nil
collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        
       
        //Observing Firebase For New Chat Messages
        let query = Constants.refs.databaseChats.queryLimited(toLast: 10)

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
    } //закрытие viewDidLoad
    
    
    //Setting A User’s Display Name With A Dialog
    //чтобы были разные имена у прльзователей
    @objc func showDisplayNameDialog()
    {
        let defaults = UserDefaults.standard

        
        //Сообщение, где предлагается ввести имя
     //для русской версии
     let alert = UIAlertController(title: "Введите имя", message: "Прежде чем Вы сможете общаться, введите имя. Другие пользователи увидят Ваше имя при отправке сообщений чата. Вы можете изменить свое имя, нажав на панель навигации", preferredStyle: .alert)
        
      //  для английской версии
    /*    let alert = UIAlertController(title: "Your Display Name", message: "Before you can chat, please choose a display name. Others will see this name when you send chat messages. You can change your display name again by tapping the navigation bar.", preferredStyle: .alert)
*/
        
        
        
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

                self?.senderDisplayName = textField.text

                self?.title = "Chat: \(self!.senderDisplayName!)"

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
        return messages[indexPath.item].senderId == senderId ? nil : NSAttributedString(string: messages[indexPath.item].senderDisplayName)
    }
//is called when the height of the top label is needed
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat
    {
        return messages[indexPath.item].senderId == senderId ? 0 : 15
    }
    
    
    //при нажатии кнопки отправить
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!)
    {
        let ref = Constants.refs.databaseChats.childByAutoId()
        //создается словарь message
        let message = ["sender_id": senderId, "name": senderDisplayName, "text": text]

        ref.setValue(message)

        finishSendingMessage()
    }
    
    
    
} //скобка закрытия класса
