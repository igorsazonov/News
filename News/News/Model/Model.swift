//
//  Model.swift
//  News
//
//  Created by Игорь Сазонов on 19/06/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import Foundation

//https://newsapi.org/v2/everything?q=bitcoin&from=2019-05-19&sortBy=publishedAt&apiKey=6da8248227c0473b96bb18d41a175081

var articles: [Article] = []

var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}

func loadNews(completionHandler: (() -> Void)?) {
    let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2019-05-19&sortBy=publishedAt&apiKey=6da8248227c0473b96bb18d41a175081")
    let session = URLSession(configuration: .default)
    
    let downloadTask = session.downloadTask(with: url!) { (urlFile, response, error) in
        if urlFile != nil {
            try? FileManager.default.copyItem(at: urlFile!, to:  urlToData)
            parseNews()
            completionHandler?()
        }
    }
    
    downloadTask.resume()
}

func parseNews() {
    
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return
    }
    
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return
    }
    
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    
    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        var returnArray: [Article] = []
        
        for dict in array {
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
        }
         articles = returnArray
    }
}
