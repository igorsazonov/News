//
//  Article.swift
//  News
//
//  Created by Игорь Сазонов on 19/06/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import Foundation


/*
 status": "ok",
 "totalResults": 5209,
 -"articles": [
 -{
 -"source": {
 "id": null,
 "name": "Newsbtc.com"
 },
 "author": "Aayush Jindal",
 "title": "Bitcoin (BTC) Price Uptrend Intact: Bulls Sighting Fresh Increase",
 "description": "Bitcoin price started a downside correction below the $9,200 support against the US Dollar. The price tested the $8,950 support area and it is currently moving higher towards $9,200. There was a break above a declining channel with resistance at $9,120 on the…",
 "url": "https://www.newsbtc.com/2019/06/19/bitcoin-btc-price-uptrend-intact-bulls-sighting-fresh-increase/",
 "urlToImage": "https://www.newsbtc.com/wp-content/uploads/2018/08/techanalysis-btc5.jpg",
 "publishedAt": "2019-06-19T06:00:42Z",
 "content": "Bitcoin price started a downside correction below the $9,200 support against the US Dollar.\r\nThe price tested the $8,950 support area and it is currently moving higher towards $9,200.\r\nThere was a break above a declining channel with resistance at $9,120 on t… [+2364 chars]"
 },*/

struct Article {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlImage: String
    var publishedAt: String
    var sourseName: String
    
    init(dictionary: Dictionary<String, Any>) {
        author = dictionary["autchor"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        
        sourseName = (dictionary["source"] as? Dictionary<String, Any> ?? ["":""])["name"] as? String ?? ""
    }
}
