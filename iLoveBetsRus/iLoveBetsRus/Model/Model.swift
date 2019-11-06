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
            
            //печатаем в консоле путь к файлу
            print(urlPath)
        }
        
    }
    
    //запускаем загрузку
    downloadTask.resume()
}
