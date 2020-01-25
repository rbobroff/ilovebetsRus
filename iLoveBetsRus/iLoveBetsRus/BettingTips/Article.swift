//
//  Article.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 06.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import Foundation

//Отображение новостей сделано по курсу https://youtu.be/lCDTcGJ5Nwg

//Пример формата  jSON по курсу:
/*
 {
 -"source": {
 "id": null,
 "name": "Prnewswire.com"
 },
 "author": null,
 "title": "Nervos Network Announces the Launch of Its Mainnet",
 "description": "SAN FRANCISCO, Nov. 6, 2019 /PRNewswire/ -- Nervos Network, an open source public blockchain project, today announced that it has open-sourced its mainnet \"Lina\" to the Nervos community for public release. After months of rigorous testing in a live network en…",
 "url": "https://www.prnewswire.com/news-releases/nervos-network-announces-the-launch-of-its-mainnet-300952948.html",
 "urlToImage": "https://www.prnewswire.com/content/dam/prnewswire/common/prn_facebook_sharing_logo.jpg",
 "publishedAt": "2019-11-06T17:00:00Z"
 }
 */


//Создаем структуру для нашей новости
struct Article {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
    
    var sourceName: String
    
    //метод-конструктор в который будем передавать словарь. ПО КЛЮЧАМ ИЗ СТАТЬИ БУДЕМ ПЕРЕДВАТЬ ЗНАЧЕНИЯ!!!
    init(dictionary: Dictionary<String, Any>) {
        //Обращаемся к нашему словарю по ключам. присваиваем значения. Ключи: author,title,url,urlToImage,publishedAt,sourceName
       /* из статьи. Словарь [ключ : значение]
        "author": null,
        "title": "Nervos Network Announces the Launch of Its Mainnet",
        "description": "SAN FRANCISCO*/
        
        author = dictionary["author"] as? String ?? "" //если вдруг значение будет = 0, то чтобы не было ошибки? вставляем пустую строчку с помощью: ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        content = dictionary["content"] as? String ?? ""
        
        //sourceName сделан, как словарь на ресурсе newsapi.org. поэтому к одному из значений этого словаря обращаемся по одному из ключей:
        /*source": {
        "id": null,
        "name": "Prnewswire.com"
        }*/
        //обращаемся к нашему словарю source по ключу name, то есть присваиваем значение "Prnewswire.com". Если пусто, то присваиваем пустую строку ?? ""
        sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["":""])["name"] as? String  ?? ""
    }
    
}
