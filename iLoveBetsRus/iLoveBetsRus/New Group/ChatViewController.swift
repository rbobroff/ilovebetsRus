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
        return JSQMessagesBubbleImageFactory()!.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
    }()

    lazy var incomingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleLightGray())
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        senderId = "1234"
        senderDisplayName = "RomanB"
        
        //The first line hides the attachment button on the left of the chat text input field. The other two lines of code set the avatar size to zero, again, hiding it.
        inputToolbar.contentView.leftBarButtonItem = nil
collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        
        
    } //закрытие viewDidLoad
    
    
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
