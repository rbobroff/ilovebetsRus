//
//  Constants.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 07.12.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import Foundation // возможно стоит удалить



import Firebase

struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}
