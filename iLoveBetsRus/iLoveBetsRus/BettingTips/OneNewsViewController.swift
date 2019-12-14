//
//  OneNewsViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 08.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import UIKit

class OneNewsViewController: UIViewController {

    //добавление заголовка
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "#Прогнозы"
               //добавление строки навигации при загрузке ViewControllera
    self.navigationController?.isNavigationBarHidden = false
    }
    
    
    //создаем переменную, в которую будем передавать из нашего TableViewController
    var article: Article!
    
    //вытаскиваем элементы, с которыми будем работать (из одной новости)
 
    
 
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//на основании переменной article, в которую записываются данные из структуру Article, заполняем все поля для экрана с одной новостью
        labelTitle.text = article.title
        labelDescription.text = article.description
        
 //       urlImage.text = article.urlToImage
 
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    self.imageView.image = UIImage(data: data)
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
