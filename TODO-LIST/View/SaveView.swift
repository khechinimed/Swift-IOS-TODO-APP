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
                Text("Title")
                    .font(.headline)
                Spacer()
                Button(action: {
                    Sheet.toggle()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.black)
                })
            }
            TextField("type title", text: $textfiled)
                .padding()
                .frame(width: 290, height: 45)
                .background(.ultraThinMaterial.opacity(0.9))
            Button(action: {
                if !textfiled.isEmpty{
                    signinViewmodel.SaveTask(title: textfiled, done:signinViewmodel.done)
                    textfiled = ""
                    Sheet = false
                }
            }, label: {
                Text("Save").bold()
                    .foregroundColor(.black)
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
