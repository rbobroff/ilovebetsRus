//
//  TableViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 07.11.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
//По этой инструкции настроен TableView и отображение й новости: https://www.youtube.com/watch?v=lCDTcGJ5Nwg&list=PLcmaZSNs2TKhWZSUVA8sFt2ETdbH7LCP3
    
    //v2.4
    //аутлет ActivityIndicator для списка новостей
    @IBOutlet weak var loadTipsActivityIndicator: UIActivityIndicatorView!
    
    @IBAction func refreshControllAction(_ sender: Any) {
        //v.2.4 - activity indicator при загрузке новостей
    self.loadTipsActivityIndicator.stopAnimating()
        loadNews {
            DispatchQueue.main.async {
    self.refreshControl?.endRefreshing()
    self.tableView.reloadData()
           }
        }
    }
    
    
    //добавление заголовка
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        //закомментировать после скриншотов
        //self.navigationItem.title = "#BettingTips"
        //self.navigationController?.isNavigationBarHidden = false
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
        
        //v.2.3
        //    if currentLangID == "ru-RU"
              if currentPhoneLangID == "ru" {
                  self.navigationItem.title = "#Прогнозы"
                  //добавление строки навигации при загрузке ViewControllera
              } else {
                  self.navigationItem.title = "#BettingTips"
              }
        //v2.3
        //self.navigationController?.isNavigationBarHidden = false
 
        //v.2.3 - строка ниже, чтобы срабатывала анимация скрытия navigationBar. возвращаем в первоначальное состояние. также прописана строка на viewController
        self.navigationController?.navigationBar.transform = .identity
        
        self.navigationController?.isNavigationBarHidden = false
        //v.2.3 для анмированного удаления navigationBar
        self.navigationController?.navigationBar.alpha = 0
        
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationController?.navigationBar.alpha = 1
           })
        }
        
        
         
        //снять комментарий после скриншотов
 
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        //при загрузке нашего контроллера с таблицей запускаем метод загрузки новостей
        loadNews {
            //обновляем наше табличное представление и это надо делать в основном потоке с помощью dispatchQueue
            DispatchQueue.main.async {
            self.tableView.reloadData()
                //как только новости загружены и мы их распарсили, то отработает блок кода completionHandler?() в Model.swift и таблица обновится
            }
            
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //изменили на 1
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //количество ячеек будет равно количеству статей
        return articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! newTableViewCell
        //v.2.5 добавление точки в список прогнозов
        //добавлено: as! newTableViewCell
        
//указываем идентификатор Cell и тут же его переносим на Main StoryBoard TableView в поле Identifier. Для этого надо выделить ячейку и перейти в Attributes Inspector
//Далее здесь в StoryBoard меняем стиль нашей таблицы с Custom на Subtitle - появляется Title и Subtitle в ячейке
        
        // Configure the cell...
        //получаем новость для нашей ячейки
        let article = articles[indexPath.row]
        //берем название статьи (новости) и дату публикации
        
        //v.2.5 добавление точки в список прогнозов
        cell.initCell(article: article)
        //если стиль ячейки Subtitle
        //cell.textLabel?.text = article.title
        //cell.detailTextLabel?.text = article.publishedAt
        return cell
    }
    
    //создаем метод, который вызывается тогда, когда нажали по ячейке. Создаем для перехода на экран с одной новостью при нажатии по ячейке в таблице
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //выполняем переход по нажатию ячейки. указываем идентификатор перехода "goToOneNews"
        performSegue(withIdentifier: "goToOneNews", sender: self)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // подготовка к переходу
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //у нашей переменной segue есть путь назначения, это и есть наш OneNewsViewController. делаем преобразования в OneNewsViewController: as?
        //переменной article должны присвоить значение выбранной ячейки
        if segue.identifier == "goToOneNews" {
            //делаем проверку, чтобы ничего не вылетело. проверяем, чтобы indexPath не был равен "нулю"
            if let indexPath = tableView.indexPathForSelectedRow {
                (segue.destination as? OneNewsViewController)?.article = articles[tableView.indexPathForSelectedRow!.row]
                  
                  tableView.deselectRow(at: indexPath, animated: true)
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    


    

}
