//
//  SaveView.swift
//  TODO-LIST
//
//  Created by Mohamed Khechini on 06/06/2023.
//

import Foundation
import SwiftUI

struct SaveView: View {
    @Binding var Sheet:Bool
    @Binding var textfiled: String
    @EnvironmentObject var signinViewmodel : SigninViewModel
    var body: some View{
        VStack{
            HStack{
                Text("Titre")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    Sheet.toggle()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.white)
                })
            }
            TextField("Tache à ajouter", text: $textfiled)
                .padding()
                .frame(width: 290, height: 45)
                .background(.ultraThinMaterial.opacity(0.9))
                .foregroundColor(.white)
            Button(action: {
                if !textfiled.isEmpty{
                    signinViewmodel.SaveTask(title: textfiled, done:signinViewmodel.done)
                    textfiled = ""
                    Sheet = false
                }
            }, label: {
                Text("Enregistrer").bold()
                    .foregroundColor(.white)
                    
            })
            .buttonStyle(.bordered)
        }
        
        .padding()
        .frame(width: 300, height: 150)
        
        
    }
}

struct SaveView_Previews: PreviewProvider{
    static var previews: some View {
        SaveView(Sheet: .constant(true), textfiled: .constant(""))
            .environmentObject(SigninViewModel())
    }
}
