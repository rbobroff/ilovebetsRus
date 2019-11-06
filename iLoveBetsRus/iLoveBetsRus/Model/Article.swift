//
//  Article.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 06.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import Foundation

/*
 {
 -"source": {
 "id": null,
 "name": "Bitcoinist.com"
 },
 "author": "Julio Gil-Pulgar",
 "title": "Bitcoin Price Hits $11.6K on Argentinian Crypto Exchange",
 "description": "Argentina’s government is imposing stricter measures to prevent access to foreign exchange reserves. As a result, Bitcoin price on one of the country’s local exchanges is currently trading at a 25 percent premium. Trading Jobs Cut Boosts Bitcoin Price Shiftin…",
 "url": "https://bitcoinist.com/bitcoin-price-breaks-12k-on-argentinian-crypto-exchange/",
 "urlToImage": "https://bitcoinist.com/wp-content/uploads/2019/11/shutterstock_1161393115-1920x1200.jpg",
 "publishedAt": "2019-11-05T17:00:03Z"
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
    var sourceName: String
    
}
