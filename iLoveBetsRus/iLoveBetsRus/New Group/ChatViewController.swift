//
//  ChatViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 07.12.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class ChatViewController: JSQMessagesViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        senderId = "1234"
        senderDisplayName = "RomanB"

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
