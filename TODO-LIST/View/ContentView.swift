//
//  ContentView.swift
//  TODO-LIST
//
//  Created by Mohamed Khechini on 03/06/2023.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import AuthenticationServices

struct ContentView: View {
    @EnvironmentObject var signinViewModel: SigninViewModel
    @AppStorage("log_State") var log_State = false
    
    var body: some View{
        ZStack {
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            VStack{
                Spacer()
                
                .frame(width: 300, height: 50)
                .cornerRadius(10)
            }
            
        }
        .background(Color("white"))
    }
    
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
