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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
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
}
