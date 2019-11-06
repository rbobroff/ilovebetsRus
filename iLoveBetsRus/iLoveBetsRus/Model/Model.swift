//
//  Model.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 06.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import Foundation

//создаем массив Новостей. [] - пустой массив новостей
var articles: [Article] = []

//

//Функция загрузки новостей
func loadNews() {
    let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2019-10-06&sortBy=publishedAt&apiKey=239de8b6b6ed404ebcb61b80dfcf7bbc")
    let session = URLSession(configuration: .default)
    
    //создаем объект. то есть, скачиваем информацию по ссылке и записываем в файл, который будет храниться в файловой системе устройства
    let downloadTask = session.downloadTask(with: url!) { (urlFile, responce, error) in
        
        //проверяем, что если наш файл не равен "нулю", то значит файл загружен
        if urlFile != nil {
        //эта команда вернет путь в директорию пользователя. это массив всех папок, которые там есть. наши новости будут загружены в файл data.json в файловой системе устройства
        let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
            let urlPath = URL(fileURLWithPath: path)
            try? FileManager.default.copyItem(at: urlFile!, to: urlPath)
            //Тестируем, что все ок. Печатаем в консоле путь к файлу при запуске приложения
            print(urlPath)
            
            //вызываем функцию parseNews после того, как сохранили наш файл:
            parseNews()
            //чтобы протестировать, печатаем количество новостей в массиве:
            print(articles.count)
            
    
        }
        
    }
    
    //запускаем загрузку
    downloadTask.resume()
}

//Функция для распарсивания файла. распарсиваем файл data.json из файловой системы с данными
func parseNews() {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    
    //получаем бинарные данные из нашего файла
    let data = try? Data(contentsOf: urlPath)
    //получаем рутовый словарь
    let rootDictionary = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
    
    //получаем МАССИВ по ключу articles из статьи. Словарь состоит из [ключ, значение]
    let array = rootDictionary!["articles"] as! [Dictionary<String, Any>]
    
    var returnArray: [Article] = []
    // обходим массив. идем по объектам словаря
    for dict in array {
        let newArticle = Article(dictionary: dict)
        //добавляем в цикле новые элементы
        returnArray.append(newArticle)
    }
    //присваиваем значению articles значения нашего словаря
    articles = returnArray
}
