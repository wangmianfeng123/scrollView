//
//  AppDelegate.swift
//  meirijianguojilu
//
//  Created by 王绵峰 on 2020/10/28.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        BabassuLabelledBaseManager.defaultManger.creatTable(livelockName: "journalTable")
        BabassuLabelledBaseManager.defaultManger.creatTable(livelockName: "diaryTable")
        
        if UserDefaults.isFirstLaunch() {
            let model = fuwutongzhieLaagerJournalModel()
            
            
            
            model.baathistColor = UIColor.colorWithHexString(hex: "#74A8EF")
            model.sarapeName = "All"
            
            if #available(iOS 11.0, *) {
                BabassuLabelledBaseManager.defaultManger.insert(model: model, name: "journalTable", successBlock: {
                }) {
                    
                }
            } else {

            }
            
            
            
            
        }
        
        
        let vc = ViewController()
        let nav = UINavigationController.init(rootViewController: vc)
        self.window?.rootViewController = nav
        return true
    }

   


}

