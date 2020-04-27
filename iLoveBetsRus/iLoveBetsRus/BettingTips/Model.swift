//
//  Model.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 06.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import Foundation

//v2.3
//объявляем глобальную переменную для определения языка приложения
var currentPhoneLangID: String {
    if Locale.preferredLanguages.count == 0 {
        return "en"
    }
    guard let language = Locale.preferredLanguages.first else {
        return "en"
    }
    return String(language.prefix(2))
}




//создаем массив Новостей. [] - пустой массив новостей
var articles: [Article] = []

//

var urlToData: URL {
    //эта команда вернет путь в директорию пользователя. это массив всех папок, которые там есть. наши новости будут загружены в файл data.json в файловой системе устройства
let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
let urlPath = URL(fileURLWithPath: path)
return urlPath
}
    
//Функция загрузки новостей
//отдаем функцию loadNews так называемой completionHandler
func loadNews(completionHandler: (()->Void)?) {
  /*  let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2019-10-06&sortBy=publishedAt&apiKey=239de8b6b6ed404ebcb61b80dfcf7bbc") */
    
    //  let url = URL(string: "https://ilovebets.ru/myApp2019/ru/bettingTipsRus/")
    
    
    
    
    
    //снять комментарий после скриншотов
    
    
    //переменная "bettingTipsLink" отвечает за ссылку на раздел "Прогнозы"
    //по умолчанию грузится английская версия
            var bettingTipsLink = "https://ilovebets.ru/mobileApp/iOS/bettingTipsEng/"

    //v.2.3 комментируем
    //проверка языка локализации!!!!!!!!!!
    /*        let locale = NSLocale.current
            let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
            var currentPhoneLangID = currentLangID
            //вычитаем 3 символа, чтобы получилось только ru (ru-US)
            let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
            currentPhoneLangID.removeSubrange(range)
            //в зависимости от языка телефона загружается ссылка
     */
            
    //v2.3
               // if currentLangID == "ru-RU"
            if currentPhoneLangID == "ru" || currentPhoneLangID == "uk"{
                bettingTipsLink = "https://ilovebets.ru/mobileApp/iOS/bettingTipsRus/"
            } else {
    //иначе грузится английская версия прогнозов
                bettingTipsLink = "https://ilovebets.ru/mobileApp/iOS/bettingTipsEng/"
            }
      
    
    //снять комментарий после скриншотов
    
    //закомментировать после скриншотов
    //var bettingTipsLink = "https://ilovebets.ru/mobileApp/iOS/bettingTipsEng/"
    //закомментировать после скриншотов
    
    
        let url = URL(string: bettingTipsLink)
    
    
    
    //Оригинал работающих новостей
    /*    let url = URL(string: "https://ilovebets.ru/mobileApp/iOS/bettingTipsRus/")
 */
    
    
    
    let session = URLSession(configuration: .default)
    
    //создаем объект. то есть, скачиваем информацию по ссылке и записываем в файл, который будет храниться в файловой системе устройства
    let downloadTask = session.downloadTask(with: url!) { (urlFile, responce, error) in
        
        //проверяем, что если наш файл не равен "нулю", то значит файл загружен
        if urlFile != nil {
        //эта команда вернет путь в директорию пользователя. это массив всех папок, которые там есть. наши новости будут загружены в файл data.json в файловой системе устройства. при оптимизации скопировали в выше "var urlToData: URL {
        
          //  try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            try?  FileManager.default.replaceItemAt(urlToData, withItemAt: urlFile!)
            
            //Тестируем, что все ок. Печатаем в консоле путь к файлу при запуске приложения
            print(urlToData)
            //вызываем функцию parseNews после того, как сохранили наш файл:
            parseNews()
            completionHandler?()
            //чтобы протестировать, печатаем количество новостей в массиве:
           // print(articles.count)
            
        }
    }
    
    //запускаем загрузку
    downloadTask.resume()
}

//Функция для распарсивания файла. распарсиваем файл data.json из файловой системы с данными
func parseNews() {
    //получаем бинарные данные из нашего файла
    let data = try? Data(contentsOf: urlToData)
    //если data = 0, то выходим из функции func parseNews(). Сделано, чтобы приложение не вылетало, если с данными в файле что-то не так
    if data == nil {
        return
    }
    
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    //если данные в словаре = 0, то выходим из функции func parseNews()
    if rootDictionaryAny == nil {
        return
    }
    /*
    //или можно сделать do catch проверку, чтобы проверить, если с данными в словаре не все ок, чтобы приложение не вылетало. при ошибке идем в блок catch
    do {
        //получаем рутовый словарь. если ошибка, идем в блок catch
          let rootDictionary = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    } catch {
        //здесь можно показать пользователю, почему ошибка
        //error.localizedDescription
    }
  */
    //делаем преобразование типов
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    //если данные в словаре = 0, то выходим из функции
    if rootDictionary == nil {
        return
    }
    
    //получаем МАССИВ по ключу articles из статьи. Словарь состоит из [ключ, значение]
    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
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
    
}
