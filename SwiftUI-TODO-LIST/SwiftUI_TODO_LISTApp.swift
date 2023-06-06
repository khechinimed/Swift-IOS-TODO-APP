//
//  TodolistFBApp.swift
//  TODO-LIST
//
//  Created by Mohamed Khechini on 05/06/2023.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

@main
struct TodolistFBApp: App{
    
    @StateObject var signinViewModel = SigninViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage ("log_state") var log_state = true
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                TaskView()
            }
            .environmentObject(signinViewModel)
        }
    }
}

class AppDelegate:NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) ->
    Bool{
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
      return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
