//
//  OneNewsViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 08.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import UIKit

class OneNewsViewController: UIViewController {

    
    //default "imageHeight" = 450
    //UIScreen.main.bounds.width == 375
    //for iPhone 6, 6S, 7, 8, SE_2nd, iPhone X, 11pro
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    
    //добавление заголовка
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        //Масштабирование КАРТИНКИ для разной ширины экрана
        //iPhone 5S, SE
       if UIScreen.main.bounds.width == 320 {
        imageHeightConstraint.constant = 384
        }
        //iPhone 6+, 6S+ 7+, 8+, iPhone 11, 11 Pro Max
       else if UIScreen.main.bounds.width == 414 {
        imageHeightConstraint.constant = 496.8
        }
        else if UIScreen.main.bounds.height == 1024 && UIScreen.main.bounds.width == 768 {
        imageHeightConstraint.constant = 921.6
        imageViewTopConstraint.constant = -65
        }
        
        
        
        
        
        //v.2.5 - масштабируем изображение
               //Для iPhone 11, 11 Pro Max (с высотой экрана 896.0) - настроены Constraints
        //    if UIScreen.main.bounds.height == 896 {
            
                //Для iPhone 5S, SE (с высотой экрана 568.0) - настроены Constraints
     //   if UIScreen.main.bounds.height == 568 {
        
        
        
        
        //закомментировать после скриншотов
        //self.navigationItem.title = "#Tip"
       // self.navigationController?.isNavigationBarHidden = false
        //закомментировать после скриншотов
        
        //снять комментарий после скриншотов
         
        
        
        //v.2.3 - комментируем, тк объявляем глобальную переменную
        //проверка языка локализации!!!!!!!!!!
        /*
                   let locale = NSLocale.current
                   let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
                   var currentPhoneLangID = currentLangID
                   //вычитаем 3 символа, чтобы получилось только ru (ru-US)
                   let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
                   currentPhoneLangID.removeSubrange(range)
                   //если русский язык, отображать ЗАГОЛОВОК по-русски
        */
        
               //    if currentLangID == "ru-RU"
       
        //v.2.3
        if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
            self.navigationItem.title = "#Прогноз"
            //добавление строки навигации при загрузке ViewControllera
        } else {
            self.navigationItem.title = "#Tip"
        }
        
        //v2.3
        //self.navigationController?.isNavigationBarHidden = false
         
        
    //v.2.3 - строка ниже, чтобы срабатывала анимация скрытия navigationBar. возвращаем в первоначальное состояние. также прописана строка на viewController
    //  self.navigationController?.navigationBar.transform = .identity
        
    //   self.navigationController?.isNavigationBarHidden = false
        //v.2.3 для анмированного удаления navigationBar
    //   self.navigationController?.navigationBar.alpha = 0
        
    //   UIView.animate(withDuration: 0.3, animations: {
    //       self.navigationController?.navigationBar.alpha = 1
    //      })
        }
        
        //снять комментарий после скриншотов
        
        
    
    
    
    
    
    //создаем переменную, в которую будем передавать из нашего TableViewController
    var article: Article!
    
    //вытаскиваем элементы, с которыми будем работать (из одной новости)
 
    
 
    @IBOutlet weak var imageView: UIImageView!
    
    //Название Чемпионата
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    //дата прогноза
    @IBOutlet weak var publishedAt: UILabel!
    
    //команды
    @IBOutlet weak var url: UILabel!
    
    //ставка, tip
    @IBOutlet weak var author: UILabel!
    
    //коэффициент
    @IBOutlet weak var content: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//на основании переменной article, в которую записываются данные из структуры Article, заполняем все поля для экрана с одной новостью
        labelTitle.text = article.title //чемпионат
        labelDescription.text = article.description
        publishedAt.text = article.publishedAt
        url.text = article.url
        author.text = article.author
        content.text = article.content
        
 //       urlImage.text = article.urlToImage
 
        
        //v2.3 - закомментировали. ниже новый код, чтобы не замораживался интерфейс
        //загрузка картинки 1-я версия
/*          DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
*/
        //v2.3
        //загрузка картинки не в основном потоке. чтобы не замораживался экран при загрузке картинки
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }
        }
        
        
        
        
        
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
