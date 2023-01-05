//
//  AppDelegate.swift
//  Auction
//
//  Created by jobzella on 04/01/2023.
//

import UIKit
import Moya
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        MoyaProvider<Requests>().request(.categories) { result in
//            switch result{
//            case .success(let response):
//                print(response.data)
//
//                do{
//                    let data = try response.map(BaseModel<CategoryData>.self)
//                    print(data.msg ?? "")
//                    print(data.data?.categories?[5])
//
//
//                }
//                catch{
//
//                }
//
//            case .failure(let error):
//                print(error)
//
//            }
//        }
        MoyaProvider<Requests>().request(.optionChild(id: 51656)) { result in
            switch result{
            case .success(let response):
                print(response.data)
                
                
                do{
                    let data = try response.map(BaseModel<[SubCategory]>.self)
                    print(data.msg ?? "")
                    print(data.data?[0].options?.count)

                    
                }
                catch{
                    
                }

            case .failure(let error):
                print(error)

            }
        }

        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

