//
//  OneNewsViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 08.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import UIKit

class OneNewsViewController: UIViewController {

    //создаем переменную, в которую будем передавать из нашего TableViewController
    var article: Article!
    
    //вытаскиваем элементы, с которыми будем работать (из одной новости)
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//на основании переменной article, в которую записываются данные из структуру Article, заполняем все поля для экрана с одной новостью
        labelTitle.text = article.title
        labelDescription.text = article.description
        
        
        
        
        
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
