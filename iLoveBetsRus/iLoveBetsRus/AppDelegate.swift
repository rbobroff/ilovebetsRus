//
//  AppDelegate.swift
//  11
//
//  Created by Roman Bobrov on 30.10.2019.
//  Copyright © 2019 Roman Bobrov. All rights reserved.
//

import UIKit
import ApphudSDK //v.3.3
import iAd
import Firebase //при настройке push-уведомлений
import Messages //при настройке push-уведомлений
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //Поддержка работы приложения на iOS 9-12
    var window: UIWindow?
          func applicationWillResignActive(_ application: UIApplication) {
              // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
              // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
          }

          func applicationDidEnterBackground(_ application: UIApplication) {
              // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
              // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
          }

          func applicationWillEnterForeground(_ application: UIApplication) {
              // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
          }
    //:completeSettings = none

          func applicationDidBecomeActive(_ application: UIApplication) {
              // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
          }

          func applicationWillTerminate(_ application: UIApplication) {
              // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
          }
    
    //Конец кода "Поддержка iOS 9-12"
    
    
    
    
//при настройке push-уведомлений
    let gcmMessageIDKey = "gcm.message_id"
    
    
    
    
    //функция для смены цвета NavigationBar
    func UIColorFromHex(rgbValue:UInt32)->UIColor{
          let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
          let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
          let blue = CGFloat(rgbValue & 0xFF)/256.0
          return UIColor(red:red, green:green, blue:blue, alpha:1.0)
      }
    
    
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //v.3.3 - добавлена интеграция iAd с Apphud
        //https://docs.apphud.com/integrations/attribution/apple-search-ads?utm_campaign=integration_assistance&utm_campaign=63e0797c9b-LOST_USER&utm_medium=automatic&utm_medium=email&utm_source=email&utm_source=Apphud&utm_term=0_b71f4636f5-63e0797c9b-409861989
        Apphud.start(apiKey: "app_ZtqM5pRQ8x2b5sawKmgjGFgwQa5jBL")
        // send search ads attribution data to Apphud
        ADClient.shared().requestAttributionDetails { (data, error) in
            if let data = data {
                Apphud.addAttribution(data: data, from: .appleSearchAds, callback: nil)
            }
        }
        
        
        //v3.3 - встроенная покупка (https://app.apphud.com/configureapp/28f9f6bd/1?utm_campaign=integration_assistance&utm_campaign=63e0797c9b-LOST_USER&utm_medium=automatic&utm_medium=email&utm_source=email&utm_source=Apphud&utm_term=0_b71f4636f5-63e0797c9b-409861989)
        Apphud.setFinishAllTransactions()
        Apphud.start(apiKey: "app_ZtqM5pRQ8x2b5sawKmgjGFgwQa5jBL")
        
  
        
        //цвет NavigationBar, кнопка "Назад"
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColorFromHex(rgbValue: 0xffffff)
        //цвет фона NavigationBar
        navigationBarAppearace.barTintColor = UIColorFromHex(rgbValue: 0x161c1f)
        // цвет заголовка NavigationBar
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        //принудительная смета цвета StatusBar, но метод Deprecated. В настройках приложения выставлено по умолчанию StatusBar = Ligh. В Info.plist добавлена запись "View controller-based status bar appearance" = NO
      //  UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
      //  UIApplication.shared.statusBarStyle = .lightContent
        
        
        
        
        
        //для push notification:
        if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self
          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })
        } else {
          let settings: UIUserNotificationSettings =
          UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }
        application.registerForRemoteNotifications()
        Messaging.messaging().delegate = self
        
        FirebaseApp.configure() //при настройке push-уведомления
        
        
        //загружаем новости при загрузке приложения. использовали на начальных парах, чтоюы проверить, что новости загружаются и записываются в файл
        //loadNews()
        
        return true
    } //конец метода didFinishLaunchingWithOptions

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    //при настройке push-уведомлений
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
      // If you are receiving a notification message while your app is in the background,
      // this callback will not be fired till the user taps on the notification launching the application.
      // TODO: Handle data of notification

      // With swizzling disabled you must let Messaging know about the message, for Analytics
      // Messaging.messaging().appDidReceiveMessage(userInfo)

      // Print message ID.
      if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
      }

      // Print full message.
      print(userInfo)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      // If you are receiving a notification message while your app is in the background,
      // this callback will not be fired till the user taps on the notification launching the application.
      // TODO: Handle data of notification

      // With swizzling disabled you must let Messaging know about the message, for Analytics
      // Messaging.messaging().appDidReceiveMessage(userInfo)

      // Print message ID.
      if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
      }

      // Print full message.
      print(userInfo)

      completionHandler(UIBackgroundFetchResult.newData)
    }

}

//при настройке push-уведомлений
@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
  // Receive displayed notifications for iOS 10 devices.
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    let userInfo = notification.request.content.userInfo
    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)
    // Print message ID.
    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }
    // Print full message.
    print(userInfo)
    // Change this to your preferred presentation option
    completionHandler([.alert, .sound, .badge])
  }
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo
    // Print message ID.
    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }
    // Print full message.
    print(userInfo)

    completionHandler()
  }
}
extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
      print("Firebase registration token: \(fcmToken)")

      let dataDict:[String: String] = ["token": fcmToken]
      NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
      // TODO: If necessary send token to application server.
      // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
}


