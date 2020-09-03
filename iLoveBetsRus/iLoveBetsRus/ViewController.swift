//
//  ViewController.swift
//  iLoveBetsRus
//
//  Created by Roman Bobrov on 29.10.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import UIKit
import MessageUI //библиотека для отправки e-mail
import ApphudSDK //v.3.3 - подписка
import StoreKit  //v.3.3 - подписка

//Инструкция по отправке E-mail: https://www.youtube.com/watch?v=J-pn5V2jcfo&t=2s

class ViewController: UIViewController {
    

    
//https://www.youtube.com/watch?v=gLTDY8Qj6EM&feature=youtu.be
//v.3.3 - actions и outlets для всплывающего окна подписки
    //при нажатии кнопки "Купить" на главном экране ViewController срабатывает blur-эффект и после этого появляется Pop-Up View
    @IBAction func buyButton(_ sender: Any) {
        animateIn(desiredView: blurView)
        animateIn(desiredView: popupView)
         
        //v.3.3 - язык по умолчанию
        subscribeLabelPopUpView.text = "Subscription"
        aboutSubscriptionTitleLabel.text = "Please read below about the auto-renewing subscription nature of this product:"
        aboutSubscriptionTextLabel.text = "Payment will be charged to iTunes Account at confirmation of purchase. Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period. Account will be charged for renewal within 24-hours prior to the end of the current period, and identify the cost of the renewal. Subscriptions may be managed by the user and auto-renewal may be turned off by going to the user's Account Settings after purchase. Any unused portion of a free trial period, if offered, will be forfeited when the user purchases a subscription to that publication, where applicable."
        restorePurchasesButtonOutlet.setTitle("Restore Purchase", for: .normal)
        termsOfUseButtonOutlet.setTitle("Terms of Use", for: .normal)
        privacyPolicyButtonOutlet.setTitle("Privacy Policy", for: .normal)
        subscribeButtonOutlet.setTitle("Subscribe", for: .normal)
        
        //Локализация верхнего label "Subscribe" окна подписки, кнопок RestorePurchase-TermsOfUse-PrivacyPolicy, aboutSubscriptionTitleLabel, aboutSubscriptionTextLabel
        if currentPhoneLangID == "ru" {
            subscribeLabelPopUpView.text = "Подписка"
            restorePurchasesButtonOutlet.setTitle("Восстановить покупки", for: .normal)
            termsOfUseButtonOutlet.setTitle("Условия использования", for: .normal)
            privacyPolicyButtonOutlet.setTitle("Политика конфиденциальности", for: .normal)
            subscribeButtonOutlet.setTitle("Подписаться", for: .normal)
            aboutSubscriptionTitleLabel.text = "Титул"
            aboutSubscriptionTextLabel.text = "Описание правил"
        }
        //2) Арабский
        else if currentPhoneLangID == "ar"{
        subscribeLabelPopUpView.text = "الاشتراك"
        }
        //3) Венгерский = hu
        else if currentPhoneLangID == "hu"{
        subscribeLabelPopUpView.text = "Feliratkozás"
        }
        //4) Вьетнамский = vi
        else if currentPhoneLangID == "vi"{
        subscribeLabelPopUpView.text = "Đăng ký"
        }
        //5) Греческий = el
        else if currentPhoneLangID == "el"{
        subscribeLabelPopUpView.text = "Συνδρομή"
        }
        //6) Датский = da
        else if currentPhoneLangID == "da"{
        subscribeLabelPopUpView.text = "Abonnement"
        }
        //7) Иврит = he
        else if currentPhoneLangID == "he"{
        subscribeLabelPopUpView.text = "מִנוּי"
        }
        //8) Индонезийский = id
        else if currentPhoneLangID == "id"{
        subscribeLabelPopUpView.text = "Berlangganan"
        }
        //9) Испанский = es
        else if currentPhoneLangID == "es"{
        subscribeLabelPopUpView.text = "Suscripción"
        }
        //10) Итальянский = it
        else if currentPhoneLangID == "it"{
        subscribeLabelPopUpView.text = "Sottoscrizione"
        }
        //11) Каталанский = ca
        else if currentPhoneLangID == "ca"{
        subscribeLabelPopUpView.text = "Subscripció"
        }
        //12) Китайский = zh
        else if currentPhoneLangID == "zh"{
        subscribeLabelPopUpView.text = "訂閱"
        }
        //13) Корейский = ko
        else if currentPhoneLangID == "ko"{
        subscribeLabelPopUpView.text = "신청"
        }
        //14) Малайский = ms
        else if currentPhoneLangID == "ms"{
        subscribeLabelPopUpView.text = "Langganan"
        }
        //15) Немецкий = de
        else if currentPhoneLangID == "de"{
        subscribeLabelPopUpView.text = "Abonnement"
        }
        //16) Нидерландский = nl
        else if currentPhoneLangID == "nl"{
        subscribeLabelPopUpView.text = "Abonnement"
        }
        //17) Норвежский = nb
        else if currentPhoneLangID == "nb"{
        subscribeLabelPopUpView.text = "Abonnement"
        }
        //18) Польский = pl
        else if currentPhoneLangID == "pl"{
        subscribeLabelPopUpView.text = "Subskrypcja"
        }
        //19) Португальский = pt
        else if currentPhoneLangID == "pt"{
        subscribeLabelPopUpView.text = "Inscrição"
        }
        //20) Румынский = ro
        else if currentPhoneLangID == "ro"{
        subscribeLabelPopUpView.text = "Abonament"
        }
        //21) Русский = ru
        
        //22) Словацкий = sk
        else if currentPhoneLangID == "sk"{
        subscribeLabelPopUpView.text = "Predplatné"
        }
        //23) Тайский = th
        else if currentPhoneLangID == "th"{
        subscribeLabelPopUpView.text = "การสมัครสมาชิก"
        }
        //24) Турецкий = tr
        else if currentPhoneLangID == "tr"{
        subscribeLabelPopUpView.text = "Abonelik"
        }
        //25) Украинский = uk
        else if currentPhoneLangID == "uk"{
        subscribeLabelPopUpView.text = "Передплата"
        }
        //26) Финский = fi
        else if currentPhoneLangID == "fi"{
        subscribeLabelPopUpView.text = "Tilaus"
        }
        //27) Французский = fr
        else if currentPhoneLangID == "fr"{
        subscribeLabelPopUpView.text = "Abonnement"
        }
        //28) Хинди = hi
        else if currentPhoneLangID == "hi"{
        subscribeLabelPopUpView.text = "अंशदान"
        }
        //29) Хорватский = hr
        else if currentPhoneLangID == "hr"{
        subscribeLabelPopUpView.text = "Pretplata"
        }
        //30) Чешский = cs
        else if currentPhoneLangID == "cs"{
        subscribeLabelPopUpView.text = "Předplatné"
        }
        //31) Шведский = sv
        else if currentPhoneLangID == "sv"{
        subscribeLabelPopUpView.text = "Prenumeration"
        }
        //32) Японский = ja
        else if currentPhoneLangID == "ja"{
        subscribeLabelPopUpView.text = "申し込み"
        }
        
        
        //!!!!!!!!!!!!!!!! - удалить, если не сработает
        if Apphud.products() != nil {
            reloadUI()
            activityIndicatorPopupView.stopAnimating()
            subscribeLabelPopUpView.isHidden = false
            subscriptionPriceLabelOutlet.isHidden = false
            productDescriptionLabel.isHidden = false
            productTrialDurationLabel.isHidden = false
            restorePurchasesButtonOutlet.isHidden = false
            aboutSubscriptionTitleLabel.isHidden = false
            aboutSubscriptionTextLabel.isHidden = false
            termsOfUseButtonOutlet.isHidden = false
            privacyPolicyButtonOutlet.isHidden = false
            subscribeButtonOutlet.isHidden = false
            
            
           
        } else {
            
            Apphud.refreshStoreKitProducts { products in
            self.reloadUI()
            self.activityIndicatorPopupView.stopAnimating()
            self.subscribeLabelPopUpView.isHidden = false
            self.subscriptionPriceLabelOutlet.isHidden = false
            self.productDescriptionLabel.isHidden = false
            self.productTrialDurationLabel.isHidden = false
            self.restorePurchasesButtonOutlet.isHidden = false
            self.aboutSubscriptionTitleLabel.isHidden = false
            self.aboutSubscriptionTextLabel.isHidden = false
            self.termsOfUseButtonOutlet.isHidden = false
            self.privacyPolicyButtonOutlet.isHidden = false
            self.subscribeButtonOutlet.isHidden = false
                

            }
        } //удалить, если не сработает !!!!!!!!!!!!!!!!!
        
        
        
        
    }
    //конец функции buyButton
    
    
    //v.3.3 - кнопка восстановить покупки
    @IBAction func restorePurchasesButton(_ sender: Any) {
        activityIndicatorButtonSubscribe.startAnimating()
        subscribeButtonOutlet.setTitleColor(UIColor.clear, for: .normal)
            Apphud.restorePurchases { _, _, _ in
                if Apphud.hasActiveSubscription() {
                // success, dismiss purchase screen and unlock premium content
                    self.activityIndicatorButtonSubscribe.stopAnimating()
                    self.animateOut(desiredView: self.popupView) //убираем Pop-Up View с анимацией
                    self.animateOut(desiredView: self.blurView)  //убираем Pop-Up View с анимацией
                    self.buyButtonOutlet.isHidden = true
                    self.bettingTipsButton.isHidden = false
                
                } else {
                // no active in-app purchases found
                    //сообщение у Вас нет активных подписок
                    var controller = UIAlertController(title: "You have no active subscriptions", message: nil, preferredStyle: .alert)
                    var ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                controller.addAction(ok)
                    
                            //локализация
                           if currentPhoneLangID == "ru" {
                        controller = UIAlertController(title: "У Вас нет активных подписок", message: nil, preferredStyle: .alert)
                        ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                        controller.addAction(ok)
                           }
                           //2) Арабский = ar
                           else if currentPhoneLangID == "ar"{
                        controller = UIAlertController(title: "ليس لديك اشتراكات نشطة", message: nil, preferredStyle: .alert)
                           }
                           //3) Венгерский = hu
                           else if currentPhoneLangID == "hu"{
                        controller = UIAlertController(title: "Nincs aktív előfizetésed", message: nil, preferredStyle: .alert)
                           }
                           //4) Вьетнамский = vi
                           else if currentPhoneLangID == "vi"{
                        controller = UIAlertController(title: "Bạn không có đăng ký nào đang hoạt động", message: nil, preferredStyle: .alert)
                           }
                           //5) Греческий = el
                           else if currentPhoneLangID == "el"{
                        controller = UIAlertController(title: "Δεν έχετε ενεργές συνδρομές", message: nil, preferredStyle: .alert)
                           }
                           //6) Датский = da
                           else if currentPhoneLangID == "da"{
                        controller = UIAlertController(title: "Du har ingen aktive abonnementer", message: nil, preferredStyle: .alert)
                           }
                           //7) Иврит = he
                           else if currentPhoneLangID == "he"{
                        controller = UIAlertController(title: "אין לך מינויים פעילים", message: nil, preferredStyle: .alert)
                           }
                           //8) Индонезийский = id
                           else if currentPhoneLangID == "id"{
                        controller = UIAlertController(title: "Anda tidak memiliki langganan aktif", message: nil, preferredStyle: .alert)
                           }
                           //9) Испанский = es
                           else if currentPhoneLangID == "es"{
                        controller = UIAlertController(title: "No tienes suscripciones activas", message: nil, preferredStyle: .alert)
                           }
                           //10) Итальянский = it
                           else if currentPhoneLangID == "it"{
                        controller = UIAlertController(title: "Non hai abbonamenti attivi", message: nil, preferredStyle: .alert)
                           }
                           //11) Каталанский = ca
                           else if currentPhoneLangID == "ca"{
                        controller = UIAlertController(title: "No teniu cap subscripció activa", message: nil, preferredStyle: .alert)
                           }
                           //12) Китайский = zh
                           else if currentPhoneLangID == "zh"{
                        controller = UIAlertController(title: "您沒有有效的訂閱", message: nil, preferredStyle: .alert)
                           }
                           //13) Корейский = ko
                           else if currentPhoneLangID == "ko"{
                        controller = UIAlertController(title: "활성 구독이 없습니다.", message: nil, preferredStyle: .alert)
                           }
                           //14) Малайский = ms
                           else if currentPhoneLangID == "ms"{
                        controller = UIAlertController(title: "Anda tidak mempunyai langganan aktif", message: nil, preferredStyle: .alert)
                           }
                           //15) Немецкий = de
                           else if currentPhoneLangID == "de"{
                        controller = UIAlertController(title: "Sie haben keine aktiven Abonnements", message: nil, preferredStyle: .alert)
                           }
                           //16) Нидерландский = nl
                           else if currentPhoneLangID == "nl"{
                        controller = UIAlertController(title: "Je hebt geen actieve abonnementen", message: nil, preferredStyle: .alert)
                           }
                           //17) Норвежский = nb
                           else if currentPhoneLangID == "nb"{
                        controller = UIAlertController(title: "Du har ingen aktive abonnementer", message: nil, preferredStyle: .alert)
                           }
                           //18) Польский = pl
                           else if currentPhoneLangID == "pl"{
                        controller = UIAlertController(title: "Nie masz żadnych aktywnych subskrypcji", message: nil, preferredStyle: .alert)
                           }
                           //19) Португальский = pt
                           else if currentPhoneLangID == "pt"{
                        controller = UIAlertController(title: "Você não tem assinaturas ativas", message: nil, preferredStyle: .alert)
                           }
                           //20) Румынский = ro
                           else if currentPhoneLangID == "ro"{
                        controller = UIAlertController(title: "Nu aveți abonamente active", message: nil, preferredStyle: .alert)
                           }
                           //21) Русский = ru
                           
                           //22) Словацкий = sk
                           else if currentPhoneLangID == "sk"{
                        controller = UIAlertController(title: "Nemáte žiadne aktívne predplatné", message: nil, preferredStyle: .alert)
                           }
                           //23) Тайский = th
                           else if currentPhoneLangID == "th"{
                        controller = UIAlertController(title: "คุณไม่มีการสมัครสมาชิกที่ใช้งานอยู่", message: nil, preferredStyle: .alert)
                           }
                           //24) Турецкий = tr
                           else if currentPhoneLangID == "tr"{
                        controller = UIAlertController(title: "Aktif aboneliğiniz yok", message: nil, preferredStyle: .alert)
                           }
                           //25) Украинский = uk
                           else if currentPhoneLangID == "uk"{
                        controller = UIAlertController(title: "У вас немає активних підписок", message: nil, preferredStyle: .alert)
                           }
                           //26) Финский = fi
                           else if currentPhoneLangID == "fi"{
                        controller = UIAlertController(title: "Sinulla ei ole aktiivisia tilauksia", message: nil, preferredStyle: .alert)
                           }
                           //27) Французский = fr
                           else if currentPhoneLangID == "fr"{
                        controller = UIAlertController(title: "Vous n'avez aucun abonnement actif", message: nil, preferredStyle: .alert)
                           }
                           //28) Хинди = hi
                           else if currentPhoneLangID == "hi"{
                        controller = UIAlertController(title: "आपके पास कोई सक्रिय सदस्यता नहीं है", message: nil, preferredStyle: .alert)
                           }
                           //29) Хорватский = hr
                           else if currentPhoneLangID == "hr"{
                        controller = UIAlertController(title: "Nemate aktivnih pretplata", message: nil, preferredStyle: .alert)
                           }
                           //30) Чешский = cs
                           else if currentPhoneLangID == "cs"{
                        controller = UIAlertController(title: "Nemáte žádné aktivní předplatné", message: nil, preferredStyle: .alert)
                           }
                           //31) Шведский = sv
                           else if currentPhoneLangID == "sv"{
                        controller = UIAlertController(title: "Du har inga aktiva prenumerationer", message: nil, preferredStyle: .alert)
                           }
                           //32) Японский = ja
                           else if currentPhoneLangID == "ja"{
                        controller = UIAlertController(title: "アクティブなサブスクリプションはありません", message: nil, preferredStyle: .alert)
                           }
                    
                    
                self.present(controller, animated: true, completion: nil)
                self.activityIndicatorButtonSubscribe.stopAnimating()
                self.subscribeButtonOutlet.setTitleColor(UIColor.white, for: .normal)
                    // self.buyButtonOutlet.isHidden = true
                    //self.bettingTipsButton.isHidden = false
                }
            }
    }
    
    
    
    
    
    //v.3.3 кнопка закрыть на всплывающем окне
    @IBAction func closeButton(_ sender: Any) {
        self.animateOut(desiredView: self.popupView) //убираем Pop-Up View с анимацией
        self.animateOut(desiredView: self.blurView)
    }
    
    
    
    //v.3.3 - функция обновления интерфейса данными о продукте "Цена", когда загружены продукты из AppStore -> AppHud
    func reloadUI() {
        if let product = Apphud.product(productIdentifier: "com.iloveapps.bettingadvisor.mysubscription") {
        // set up pricing for this product
         
            
           // текст перед ценой подписки и после цены
           var subscriptionPriceDescriptionBoldTextLabel = "Price: "
           var month = " / month"
            //локализация subscriptionPriceDescription перед ценой в местной валюте
          
                   if currentPhoneLangID == "ru" {
            subscriptionPriceDescriptionBoldTextLabel = "Цена: "
            month = " / месяц"
                   }
            //2) Арабский = ar
                   else if currentPhoneLangID == "ar"{
            subscriptionPriceDescriptionBoldTextLabel = "السعر "
            month = " شهر"
                   }
                   //3) Венгерский = hu
                   else if currentPhoneLangID == "hu"{
            subscriptionPriceDescriptionBoldTextLabel = "Ár: "
            month = " / hónap"
                   }
                   //4) Вьетнамский = vi
                   else if currentPhoneLangID == "vi"{
            subscriptionPriceDescriptionBoldTextLabel = "Giá bán: "
            month = " / tháng"
                   }
                   //5) Греческий = el
                   else if currentPhoneLangID == "el"{
            subscriptionPriceDescriptionBoldTextLabel = "Τιμή: "
            month = " / μήνας"
                   }
                   //6) Датский = da
                   else if currentPhoneLangID == "da"{
            subscriptionPriceDescriptionBoldTextLabel = "Pris: "
            month = " / måned"
                   }
                   //7) Иврит = he
                   else if currentPhoneLangID == "he"{
            subscriptionPriceDescriptionBoldTextLabel = "מחיר "
            month = " חוֹדֶשׁ"
                   }
                   //8) Индонезийский = id
                   else if currentPhoneLangID == "id"{
            subscriptionPriceDescriptionBoldTextLabel = "Harga: "
            month = " / bulan"
                   }
                   //9) Испанский = es
                   else if currentPhoneLangID == "es"{
            subscriptionPriceDescriptionBoldTextLabel = "Precio: "
            month = " / mes"
                   }
                   //10) Итальянский = it
                   else if currentPhoneLangID == "it"{
            subscriptionPriceDescriptionBoldTextLabel = "Prezzo: "
            month = " / mese"
                   }
                   //11) Каталанский = ca
                   else if currentPhoneLangID == "ca"{
            subscriptionPriceDescriptionBoldTextLabel = "Preu: "
            month = " / mes"
                   }
                   //12) Китайский = zh
                   else if currentPhoneLangID == "zh"{
            subscriptionPriceDescriptionBoldTextLabel = "價錢 "
            month = " 月"
                   }
                   //13) Корейский = ko
                   else if currentPhoneLangID == "ko"{
            subscriptionPriceDescriptionBoldTextLabel = "가격 "
            month = " 달"
                   }
                   //14) Малайский = ms
                   else if currentPhoneLangID == "ms"{
            subscriptionPriceDescriptionBoldTextLabel = "Harga: "
            month = " / bulan"
                   }
                   //15) Немецкий = de
                   else if currentPhoneLangID == "de"{
            subscriptionPriceDescriptionBoldTextLabel = "Preis: "
            month = " / monat"
                   }
                   //16) Нидерландский = nl
                   else if currentPhoneLangID == "nl"{
            subscriptionPriceDescriptionBoldTextLabel = "Prijs: "
            month = " / maand"
                   }
                   //17) Норвежский = nb
                   else if currentPhoneLangID == "nb"{
            subscriptionPriceDescriptionBoldTextLabel = "Pris: "
            month = " / måned"
                   }
                   //18) Польский = pl
                   else if currentPhoneLangID == "pl"{
            subscriptionPriceDescriptionBoldTextLabel = "Cena £: "
            month = " / miesiąc"
                   }
                   //19) Португальский = pt
                   else if currentPhoneLangID == "pt"{
            subscriptionPriceDescriptionBoldTextLabel = "Preço: "
            month = " / mês"
                   }
                   //20) Румынский = ro
                   else if currentPhoneLangID == "ro"{
            subscriptionPriceDescriptionBoldTextLabel = "Preț: "
            month = " / lună"
                   }
                   //21) Русский = ru
                   
                   //22) Словацкий = sk
                   else if currentPhoneLangID == "sk"{
            subscriptionPriceDescriptionBoldTextLabel = "Cena: "
            month = " / mesiac"
                   }
                   //23) Тайский = th
                   else if currentPhoneLangID == "th"{
            subscriptionPriceDescriptionBoldTextLabel = "ราคา "
            month = " เดือน"
                   }
                   //24) Турецкий = tr
                   else if currentPhoneLangID == "tr"{
            subscriptionPriceDescriptionBoldTextLabel = "Fiyat: "
            month = " / ay"
                   }
                   //25) Украинский = uk
                   else if currentPhoneLangID == "uk"{
            subscriptionPriceDescriptionBoldTextLabel = "Ціна: "
            month = " / місяць"
                   }
                   //26) Финский = fi
                   else if currentPhoneLangID == "fi"{
            subscriptionPriceDescriptionBoldTextLabel = "Hinta: "
            month = " / kuukausi"
                   }
                   //27) Французский = fr
                   else if currentPhoneLangID == "fr"{
            subscriptionPriceDescriptionBoldTextLabel = "Prix: "
            month = " / mois"
                   }
                   //28) Хинди = hi
                   else if currentPhoneLangID == "hi"{
            subscriptionPriceDescriptionBoldTextLabel = "कीमत "
            month = " महीना"
                   }
                   //29) Хорватский = hr
                   else if currentPhoneLangID == "hr"{
            subscriptionPriceDescriptionBoldTextLabel = "Cijena: "
            month = " / mjesec"
                   }
                   //30) Чешский = cs
                   else if currentPhoneLangID == "cs"{
            subscriptionPriceDescriptionBoldTextLabel = "Cena: "
            month = " / měsíc"
                   }
                   //31) Шведский = sv
                   else if currentPhoneLangID == "sv"{
            subscriptionPriceDescriptionBoldTextLabel = "Pris: "
            month = " / månad"
                   }
                   //32) Японский = ja
                   else if currentPhoneLangID == "ja"{
            subscriptionPriceDescriptionBoldTextLabel = "価格 "
            month = " 月"
                   }
            
            //записываем цену в местной валюте в priceString
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = product.priceLocale
            numberFormatter.numberStyle = .currency
            let priceString = numberFormatter.string(from: product.price)! + month
            //делаем часть текста жирным
            let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
            let attributedString2 = NSMutableAttributedString(string: subscriptionPriceDescriptionBoldTextLabel, attributes:attrs2)
            //делаем часть label нормальным
            let priceStringNormalTextLabel = priceString
            let normalString2 = NSMutableAttributedString(string: priceStringNormalTextLabel)
            //Соединяем 2 части текста:
            attributedString2.append(normalString2)
            //Выводим текст с ценой и с оформление в label
            subscriptionPriceLabelOutlet.attributedText = attributedString2
            
    
            //делаем часть label жирным и сразу локализуем
            var productDescriptionBoldTextLabel  = "Description: "
                
            //локализуем
                   if currentPhoneLangID == "ru" {
                   productDescriptionBoldTextLabel = "Описание: "
                   }
                   //2) Арабский = ar
                   else if currentPhoneLangID == "ar"{
                   productDescriptionBoldTextLabel = "وصف "
                   }
                   //3) Венгерский = hu
                   else if currentPhoneLangID == "hu"{
                   productDescriptionBoldTextLabel = "Leírás: "
                   }
                   //4) Вьетнамский = vi
                   else if currentPhoneLangID == "vi"{
                   productDescriptionBoldTextLabel = "Sự miêu tả: "
                   }
                   //5) Греческий = el
                   else if currentPhoneLangID == "el"{
                   productDescriptionBoldTextLabel = "Περιγραφή: "
                   }
                   //6) Датский = da
                   else if currentPhoneLangID == "da"{
                   productDescriptionBoldTextLabel = "Beskrivelse: "
                   }
                   //7) Иврит = he
                   else if currentPhoneLangID == "he"{
                   productDescriptionBoldTextLabel = "תיאור "
                   }
                   //8) Индонезийский = id
                   else if currentPhoneLangID == "id"{
                   productDescriptionBoldTextLabel = "Deskripsi: "
                   }
                   //9) Испанский = es
                   else if currentPhoneLangID == "es"{
                   productDescriptionBoldTextLabel = "Descripción: "
                   }
                   //10) Итальянский = it
                   else if currentPhoneLangID == "it"{
                   productDescriptionBoldTextLabel = "Descrizione: "
                   }
                   //11) Каталанский = ca
                   else if currentPhoneLangID == "ca"{
                   productDescriptionBoldTextLabel = "Descripció: "
                   }
                   //12) Китайский = zh
                   else if currentPhoneLangID == "zh"{
                   productDescriptionBoldTextLabel = "描述 "
                   }
                   //13) Корейский = ko
                   else if currentPhoneLangID == "ko"{
                   productDescriptionBoldTextLabel = "기술 "
                   }
                   //14) Малайский = ms
                   else if currentPhoneLangID == "ms"{
                   productDescriptionBoldTextLabel = "Penerangan: "
                   }
                   //15) Немецкий = de
                   else if currentPhoneLangID == "de"{
                   productDescriptionBoldTextLabel = "Beschreibung: "
                   }
                   //16) Нидерландский = nl
                   else if currentPhoneLangID == "nl"{
                   productDescriptionBoldTextLabel = "Omschrijving: "
                   }
                   //17) Норвежский = nb
                   else if currentPhoneLangID == "nb"{
                   productDescriptionBoldTextLabel = "Beskrivelse: "
                   }
                   //18) Польский = pl
                   else if currentPhoneLangID == "pl"{
                   productDescriptionBoldTextLabel = "Opis: "
                   }
                   //19) Португальский = pt
                   else if currentPhoneLangID == "pt"{
                   productDescriptionBoldTextLabel = "Descrição: "
                   }
                   //20) Румынский = ro
                   else if currentPhoneLangID == "ro"{
                   productDescriptionBoldTextLabel = "Descriere: "
                   }
                   //21) Русский = ru
                   
                   //22) Словацкий = sk
                   else if currentPhoneLangID == "sk"{
                   productDescriptionBoldTextLabel = "Popis: "
                   }
                   //23) Тайский = th
                   else if currentPhoneLangID == "th"{
                   productDescriptionBoldTextLabel = "คำอธิบาย "
                   }
                   //24) Турецкий = tr
                   else if currentPhoneLangID == "tr"{
                   productDescriptionBoldTextLabel = "Açıklama: "
                   }
                   //25) Украинский = uk
                   else if currentPhoneLangID == "uk"{
                   productDescriptionBoldTextLabel = "Опис: "
                   }
                   //26) Финский = fi
                   else if currentPhoneLangID == "fi"{
                   productDescriptionBoldTextLabel = "Kuvaus: "
                   }
                   //27) Французский = fr
                   else if currentPhoneLangID == "fr"{
                   productDescriptionBoldTextLabel = "La description: "
                   }
                   //28) Хинди = hi
                   else if currentPhoneLangID == "hi"{
                   productDescriptionBoldTextLabel = "विवरण "
                   }
                   //29) Хорватский = hr
                   else if currentPhoneLangID == "hr"{
                   productDescriptionBoldTextLabel = "Opis: "
                   }
                   //30) Чешский = cs
                   else if currentPhoneLangID == "cs"{
                   productDescriptionBoldTextLabel = "Popis: "
                   }
                   //31) Шведский = sv
                   else if currentPhoneLangID == "sv"{
                   productDescriptionBoldTextLabel = "Beskrivning: "
                   }
                   //32) Японский = ja
                   else if currentPhoneLangID == "ja"{
                   productDescriptionBoldTextLabel = "説明 "
                   }
            
            let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
            let attributedString = NSMutableAttributedString(string: productDescriptionBoldTextLabel, attributes:attrs)
            
            //v.3.3
            //делаем часть label нормальным и сразу локализуем
            var productDescriptionNormalTextLabel = "Betting Tips"
              
                       //локализуем
                       if currentPhoneLangID == "ru" {
                       productDescriptionNormalTextLabel = "Спортивные Прогнозы"
                       }
                       //2) Арабский = ar
                       else if currentPhoneLangID == "ar"{
                       productDescriptionNormalTextLabel = " نصائح الرهان"
                       }
                       //3) Венгерский = hu
                       else if currentPhoneLangID == "hu"{
                       productDescriptionNormalTextLabel = "Fogadási tippek"
                       }
                       //4) Вьетнамский = vi
                       else if currentPhoneLangID == "vi"{
                       productDescriptionNormalTextLabel = "Mẹo cá cược"
                       }
                       //5) Греческий = el
                       else if currentPhoneLangID == "el"{
                       productDescriptionNormalTextLabel = "Συμβουλές στοιχημάτων"
                       }
                       //6) Датский = da
                       else if currentPhoneLangID == "da"{
                       productDescriptionNormalTextLabel = "Sportsforudsigelser"
                       }
                       //7) Иврит = he
                       else if currentPhoneLangID == "he"{
                       productDescriptionNormalTextLabel = "תחזיות ספורט"
                       }
                       //8) Индонезийский = id
                       else if currentPhoneLangID == "id"{
                       productDescriptionNormalTextLabel = "Prediksi Olahraga"
                       }
                       //9) Испанский = es
                       else if currentPhoneLangID == "es"{
                       productDescriptionNormalTextLabel = "Consejos de apuestas"
                       }
                       //10) Итальянский = it
                       else if currentPhoneLangID == "it"{
                       productDescriptionNormalTextLabel = "Suggerimenti per le scommesse"
                       }
                       //11) Каталанский = ca
                       else if currentPhoneLangID == "ca"{
                       productDescriptionNormalTextLabel = "Consells d'apostes"
                       }
                       //12) Китайский = zh
                       else if currentPhoneLangID == "zh"{
                       productDescriptionNormalTextLabel = "投注技巧"
                       }
                       //13) Корейский = ko
                       else if currentPhoneLangID == "ko"{
                       productDescriptionNormalTextLabel = "스포츠 예측"
                       }
                       //14) Малайский = ms
                       else if currentPhoneLangID == "ms"{
                       productDescriptionNormalTextLabel = "Ramalan Sukan"
                       }
                       //15) Немецкий = de
                       else if currentPhoneLangID == "de"{
                       productDescriptionNormalTextLabel = "Wett-Tipps"
                       }
                       //16) Нидерландский = nl
                       else if currentPhoneLangID == "nl"{
                       productDescriptionNormalTextLabel = "Tips voor weddenschappen"
                       }
                       //17) Норвежский = nb
                       else if currentPhoneLangID == "nb"{
                       productDescriptionNormalTextLabel = "Sportsprognoser"
                       }
                       //18) Польский = pl
                       else if currentPhoneLangID == "pl"{
                       productDescriptionNormalTextLabel = "Typy bukmacherskie"
                       }
                       //19) Португальский = pt
                       else if currentPhoneLangID == "pt"{
                       productDescriptionNormalTextLabel = "Dicas de apostas"
                       }
                       //20) Румынский = ro
                       else if currentPhoneLangID == "ro"{
                       productDescriptionNormalTextLabel = "Ponturi de pariuri"
                       }
                       //21) Русский = ru
                       
                       //22) Словацкий = sk
                       else if currentPhoneLangID == "sk"{
                       productDescriptionNormalTextLabel = "Stávkové tipy"
                       }
                       //23) Тайский = th
                       else if currentPhoneLangID == "th"{
                       productDescriptionNormalTextLabel = "เคล็ดลับการเดิมพัน"
                       }
                       //24) Турецкий = tr
                       else if currentPhoneLangID == "tr"{
                       productDescriptionNormalTextLabel = "Bahis ipuçları"
                       }
                       //25) Украинский = uk
                       else if currentPhoneLangID == "uk"{
                       productDescriptionNormalTextLabel = "Спортивні прогнози"
                       }
                       //26) Финский = fi
                       else if currentPhoneLangID == "fi"{
                       productDescriptionNormalTextLabel = "Vedonlyöntivihjeitä"
                       }
                       //27) Французский = fr
                       else if currentPhoneLangID == "fr"{
                       productDescriptionNormalTextLabel = "Conseils de paris"
                       }
                       //28) Хинди = hi
                       else if currentPhoneLangID == "hi"{
                       productDescriptionNormalTextLabel = "सट्टेबाजी की युक्तियाँ"
                       }
                       //29) Хорватский = hr
                       else if currentPhoneLangID == "hr"{
                       productDescriptionNormalTextLabel = "Savjeti za klađenje"
                       }
                       //30) Чешский = cs
                       else if currentPhoneLangID == "cs"{
                       productDescriptionNormalTextLabel = "Sázkové tipy"
                       }
                       //31) Шведский = sv
                       else if currentPhoneLangID == "sv"{
                       productDescriptionNormalTextLabel = "Betting Tips"
                       }
                       //32) Японский = ja
                       else if currentPhoneLangID == "ja"{
                       productDescriptionNormalTextLabel = "賭けのヒント"
                       }
            
            let normalString = NSMutableAttributedString(string: productDescriptionNormalTextLabel)
            //Соединяем 2 части текста:
            attributedString.append(normalString)
            //выводим текст в label
            productDescriptionLabel.attributedText = attributedString
            
            
            
            //v.3.3 - productTrialDurationLabel и сразу локализуем
            //делаем часть label жирным и сразу локализуем
            var productTrialDurationBoldTextLabel  = "Free of charge: "
                
                   if currentPhoneLangID == "ru" {
                   productTrialDurationBoldTextLabel = "Бесплатный период: "
                   }
                   //2) Арабский = ar
                   else if currentPhoneLangID == "ar"{
                   productTrialDurationBoldTextLabel = "شحن مجاني "
                   }
                   //3) Венгерский = hu
                   else if currentPhoneLangID == "hu"{
                   productTrialDurationBoldTextLabel = "Díjmentes: "
                   }
                   //4) Вьетнамский = vi
                   else if currentPhoneLangID == "vi"{
                   productTrialDurationBoldTextLabel = "Miễn phí: "
                   }
                   //5) Греческий = el
                   else if currentPhoneLangID == "el"{
                   productTrialDurationBoldTextLabel = "Δωρεάν: "
                   }
                   //6) Датский = da
                   else if currentPhoneLangID == "da"{
                   productTrialDurationBoldTextLabel = "Gratis: "
                   }
                   //7) Иврит = he
                   else if currentPhoneLangID == "he"{
                   productTrialDurationBoldTextLabel = "בחינם "
                   }
                   //8) Индонезийский = id
                   else if currentPhoneLangID == "id"{
                   productTrialDurationBoldTextLabel = "Gratis: "
                   }
                   //9) Испанский = es
                   else if currentPhoneLangID == "es"{
                   productTrialDurationBoldTextLabel = "Gratis: "
                   }
                   //10) Итальянский = it
                   else if currentPhoneLangID == "it"{
                   productTrialDurationBoldTextLabel = "Gratuito: "
                   }
                   //11) Каталанский = ca
                   else if currentPhoneLangID == "ca"{
                   productTrialDurationBoldTextLabel = "Gratis: "
                   }
                   //12) Китайский = zh
                   else if currentPhoneLangID == "zh"{
                   productTrialDurationBoldTextLabel = "免費的 "
                   }
                   //13) Корейский = ko
                   else if currentPhoneLangID == "ko"{
                   productTrialDurationBoldTextLabel = "무료로 "
                   }
                   //14) Малайский = ms
                   else if currentPhoneLangID == "ms"{
                   productTrialDurationBoldTextLabel = "Percuma: "
                   }
                   //15) Немецкий = de
                   else if currentPhoneLangID == "de"{
                   productTrialDurationBoldTextLabel = "Kostenlos: "
                   }
                   //16) Нидерландский = nl
                   else if currentPhoneLangID == "nl"{
                   productTrialDurationBoldTextLabel = "Gratis: "
                   }
                   //17) Норвежский = nb
                   else if currentPhoneLangID == "nb"{
                   productTrialDurationBoldTextLabel = "Gratis: "
                   }
                   //18) Польский = pl
                   else if currentPhoneLangID == "pl"{
                   productTrialDurationBoldTextLabel = "Darmo: "
                   }
                   //19) Португальский = pt
                   else if currentPhoneLangID == "pt"{
                   productTrialDurationBoldTextLabel = "Grátis: "
                   }
                   //20) Румынский = ro
                   else if currentPhoneLangID == "ro"{
                   productTrialDurationBoldTextLabel = "Gratuit: "
                   }
                   //21) Русский = ru
                   
                   //22) Словацкий = sk
                   else if currentPhoneLangID == "sk"{
                   productTrialDurationBoldTextLabel = "Zadarmo: "
                   }
                   //23) Тайский = th
                   else if currentPhoneLangID == "th"{
                   productTrialDurationBoldTextLabel = "ไม่คิดเงิน "
                   }
                   //24) Турецкий = tr
                   else if currentPhoneLangID == "tr"{
                   productTrialDurationBoldTextLabel = "Ücretsiz: "
                   }
                   //25) Украинский = uk
                   else if currentPhoneLangID == "uk"{
                   productTrialDurationBoldTextLabel = "Безкоштовно: "
                   }
                   //26) Финский = fi
                   else if currentPhoneLangID == "fi"{
                   productTrialDurationBoldTextLabel = "Ilmainen: "
                   }
                   //27) Французский = fr
                   else if currentPhoneLangID == "fr"{
                   productTrialDurationBoldTextLabel = "Gratuit: "
                   }
                   //28) Хинди = hi
                   else if currentPhoneLangID == "hi"{
                   productTrialDurationBoldTextLabel = "निःशुल्क "
                   }
                   //29) Хорватский = hr
                   else if currentPhoneLangID == "hr"{
                   productTrialDurationBoldTextLabel = "Besplatno: "
                   }
                   //30) Чешский = cs
                   else if currentPhoneLangID == "cs"{
                   productTrialDurationBoldTextLabel = "Zdarma: "
                   }
                   //31) Шведский = sv
                   else if currentPhoneLangID == "sv"{
                   productTrialDurationBoldTextLabel = "Gratis: "
                   }
                   //32) Японский = ja
                   else if currentPhoneLangID == "ja"{
                   productTrialDurationBoldTextLabel = "無料で "
                   }
            
            let attrs1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
            let attributedString1 = NSMutableAttributedString(string: productTrialDurationBoldTextLabel, attributes:attrs1)
            //v.3.3
            //делаем часть label нормальным и сразу локализуем
            var productTrialDurationNormalTextLabel = "30 days"
                
                   if currentPhoneLangID == "ru" {
                   productTrialDurationNormalTextLabel = "30 дней"
                   }
                   //2) Арабский = ar
                   else if currentPhoneLangID == "ar"{
                   productTrialDurationNormalTextLabel = "30 يوما"
                   }
                   //3) Венгерский = hu
                   else if currentPhoneLangID == "hu"{
                   productTrialDurationNormalTextLabel = "30 nap"
                   }
                   //4) Вьетнамский = vi
                   else if currentPhoneLangID == "vi"{
                   productTrialDurationNormalTextLabel = "30 ngày"
                   }
                   //5) Греческий = el
                   else if currentPhoneLangID == "el"{
                   productTrialDurationNormalTextLabel = "30 μέρες"
                   }
                   //6) Датский = da
                   else if currentPhoneLangID == "da"{
                   productTrialDurationNormalTextLabel = "30 dage"
                   }
                   //7) Иврит = he
                   else if currentPhoneLangID == "he"{
                   productTrialDurationNormalTextLabel = "30 ימים"
                   }
                   //8) Индонезийский = id
                   else if currentPhoneLangID == "id"{
                   productTrialDurationNormalTextLabel = "30 hari"
                   }
                   //9) Испанский = es
                   else if currentPhoneLangID == "es"{
                   productTrialDurationNormalTextLabel = "30 dias"
                   }
                   //10) Итальянский = it
                   else if currentPhoneLangID == "it"{
                   productTrialDurationNormalTextLabel = "30 giorni"
                   }
                   //11) Каталанский = ca
                   else if currentPhoneLangID == "ca"{
                   productTrialDurationNormalTextLabel = "30 dies"
                   }
                   //12) Китайский = zh
                   else if currentPhoneLangID == "zh"{
                   productTrialDurationNormalTextLabel = "30天"
                   }
                   //13) Корейский = ko
                   else if currentPhoneLangID == "ko"{
                   productTrialDurationNormalTextLabel = "30 일"
                   }
                   //14) Малайский = ms
                   else if currentPhoneLangID == "ms"{
                   productTrialDurationNormalTextLabel = "30 hari"
                   }
                   //15) Немецкий = de
                   else if currentPhoneLangID == "de"{
                   productTrialDurationNormalTextLabel = "30 Tage"
                   }
                   //16) Нидерландский = nl
                   else if currentPhoneLangID == "nl"{
                   productTrialDurationNormalTextLabel = "30 dagen"
                   }
                   //17) Норвежский = nb
                   else if currentPhoneLangID == "nb"{
                   productTrialDurationNormalTextLabel = "30 dager"
                   }
                   //18) Польский = pl
                   else if currentPhoneLangID == "pl"{
                   productTrialDurationNormalTextLabel = "30 dni"
                   }
                   //19) Португальский = pt
                   else if currentPhoneLangID == "pt"{
                   productTrialDurationNormalTextLabel = "30 dias"
                   }
                   //20) Румынский = ro
                   else if currentPhoneLangID == "ro"{
                   productTrialDurationNormalTextLabel = "30 de zile"
                   }
                   //21) Русский = ru
                   
                   //22) Словацкий = sk
                   else if currentPhoneLangID == "sk"{
                   productTrialDurationNormalTextLabel = "30 dní"
                   }
                   //23) Тайский = th
                   else if currentPhoneLangID == "th"{
                   productTrialDurationNormalTextLabel = "30 วัน"
                   }
                   //24) Турецкий = tr
                   else if currentPhoneLangID == "tr"{
                   productTrialDurationNormalTextLabel = "30 gün"
                   }
                   //25) Украинский = uk
                   else if currentPhoneLangID == "uk"{
                   productTrialDurationNormalTextLabel = "30 днів"
                   }
                   //26) Финский = fi
                   else if currentPhoneLangID == "fi"{
                   productTrialDurationNormalTextLabel = "30 päivää"
                   }
                   //27) Французский = fr
                   else if currentPhoneLangID == "fr"{
                   productTrialDurationNormalTextLabel = "30 jours"
                   }
                   //28) Хинди = hi
                   else if currentPhoneLangID == "hi"{
                   productTrialDurationNormalTextLabel = "तीस दिन"
                   }
                   //29) Хорватский = hr
                   else if currentPhoneLangID == "hr"{
                   productTrialDurationNormalTextLabel = "30 dana"
                   }
                   //30) Чешский = cs
                   else if currentPhoneLangID == "cs"{
                   productTrialDurationNormalTextLabel = "30 dní"
                   }
                   //31) Шведский = sv
                   else if currentPhoneLangID == "sv"{
                   productTrialDurationNormalTextLabel = "30 dagar"
                   }
                   //32) Японский = ja
                   else if currentPhoneLangID == "ja"{
                   productTrialDurationNormalTextLabel = "30日"
                   }
            
            let normalString1 = NSMutableAttributedString(string: productTrialDurationNormalTextLabel)
            //Соединяем 2 части текста:
            attributedString1.append(normalString1)
            //выводим текст в label
            productTrialDurationLabel.attributedText = attributedString1
            
            
            
            
        }
    }

    //конец функции reloadUI()
    
  
    
    //v.3.3 - покупка продукта. Используем в кнопке "subscribeButton"
    @IBAction func subscribeButton(_ sender: Any) {
        // when purchase button tapped
        
        //спиннер появляется, текст пропадает
        activityIndicatorButtonSubscribe.startAnimating()
        //subscribeButtonOutlet.setTitle("Text", for: .normal)
        subscribeButtonOutlet.setTitleColor(UIColor.clear, for: .normal)
        
           if let product = Apphud.product(productIdentifier: "com.iloveapps.bettingadvisor.mysubscription") {
               Apphud.purchase(product) { result in
                   if Apphud.hasActiveSubscription() {
                       print("подписка оформлена")
                    self.animateOut(desiredView: self.popupView) //убираем Pop-Up View с анимацией
                    self.animateOut(desiredView: self.blurView)  //убираем Pop-Up View с анимацией
                    self.buyButtonOutlet.isHidden = true
                    self.bettingTipsButton.isHidden = false
                    self.activityIndicatorButtonSubscribe.stopAnimating()
                    self.subscribeButtonOutlet.setTitleColor(UIColor.white, for: .normal)
                    
                   } else {
                       print("покупка отменена")
                    
                    //спиннер пропадает, текст на кнопке "Subscribe" появляется
                    self.activityIndicatorButtonSubscribe.stopAnimating()
                    self.subscribeButtonOutlet.setTitleColor(UIColor.white, for: .normal)
                   }
               }
           } else {
              print("продукты еще не загрузились из App Store, покупка невозможна")
          }
    }
    
    
    
    
    
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popupView: UIView!
    
    
    //v.3.3 - аутлеты labels окна подписки
    @IBOutlet weak var subscribeLabelPopUpView: UILabel!
    @IBOutlet weak var subscriptionPriceLabelOutlet: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productTrialDurationLabel: UILabel!
    @IBOutlet weak var aboutSubscriptionTitleLabel: UILabel!
    @IBOutlet weak var aboutSubscriptionTextLabel: UILabel!
    
    
    
    
    
    
    //v.3.3 - activityIndocator кнопки Subscribe
    @IBOutlet weak var activityIndicatorButtonSubscribe: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicatorPopupView: UIActivityIndicatorView!
    
    
    //v.3.3 - outlet кнопки buyButton
    @IBOutlet weak var buyButtonOutlet: UIButton!
    @IBOutlet weak var subscribeButtonOutlet: UIButton!
    @IBOutlet weak var restorePurchasesButtonOutlet: UIButton!
    @IBOutlet weak var termsOfUseButtonOutlet: UIButton!
    @IBOutlet weak var privacyPolicyButtonOutlet: UIButton!
    
    
    
    

    @IBOutlet weak var bettingTipsButton: UIButton!
    @IBOutlet weak var statisticsButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var aboutUsButton: UIButton!
    

    //аутлет label вверху на главном экране = Ваш персональный помощник в мире спортивного беттинга:
    @IBOutlet weak var yourPersonalSportsBettingAdvisorLabel: UILabel!
    //аутлет iLoveBets label
    @IBOutlet weak var iLoveBetsLabel: UILabel!
    //аутлет label внизу на главном экране = Спортивные прогнозы:
    @IBOutlet weak var sportBetsLabel: UILabel!
    
    
    
    
    //аутлет верхнего,левого,правого Constraint ^ для label = Ваш персональный помощник в мире спортивного беттинга:
    @IBOutlet weak var upConstraintYourPersonalSportsBettingAdvisor: NSLayoutConstraint!
    @IBOutlet weak var leftConstraintYourPersonalSportsBettingAdvisor: NSLayoutConstraint!
    @IBOutlet weak var rightConstraintYourPersonalSportsBettingAdvisor: NSLayoutConstraint!
    
    
    //аутлет верхнего Constraint ^ для кнопки bettingTipsButton:
    @IBOutlet weak var bettingTipsButtonTopConstraint: NSLayoutConstraint!
    //аутлет верхнего Constraint ^ для кнопки bettingTipsButton:
    @IBOutlet weak var statisticsButtonTopConstraint: NSLayoutConstraint!
    
    
    //v.3.3 аутлет верхнего Constraint ^ для кнопки buyButton
    @IBOutlet weak var buyButtonTopConstraint: NSLayoutConstraint!
    
    
    
    //аутлет левого Constraint для нижнего label "Спортивные прогнозы" или "SportBettingTips"
    @IBOutlet weak var sportBetsLabelLeftConstraint: NSLayoutConstraint!
    //аутлет правого Constraint для нижнего label "Спортивные прогнозы" или "SportBettingTips"
    @IBOutlet weak var sportBetsLabelRightConstraint: NSLayoutConstraint!
    //аутлет нижнего Constraint для label "Спортивные прогнозы" или "SportBettingTips"
    @IBOutlet weak var sportBetsLabelBottomConstraint: NSLayoutConstraint!
    
    
    
    //v.3.3 - аутлеты Constraint окна подписки
    @IBOutlet weak var subscriptionPriceLabelUpConstraint: NSLayoutConstraint!
    @IBOutlet weak var productDescriptionLabelUpConstraint: NSLayoutConstraint!
    @IBOutlet weak var productTrialDurationLabelUpConstraint: NSLayoutConstraint!
    @IBOutlet weak var restorePurchasesButtonUpConstraint: NSLayoutConstraint!
    @IBOutlet weak var aboutSubscriptionTitleUpConstraint: NSLayoutConstraint!
    @IBOutlet weak var subscribeLabelPopUpViewUpConstraint: NSLayoutConstraint!
    
    
    
    
    
    //аутлет высоты кнопок
    @IBOutlet weak var bettingTipsButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var statisticsButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var chatButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var emailButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var helpButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var aboutUsButtonHeight: NSLayoutConstraint!
    
    //top constraint для iLoveBets
    @IBOutlet weak var iLoveBetsTopConstraints: NSLayoutConstraint!
    
    
    
    //темный StatusBar на главном экране
 //   override func viewDidAppear(_ animated: Bool) {
      // 1
  //    let nav = self.navigationController?.navigationBar
      // 2
 //     nav?.barStyle = UIBarStyle.black
 //   }
    
    
   // скрывать navigation bar (или показывать)
   override func viewWillAppear(_ animated: Bool) {
    
    
    //v.3.3 - проверка активна подписка или нет, если приложение запущено !!!!!!!!!!!!!!!-удалить, если не сработает
    if Apphud.hasActiveSubscription() {
        //тк после переустановки приложения можно не нажимать на restorePurchase, премиум контент сразу разблокировался
        //buyButtonOutlet.isHidden = true
        //bettingTipsButton.isHidden = false
        print("!Есть активная подписка!")
    } else {
        print("!Подписка закончилась!")
        buyButtonOutlet.isHidden = false
        bettingTipsButton.isHidden = true
        activityIndicatorPopupView.startAnimating()
        subscribeLabelPopUpView.isHidden = true
        subscriptionPriceLabelOutlet.isHidden = true
        productDescriptionLabel.isHidden = true
        productTrialDurationLabel.isHidden = true
        restorePurchasesButtonOutlet.isHidden = true
        aboutSubscriptionTitleLabel.isHidden = true
        aboutSubscriptionTextLabel.isHidden = true
        termsOfUseButtonOutlet.isHidden = true
        privacyPolicyButtonOutlet.isHidden = true
        subscribeButtonOutlet.isHidden = true
    }
    
    
    
    //v.3.3 - !!!!!!!!!!!проверка подписки при появлении главного экрана!!!!!!!!!!!!!!!
 /*   if Apphud.hasActiveSubscription() {
        buyButtonOutlet.isHidden = true
        bettingTipsButton.isHidden = false
        print("!Есть активная подписка!")
    } else {
        print("!Подписка закончилась!")
        buyButtonOutlet.isHidden = false
        bettingTipsButton.isHidden = true
    }
 */
    
    //=========================================
   /* if Apphud.products() != nil {
        reloadUI()
        buyButtonOutlet.isEnabled = true //из-за задержки загрузки продуктов делаем кнопку активной только после загрузки продуктов
        buyButtonOutlet.backgroundColor = UIColor.green
        } else {
        Apphud.refreshStoreKitProducts { products in
        self.reloadUI()
            self.buyButtonOutlet.isEnabled = true //из-за задержки загрузки продуктов делаем кнопку активной только после загрузки продуктов
            self.buyButtonOutlet.backgroundColor = UIColor.green
        }
    } else if
     Apphud.products() = nil
     buyButtonOutlet.isEnabled = false ???
 */
    
    //==================================
    
    
    
    
    
    
    
    
    //v.3.2 - раскомментировано. чинит проблему с NavigationBar!!!!!!
    //v.2.3 комментируем
    self.navigationController?.isNavigationBarHidden = true
    
    
    
    //v.3.2 - закомментировано на ViewController - чинит проблему с исчезновением NavigationBar!!!
    //v.2.3 для анимированного удаления navigationBar
    /*
        self.navigationController?.navigationBar.alpha = 1
    UIView.animate(withDuration: 0.3, animations: {
        //v.2.3 - строка ниже добавляем анимацию, чтобы увести navigationBar по оси "y" в -200
        self.navigationController?.navigationBar.transform = CGAffineTransform(translationX: 0, y: -200)
        self.navigationController?.navigationBar.alpha = 0 //убираем в ноль за 0.3 секунды
    }) { (bool) in
        self.navigationController?.isNavigationBarHidden = true
        }
     */
    
    
    
    } //конец функции viewWillAppear
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //v.3.3 - загружаем продукты
        if Apphud.products() != nil {
            reloadUI()
            activityIndicatorPopupView.stopAnimating()
            subscribeLabelPopUpView.isHidden = false
            subscriptionPriceLabelOutlet.isHidden = false
            productDescriptionLabel.isHidden = false
            productTrialDurationLabel.isHidden = false
            restorePurchasesButtonOutlet.isHidden = false
            aboutSubscriptionTitleLabel.isHidden = false
            aboutSubscriptionTextLabel.isHidden = false
            termsOfUseButtonOutlet.isHidden = false
            privacyPolicyButtonOutlet.isHidden = false
            subscribeButtonOutlet.isHidden = false
                //buyButtonOutlet.isEnabled = true //из-за задержки загрузки продуктов делаем кнопку активной только после загрузки продуктов и меняем цвет
            //buyButtonOutlet.backgroundColor = UIColor.green
           
        } else {
            
            Apphud.refreshStoreKitProducts { products in
            self.reloadUI()
            self.activityIndicatorPopupView.stopAnimating()
            self.subscribeLabelPopUpView.isHidden = false
            self.subscriptionPriceLabelOutlet.isHidden = false
            self.productDescriptionLabel.isHidden = false
            self.productTrialDurationLabel.isHidden = false
            self.restorePurchasesButtonOutlet.isHidden = false
            self.aboutSubscriptionTitleLabel.isHidden = false
            self.aboutSubscriptionTextLabel.isHidden = false
            self.termsOfUseButtonOutlet.isHidden = false
            self.privacyPolicyButtonOutlet.isHidden = false
            self.subscribeButtonOutlet.isHidden = false
                
                //self.buyButtonOutlet.isEnabled = true //из-за задержки загрузки продуктов делаем кнопку активной только после загрузки продуктов и меняем цвет
                //self.buyButtonOutlet.backgroundColor = UIColor.green
            }
        }
        
        if Apphud.hasActiveSubscription() {
            buyButtonOutlet.isHidden = true
            bettingTipsButton.isHidden = false
            print("!Есть активная подписка!")
        } else {
            print("!Подписка закончилась!")
            buyButtonOutlet.isHidden = false
            bettingTipsButton.isHidden = true
        }
        
    
     
        
        
        //v.3.3 добавляем blur-эффект при нажатии кнопки buyButton
        //устанавливаем размер blur view равным всему viewController
        blurView.bounds = self.view.bounds
        
        //x - справа, y - снизу. определяем границы popupView
        //width - ширина всплывающего окна. устанавливаем равной 90% от ширины ViewController
        //height - высота всплывающего окна. устанавливаем равной 80% от высоты ViewController
        popupView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.95, height: self.view.bounds.height * 0.9)
        
        
        
     
    //v2.3 для анмированного navigationBar
     self.navigationController?.isNavigationBarHidden = true
        
        
        //снять комментарий после скриншотов
         
        //v2.3 комментируем
        //показать язык локализации и вывести в консоль
          /*
        let locale = NSLocale.current
        let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
        print("Текущий язык long телефон-Регион = ",currentLangID)
        var currentPhoneLangID = currentLangID
            // symbols.insert("!", at: symbols.endIndex)
            // print("измененный_Текущий язык = ",symbols)
        //https://swiftbook.ru/content/languageguide/strings-and-characters/
        //от полученного значения "языктелефона-Регион", вычитаем 3 символа, чтобы вместо "ru-Us" и тд, оставалось только "ru", то есть, проверялся только русский язык телефона, а регион не учитывался
        let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
        currentPhoneLangID.removeSubrange(range)
        print("Только текущий язык телефона, без региона = ",currentPhoneLangID)
        */
    
       
        //v2.3
        print("Текущий язык телефон-Регион = ",currentPhoneLangID) //выводим в консоль язык телефона
        
        //1) Английский США = en
        //2) Арабский = ar
        //3) Венгерский = hu
        //4) Вьетнамский = vi
        //5) Греческий = el
        //6) Датский = da
        //7) Иврит = he
        //8) Индонезийский = id
        //9) Испанский = es
        //10) Итальянский = it
        //11) Каталанский = ca
        //12) Китайский =zh
        //13) Корейский = ko
        //14) Малайский = ms
        //15) Немецкий = de
        //16) Нидерландский = nl
        //17) Норвежский = nb
        //18) Польский = pl
        //19) Португальский = pt
        //20) Румынский = ro
        //21) Русский = ru
        //22) Словацкий = sk
        //23) Тайский = th
        //24) Турецкий = tr
        //25) Украинский = uk
        //26) Финский = fi
        //27) Французский = fr
        //28) Хинди = hi
        //29) Хорватский = hr
        //30) Чешский = cs
        //31) Шведский = sv
        //32) Японский = ja
    
        
        
        //Локализуем главный вид приложения!!!
        if currentPhoneLangID == "ru" {
            //yourPersonalSportsBettingAdvisorLabel.text = "ВАШ ПЕРСОНАЛЬНЫЙ ПОМОЩНИК В МИРЕ СПОРТИВНОГО бЕТТИНГА"
            yourPersonalSportsBettingAdvisorLabel.text = "Ваш персональный помощник в мире спортивного беттинга"
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
            sportBetsLabel.text = "Спортивные прогнозы"
            sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            
            
            
            
            
            
            
            //v.3.3 - Описание товара при подписке:
            //productDescriptionLabel.attributedText = attributedString
            
            
                    //Заменяем картинки из Assets.xcassets на кнопках, если русский язык
                    let button1 = UIImage(named: "ru-1")
                    bettingTipsButton.setImage(button1, for: UIControl.State.normal)
                    
                    let button2 = UIImage(named: "ru-2")
                    statisticsButton.setImage(button2, for: UIControl.State.normal)
                    
                    let button3 = UIImage(named: "ru-3")
                    chatButton.setImage(button3, for: UIControl.State.normal)
                    
                    let button4 = UIImage(named: "ru-4")
                    emailButton.setImage(button4, for: UIControl.State.normal)
                    
                    let button5 = UIImage(named: "ru-5")
                    helpButton.setImage(button5, for: UIControl.State.normal)

                    let button6 = UIImage(named: "ru-6")
                    aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        
        //v.3.2
        //2) Арабский = ar
        else if currentPhoneLangID == "ar"{
                yourPersonalSportsBettingAdvisorLabel.text = "مرشد الرياضة الرياضي الخاص بك"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "نصائح الرهان الرياضي"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "ar-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
                
            let button2 = UIImage(named: "ar-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
                
            let button3 = UIImage(named: "ar-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
                
            let button4 = UIImage(named: "ar-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
                
            let button5 = UIImage(named: "ar-5")
                helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "ar-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
            
            
        }
        //3) Венгерский = hu
        else if currentPhoneLangID == "hu"{
                yourPersonalSportsBettingAdvisorLabel.text = "Az Ön személyes sportfogadási tanácsadója"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Sportfogadási tippek"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "hu-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "hu-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "hu-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "hu-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "hu-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "hu-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //4) Вьетнамский = vi
        else if currentPhoneLangID == "vi"{
                yourPersonalSportsBettingAdvisorLabel.text = "Cố vấn cá cược thể thao cá nhân của bạn"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Mẹo cá cược thể thao"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "vi-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "vi-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "vi-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "vi-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "vi-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "vi-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
            
        }
        //5) Греческий = el
        else if currentPhoneLangID == "el"{
                yourPersonalSportsBettingAdvisorLabel.text = "Ο προσωπικός σας σύμβουλος αθλητικών στοιχημάτων"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 20)
                sportBetsLabel.text = "Συμβουλές για αθλητικά στοιχήματα"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "el-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "el-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "el-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "el-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "el-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "el-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //6) Датский = da
        else if currentPhoneLangID == "da"{
                yourPersonalSportsBettingAdvisorLabel.text = "Din personlige sportsvæddelsesrådgiver"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Tips til sportsspil"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "da-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "da-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "da-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "da-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "da-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "da-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //7) Иврит = he
        else if currentPhoneLangID == "he"{
                yourPersonalSportsBettingAdvisorLabel.text = "יועץ ההימורים האישי שלך"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "טיפים להימורי ספורט"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "he-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "he-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "he-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "he-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "he-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "he-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //8) Индонезийский = id
        else if currentPhoneLangID == "id"{
                yourPersonalSportsBettingAdvisorLabel.text = "Penasihat Taruhan Olahraga Pribadi Anda"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Tips Taruhan Olahraga"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "id-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "id-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "id-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "id-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "id-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "id-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //9) Испанский = es
        else if currentPhoneLangID == "es"{
                yourPersonalSportsBettingAdvisorLabel.text = "Su asesor personal de apuestas deportivas"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Consejos de apuestas deportivas"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "es-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "es-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "es-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "es-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "es-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "es-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //10) Итальянский = it
        else if currentPhoneLangID == "it"{
                yourPersonalSportsBettingAdvisorLabel.text = "Il tuo consulente di scommesse sportive personali"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Suggerimenti per le scommesse sportive"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "it-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "it-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "it-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "it-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "it-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "it-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //11) Каталанский = ca
        else if currentPhoneLangID == "ca"{
                yourPersonalSportsBettingAdvisorLabel.text = "El vostre assessor d'apostes personals d'esports"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Consells d'apostes esportives"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "ca-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "ca-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "ca-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "ca-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "ca-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "ca-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //12) Китайский = zh
        else if currentPhoneLangID == "zh"{
                yourPersonalSportsBettingAdvisorLabel.text = "您的个人体育博彩顾问"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "体育博彩技巧"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "zh-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "zh-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "zh-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "zh-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "zh-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "zh-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //13) Корейский = ko
        else if currentPhoneLangID == "ko"{
                yourPersonalSportsBettingAdvisorLabel.text = "개인 스포츠 베팅 어드바이저"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "스포츠 베팅 팁"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "ko-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "ko-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "ko-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "ko-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "ko-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "ko-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //14) Малайский = ms
        else if currentPhoneLangID == "ms"{
                yourPersonalSportsBettingAdvisorLabel.text = "Penasihat Pertaruhan Sukan Peribadi anda"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Petua Pertaruhan Sukan"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "ms-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "ms-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "ms-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "ms-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "ms-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "ms-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //15) Немецкий = de
        else if currentPhoneLangID == "de"{
                yourPersonalSportsBettingAdvisorLabel.text = "Ihr persönlicher Sportwettenberater"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Sportwetten Tipps"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "de-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "de-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "de-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "de-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "de-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "de-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //16) Нидерландский = nl
        else if currentPhoneLangID == "nl"{
                yourPersonalSportsBettingAdvisorLabel.text = "Uw persoonlijke adviseur voor sportweddenschappen"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Tips voor sportweddenschappen"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "nl-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "nl-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "nl-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "nl-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "nl-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "nl-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //17) Норвежский = nb
        else if currentPhoneLangID == "nb"{
                yourPersonalSportsBettingAdvisorLabel.text = "Din personlige sportsrådgiver"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Tips om sportsspill"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "nb-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "nb-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "nb-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "nb-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "nb-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "nb-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //18) Польский = pl
        else if currentPhoneLangID == "pl"{
                yourPersonalSportsBettingAdvisorLabel.text = "Twój osobisty doradca bukmacherski"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Prognozy sportowe"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "pl-1")
             bettingTipsButton.setImage(button1, for: UIControl.State.normal)
             
             let button2 = UIImage(named: "pl-2")
             statisticsButton.setImage(button2, for: UIControl.State.normal)
             
             let button3 = UIImage(named: "pl-3")
             chatButton.setImage(button3, for: UIControl.State.normal)
             
             let button4 = UIImage(named: "pl-4")
             emailButton.setImage(button4, for: UIControl.State.normal)
             
             let button5 = UIImage(named: "pl-5")
             helpButton.setImage(button5, for: UIControl.State.normal)

             let button6 = UIImage(named: "pl-6")
             aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //19) Португальский = pt
        else if currentPhoneLangID == "pt"{
                yourPersonalSportsBettingAdvisorLabel.text = "O seu conselheiro pessoal de apostas desportivas"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Dicas de apostas esportivas"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "pt-1")
             bettingTipsButton.setImage(button1, for: UIControl.State.normal)
             
             let button2 = UIImage(named: "pt-2")
             statisticsButton.setImage(button2, for: UIControl.State.normal)
             
             let button3 = UIImage(named: "pt-3")
             chatButton.setImage(button3, for: UIControl.State.normal)
             
             let button4 = UIImage(named: "pt-4")
             emailButton.setImage(button4, for: UIControl.State.normal)
             
             let button5 = UIImage(named: "pt-5")
             helpButton.setImage(button5, for: UIControl.State.normal)

             let button6 = UIImage(named: "pt-6")
             aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //20) Румынский = ro
        else if currentPhoneLangID == "ro"{
                yourPersonalSportsBettingAdvisorLabel.text = "Consilierul dvs. personal de pariuri sportive"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Sfaturi pentru pariuri sportive"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
             let button1 = UIImage(named: "ro-1")
             bettingTipsButton.setImage(button1, for: UIControl.State.normal)
             
             let button2 = UIImage(named: "ro-2")
             statisticsButton.setImage(button2, for: UIControl.State.normal)
             
             let button3 = UIImage(named: "ro-3")
             chatButton.setImage(button3, for: UIControl.State.normal)
             
             let button4 = UIImage(named: "ro-4")
             emailButton.setImage(button4, for: UIControl.State.normal)
             
             let button5 = UIImage(named: "ro-5")
             helpButton.setImage(button5, for: UIControl.State.normal)

             let button6 = UIImage(named: "ro-6")
             aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //21) Русский = ru
        
        //22) Словацкий = sk
        else if currentPhoneLangID == "sk"{
                yourPersonalSportsBettingAdvisorLabel.text = "Váš osobný športový poradca"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Tipy na športové stávky"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "sk-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "sk-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "sk-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "sk-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "sk-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "sk-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //23) Тайский = th
        else if currentPhoneLangID == "th"{
                yourPersonalSportsBettingAdvisorLabel.text = "ที่ปรึกษาการเดิมพันกีฬาส่วนบุคคลของคุณ"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "เคล็ดลับการเดิมพันกีฬา"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "th-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "th-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "th-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "th-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "th-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "th-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //24) Турецкий = tr
        else if currentPhoneLangID == "tr"{
                yourPersonalSportsBettingAdvisorLabel.text = "Kişisel Spor Bahis Danışmanınız"
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                sportBetsLabel.text = "Spor Bahis İpuçları"
                sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "tr-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "tr-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "tr-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "tr-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "tr-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "tr-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
        }
        //25) Украинский = uk
        else if currentPhoneLangID == "uk"{
                       yourPersonalSportsBettingAdvisorLabel.text = "Ваш особистий радник на спортивні ставки"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                       sportBetsLabel.text = "Спортивні прогнози"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "uk-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "uk-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "uk-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "uk-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "uk-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "uk-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
            
               }
        //26) Финский = fi
        else if currentPhoneLangID == "fi"{
                       yourPersonalSportsBettingAdvisorLabel.text = "Henkilökohtainen urheiluvedonlyöntisi"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                       sportBetsLabel.text = "Vedonlyönnin vinkkejä"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "fi-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "fi-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "fi-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "fi-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "fi-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "fi-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
               }
        //27) Французский = fr
        else if currentPhoneLangID == "fr"{
                       yourPersonalSportsBettingAdvisorLabel.text = "Votre conseiller en paris sportifs personnels"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                       sportBetsLabel.text = "Conseils de paris sportifs"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "fr-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "fr-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "fr-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "fr-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "fr-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "fr-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
               }
        //28) Хинди = hi
        else if currentPhoneLangID == "hi"{
                       yourPersonalSportsBettingAdvisorLabel.text = "आपकी व्यक्तिगत खेल सट्टेबाजी सलाहकार"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                       sportBetsLabel.text = "खेल सट्टेबाजी युक्तियाँ"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "hi-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "hi-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "hi-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "hi-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "hi-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "hi-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
               }
        //29) Хорватский = hr
        else if currentPhoneLangID == "hr"{
                       yourPersonalSportsBettingAdvisorLabel.text = "Vaš osobni savjetnik za klađenje u sportu"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                       sportBetsLabel.text = "Savjeti za klađenje u sportu"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "hr-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "hr-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "hr-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "hr-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "hr-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "hr-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
               }
        //30) Чешский = cs
        else if currentPhoneLangID == "cs"{
                       yourPersonalSportsBettingAdvisorLabel.text = "Váš osobní sportovní sázkový poradce"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                       sportBetsLabel.text = "Tipy pro sportovní sázení"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "cs-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "cs-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "cs-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "cs-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "cs-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "cs-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
               }
        //31) Шведский = sv
        else if currentPhoneLangID == "sv"{
                       yourPersonalSportsBettingAdvisorLabel.text = "Din personliga sportspelrådgivare"
                       yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 22)
                       sportBetsLabel.text = "Sportspel tips"
                       sportBetsLabel.font = UIFont.systemFont(ofSize: 22)
            let button1 = UIImage(named: "sv-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "sv-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "sv-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "sv-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "sv-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "sv-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
               }
        //32) Японский = ja
        else if currentPhoneLangID == "ja"{
                              yourPersonalSportsBettingAdvisorLabel.text = "あなたのパーソナルスポーツベッティングアドバイザー"
                              yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 14)
                              sportBetsLabel.text = "スポーツ賭博のヒント"
                              sportBetsLabel.font = UIFont.systemFont(ofSize: 18)
            let button1 = UIImage(named: "ja-1")
            bettingTipsButton.setImage(button1, for: UIControl.State.normal)
            
            let button2 = UIImage(named: "ja-2")
            statisticsButton.setImage(button2, for: UIControl.State.normal)
            
            let button3 = UIImage(named: "ja-3")
            chatButton.setImage(button3, for: UIControl.State.normal)
            
            let button4 = UIImage(named: "ja-4")
            emailButton.setImage(button4, for: UIControl.State.normal)
            
            let button5 = UIImage(named: "ja-5")
            helpButton.setImage(button5, for: UIControl.State.normal)

            let button6 = UIImage(named: "ja-6")
            aboutUsButton.setImage(button6, for: UIControl.State.normal)
                      }
        
        
        
        
        
        
        
        //белая рамка вокруг кнопок
        buyButtonOutlet.layer.borderWidth = 2
        buyButtonOutlet.layer.borderColor = UIColor.white.cgColor
        bettingTipsButton.layer.borderWidth = 2
        bettingTipsButton.layer.borderColor = UIColor.white.cgColor
        statisticsButton.layer.borderWidth = 2
        statisticsButton.layer.borderColor = UIColor.white.cgColor
        chatButton.layer.borderWidth = 2
        chatButton.layer.borderColor = UIColor.white.cgColor
        emailButton.layer.borderWidth = 2
        emailButton.layer.borderColor = UIColor.white.cgColor
        helpButton.layer.borderWidth = 2
        helpButton.layer.borderColor = UIColor.white.cgColor
        aboutUsButton.layer.borderWidth = 2
        aboutUsButton.layer.borderColor = UIColor.white.cgColor
      
    //высота экрана iphone SE = 568.0
    //высота экрана iphone 5S = 568.0
        
    //высота экрана iphone 6 = 667.0 (w=375)
    //высота экрана iphone 6S = 667.0
    //высота экрана iphone 7 = 667.0
    //высота экрана iphone 8 = 667.0
        
    //высота экрана iphone 6 Plus = 736.0
    //высота экрана iphone 6S Plus = 736.0
    //высота экрана iphone 7 Plus = 736.0
    //высота экрана iphone 8 Plus = 736.0
    
    //высота экрана iphone X = 812.0
    //высота экрана iphone 11 Pro = 812.0
        
    //высота экрана iphone 11 = 896.0
    //высота экрана iphone 11 Pro Max = 896.0
     
    //iPadPro 9.7, iPad Air2, iPad Air, iPad 5th gen
        // Высота экрана iPadPro 9.7 =  1024.0
        // Ширина экрана iPadPro 9. =  768.0
        
    //iPad Pro (12.9) 2nd, 4th gen
        //Высота экрана =  1366.0
        //Ширина экрана =  1024.0
        
    //iPad Pro (11) 2nd gen
        //Высота экрана =  1194.0
        //Ширина экрана =  834.0
        
    //iPadPro (10.5-inch), iPad Air (3rd gen)
        //Высота экрана =  1112.0
        //Ширина экрана =  834.0
        
    //iPad 7th gen
        //Высота экрана =  1080.0
        //Ширина экрана =  810.0
        
        
        //проверяем размер экрана!!!!
        let h = UIScreen.main.bounds.height
        let w = UIScreen.main.bounds.width
        print("//Высота экрана = ",h)
        print("//Ширина экрана = ",w)
        
       
        
        //если размер экрана не iphone 5S и SE, то показывать нижний label на главном экране = "Спортивные прогнозы"
        if UIScreen.main.bounds.height != 568 {
            sportBetsLabel.isHidden = false
        }
        
        //Для iPhone 5S, SE (с высотой экрана 568.0, width = 320) - настроены Constraints
        if UIScreen.main.bounds.height == 568 {
             //top Constraint для верхнего label
            //17
            upConstraintYourPersonalSportsBettingAdvisor.constant = 12
            //top Constraint для верхних двух кнопок "Прогнозы" и "Статистика". Тк все кнопки привязаны к верхним кнопкам, они автоматически подтягиваются
            //93
            bettingTipsButtonTopConstraint.constant = 80
            buyButtonTopConstraint.constant = 80
            statisticsButtonTopConstraint.constant = 80
            
            //v.3.3 - для окна подписки
            subscriptionPriceLabelUpConstraint.constant = 5
            productDescriptionLabelUpConstraint.constant = 5
            productTrialDurationLabelUpConstraint.constant = 5
            restorePurchasesButtonUpConstraint.constant = 5
            aboutSubscriptionTitleUpConstraint.constant = 5
            subscribeLabelPopUpViewUpConstraint.constant = 5
            subscriptionPriceLabelOutlet.font = UIFont.systemFont(ofSize: 16.0)
            productDescriptionLabel.font = UIFont.systemFont(ofSize: 16.0)
            productTrialDurationLabel.font = UIFont.systemFont(ofSize: 16.0)
            //делаем текст жирным в label
            subscribeLabelPopUpView.font = UIFont.boldSystemFont(ofSize: 18.0)

        }
        
        //Для iPhone 6, 6S, 7, 8, SE_2nd (с высотой экрана 667.0, width = 375) - настроены Constraints
        if UIScreen.main.bounds.height == 667 {
            
            //top Constraint для верхнего label
            upConstraintYourPersonalSportsBettingAdvisor.constant = 17
            
            //top Constraint для верхних двух кнопок "Прогнозы" и "Статистика". Тк все кнопки привязаны к верхним кнопкам, они автоматически подтягиваются
            bettingTipsButtonTopConstraint.constant = 88
            buyButtonTopConstraint.constant = 88
            statisticsButtonTopConstraint.constant = 88
        
            //левый и правый constraint нижнего Label = Спортивные прогнозы
            sportBetsLabelLeftConstraint.constant = 100
            sportBetsLabelRightConstraint.constant = 100
       
        }

        
        //Для iPhone 6+, 6S+ 7+, 8+ (с высотой экрана 736.0, width - 414) - настроены Constraints
        if UIScreen.main.bounds.height == 736 {

            //top Constraint для верхних двух кнопок "Прогнозы" и "Статистика". Тк все кнопки привязаны к верхним кнопкам, они автоматически подтягиваются
            bettingTipsButtonTopConstraint.constant = 111
            buyButtonTopConstraint.constant = 111
            statisticsButtonTopConstraint.constant = 111
            //left right Constraint для нижнего label "Спортивные прогнозы" "Sport Betting Tips"
            sportBetsLabelLeftConstraint.constant = 120
            sportBetsLabelRightConstraint.constant = 120
            leftConstraintYourPersonalSportsBettingAdvisor.constant = 36
            rightConstraintYourPersonalSportsBettingAdvisor.constant = 36
        }
        
        
        //Для iPhone X, 11pro (с высотой экрана 812.0, width = 375) - настроены Constraints
        if UIScreen.main.bounds.height == 812 {
                bettingTipsButtonTopConstraint.constant = 111
                buyButtonTopConstraint.constant = 111
                statisticsButtonTopConstraint.constant = 111
            }
        
        
        //Для iPhone 11, 11 Pro Max (с высотой экрана 896.0, width = 414) - настроены Constraints
        if UIScreen.main.bounds.height == 896 {
            bettingTipsButtonTopConstraint.constant = 161
            buyButtonTopConstraint.constant = 161
            statisticsButtonTopConstraint.constant = 161
            sportBetsLabelLeftConstraint.constant = 100
            sportBetsLabelRightConstraint.constant = 100
            
        }
        
        //iPadPro 9.7, iPad Air2, iPad Air, iPad 5th gen
        if UIScreen.main.bounds.height == 1024 && UIScreen.main.bounds.width == 768 {
            bettingTipsButtonHeight.constant = 235
            statisticsButtonHeight.constant = 235
            chatButtonHeight.constant = 235
            emailButtonHeight.constant = 235
            helpButtonHeight.constant = 235
            aboutUsButtonHeight.constant = 235
            bettingTipsButtonTopConstraint.constant = 130
            buyButtonTopConstraint.constant = 130
            statisticsButtonTopConstraint.constant = 130
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 30)
            iLoveBetsLabel.font = UIFont.systemFont(ofSize: 80)
            sportBetsLabel.font = UIFont.systemFont(ofSize: 30)
            iLoveBetsTopConstraints.constant  = 15
            if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 28)
            bettingTipsButtonTopConstraint.constant = 120
            buyButtonTopConstraint.constant = 120
            statisticsButtonTopConstraint.constant = 120
            }
        }
        
        
        //ipad Pro (12.9-inch) 2nd, 4th gen
        //Высота экрана =  1366.0
        //Ширина экрана =  1024.0
        if UIScreen.main.bounds.height == 1366 && UIScreen.main.bounds.width == 1024 {
            bettingTipsButtonHeight.constant = 280
            statisticsButtonHeight.constant = 280
            chatButtonHeight.constant = 280
            emailButtonHeight.constant = 280
            helpButtonHeight.constant = 280
            aboutUsButtonHeight.constant = 280
            bettingTipsButtonTopConstraint.constant = 250
            buyButtonTopConstraint.constant = 250
            statisticsButtonTopConstraint.constant = 250
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 40.2)
            iLoveBetsLabel.font = UIFont.systemFont(ofSize: 106.72)
            sportBetsLabel.font = UIFont.systemFont(ofSize: 40.2)
            iLoveBetsTopConstraints.constant  = 50
            sportBetsLabelBottomConstraint.constant = 40

            if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 40.2) //26.68
                sportBetsLabelBottomConstraint.constant = 40
                bettingTipsButtonTopConstraint.constant = 240
                buyButtonTopConstraint.constant = 240
                statisticsButtonTopConstraint.constant = 240
            }
        }
        
        
        //iPad Pro (11-inch) 2nd gen
        //Высота экрана =  1194.0
        //Ширина экрана =  834.0
        if UIScreen.main.bounds.height == 1194 && UIScreen.main.bounds.width == 834 {
            bettingTipsButtonHeight.constant = 250
            statisticsButtonHeight.constant = 250
            chatButtonHeight.constant = 250
            emailButtonHeight.constant = 250
            helpButtonHeight.constant = 250
            aboutUsButtonHeight.constant = 250
            bettingTipsButtonTopConstraint.constant = 171
            buyButtonTopConstraint.constant = 171
            statisticsButtonTopConstraint.constant = 171
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 35)
            iLoveBetsLabel.font = UIFont.systemFont(ofSize: 93.28)
            sportBetsLabel.font = UIFont.systemFont(ofSize: 34.98)
            iLoveBetsTopConstraints.constant  = 17.49
            if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 33)
            }
        }
        
        
        //iPadPro (10.5-inch), iPad Air (3rd gen)
            //Высота экрана =  1112.0
            //Ширина экрана =  834.0
        if UIScreen.main.bounds.height == 1112 && UIScreen.main.bounds.width == 834 {
            bettingTipsButtonHeight.constant = 540
            statisticsButtonHeight.constant = 250
            chatButtonHeight.constant = 250
            emailButtonHeight.constant = 250
            helpButtonHeight.constant = 250
            aboutUsButtonHeight.constant = 250
            bettingTipsButtonTopConstraint.constant = 150
            buyButtonTopConstraint.constant = 150
            statisticsButtonTopConstraint.constant = 150
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 35)
            iLoveBetsLabel.font = UIFont.systemFont(ofSize: 85)
            sportBetsLabel.font = UIFont.systemFont(ofSize: 32)
            iLoveBetsTopConstraints.constant  = 17.49
            if currentPhoneLangID == "ru" || currentPhoneLangID == "uk" {
                yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 30)
            }
        }
        
        //iPad 7th gen
        if UIScreen.main.bounds.height == 1080 && UIScreen.main.bounds.width == 810 {
            bettingTipsButtonHeight.constant = 235
            statisticsButtonHeight.constant = 235
            chatButtonHeight.constant = 235
            emailButtonHeight.constant = 235
            helpButtonHeight.constant = 235
            aboutUsButtonHeight.constant = 235
            bettingTipsButtonTopConstraint.constant = 160
            buyButtonTopConstraint.constant = 160
            statisticsButtonTopConstraint.constant = 160
            yourPersonalSportsBettingAdvisorLabel.font = UIFont.systemFont(ofSize: 30)
            iLoveBetsLabel.font = UIFont.systemFont(ofSize: 80)
            sportBetsLabel.font = UIFont.systemFont(ofSize: 30)
            iLoveBetsTopConstraints.constant  = 25
            }
        
        
    } //конец функции viewDidLoad
    
    
    
    
    //v.3.3 - animate in a specified view для pop-Up
    //будем вызывать эту функцию дважды, один раз для blurView outlet, и 2-й для popupView outlet
    //desiredView - будет = blurView или popupView
    func animateIn(desiredView: UIView) {
        let backgroundView = self.view!
        
        //attach our desired view to the screen (self.view / backgroundView)
        backgroundView.addSubview(desiredView)
        
        //starting the animation - начинается анимация
        //sets the view's scaling to be 120%. zooming the screen
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0 //0% - прозрачности
        desiredView.center = backgroundView.center //чтобы всплывающее окно высвечивалось по центру и blur-эффект тоже
        
        //через 0.3 секунды заканчивается анимация со 100% прозрачностью и изменением zooming the screen
        //animate effect
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1 //100% - прозрачности
        })
    }
    
    //v.3.3 - animate OUT in a specified view для pop-Up
    func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
        
    }
    
    
    
    



    
    //v.3.2 - кастомная кнопка назад на всех экранах
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // подготовка к переходу
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //v.3.2 - кастомная кнопка назад на следующем экране
        let backItem = UIBarButtonItem()
        backItem.title = "              "
        navigationItem.backBarButtonItem = backItem
    }
    
    
    
    
    
    
    //вызов почтового клиента при нажатии по кнопке
    @IBAction func emailButtonTapped(_ sender: Any) {
        //это необходимо тестировать на устройстве
        showMailComposer()
    }
    
        func showMailComposer() {
        //проверяем, что устройство может отправлять e-mail:
            guard MFMailComposeViewController.canSendMail() else {
                //показать оповещение, что пользователь не может отправить сообщение. но в старой версии приложения, я закомментировал это
            return
            }
        
            //v.3.2
            /*
            //проверка языка локализации!!!!!!!!!!
            let locale = NSLocale.current
            let currentLangID = (NSLocale.preferredLanguages as [String]) [0]
            var currentPhoneLangID = currentLangID
            //вычитаем 3 символа, чтобы получилось только ru (ru-US)
            let range = currentPhoneLangID.index(currentPhoneLangID.endIndex, offsetBy: -3)..<currentPhoneLangID.endIndex
            currentPhoneLangID.removeSubrange(range)
            */
            
            let composer = MFMailComposeViewController()
            
            //v.2.3
           // if currentLangID == "ru-RU"
            if currentPhoneLangID == "ru" {
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Обратная связь iLoveBets")
                composer.setMessageBody("<b>Имя:</b>&nbsp<br><br><b>Сообщение:</b>&nbsp", isHTML: true)
            }
            else if currentPhoneLangID == "en" {
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Write to iLoveBets")
                composer.setMessageBody("<b>Name:</b>&nbsp<br><br><b>Message:</b>&nbsp", isHTML: true)
            }
            else if currentPhoneLangID == "ar"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (ar)")
            }
            else if currentPhoneLangID == "hu"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (hu)")
            }
            else if currentPhoneLangID == "vi"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (vi)")
            }
            else if currentPhoneLangID == "el"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (el)")
            }
            else if currentPhoneLangID == "da"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (da)")
            }
            else if currentPhoneLangID == "he"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (he)")
            }
            else if currentPhoneLangID == "id"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (id)")
            }
            else if currentPhoneLangID == "es"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (es)")
            }
            else if currentPhoneLangID == "it"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (it)")
            }
            else if currentPhoneLangID == "ca"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (ca)")
            }
            else if currentPhoneLangID == "zh"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (zh)")
            }
            else if currentPhoneLangID == "ko"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (ko)")
            }
            else if currentPhoneLangID == "ms"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (ms)")
            }
            else if currentPhoneLangID == "de"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (de)")
            }
            else if currentPhoneLangID == "nl"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (nl)")
            }
            else if currentPhoneLangID == "nb"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (nb)")
            }
            else if currentPhoneLangID == "pl"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (pl)")
            }
            else if currentPhoneLangID == "pt"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (pt)")
            }
            else if currentPhoneLangID == "ro"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (ro)")
            }
            else if currentPhoneLangID == "sk"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (sk)")
            }
            else if currentPhoneLangID == "th"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (th)")
            }
            else if currentPhoneLangID == "tr"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (tr)")
            }
            else if currentPhoneLangID == "uk"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (uk)")
            }
            else if currentPhoneLangID == "fi"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (fi)")
            }
            else if currentPhoneLangID == "fr"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (fr)")
            }
            else if currentPhoneLangID == "hi"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (hi)")
            }
            else if currentPhoneLangID == "hr"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (hr)")
            }
            else if currentPhoneLangID == "cs"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (cs)")
            }
            else if currentPhoneLangID == "sv"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (sv)")
            }
            else if currentPhoneLangID == "ja"{
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets (ja)")
            }
            else {
                //v.3.2
                composer.mailComposeDelegate = self
                composer.setToRecipients(["ilovebets@ya.ru"])
                composer.setSubject("Support iLoveBets")
            }
            
            
    
            present(composer, animated: true)
    }


}

extension ViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //Показать оповещение об ошибке
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case . failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email Sent")
        }
        
        controller.dismiss(animated: true)
    }
}
