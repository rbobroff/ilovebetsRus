//
//  TermsOfUseViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 10.09.2020.
//  Copyright © 2020 Roman Bobrov. All rights reserved.
//


//v3.3

import UIKit
import WebKit

class TermsOfUseViewController: UIViewController {

    
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var slideButtonOutlet: UIImageView!
    
    
    //https://www.youtube.com/watch?v=2ArlCvtL33I&feature=youtu.be
    //добавляем библиотеку в Build Phases - Webkit.Framework
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //убирать кнопку slideButton, если ниже iOS13
        if #available(iOS 13, *)  {
            slideButtonOutlet.isHidden = false
               }   else   {
            slideButtonOutlet.isHidden = true
               }
        
        let url = URL(string: "https://ilovebets.ru/mobileApp/iOS/StatisticsEng/")
        let request = URLRequest(url: url!)
        
        webView.load(request)

        // Do any additional setup after loading the view.
    }
    


}
