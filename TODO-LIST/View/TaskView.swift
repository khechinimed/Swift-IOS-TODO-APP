//
//  TaskView.swift
//  TODO-LIST
//
//  Created by Mohamed Khechini on 03/06/2023.
//

import Foundation
import SwiftUI


struct  TaskView: View {
    @EnvironmentObject var signinViewmodel : SigninViewModel
    @AppStorage("log_State") var log_State = false
    @State var Delet :Bool = false
    var body: some View{
        ZStack {
            Image("TaskView")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            VStack(alignment: .leading){
                HStack{
                    Button(action: {
                        Delet.toggle()
                    }, label: {
                        Image(systemName: "pencil.circle.fill")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    })
                    Spacer()
                    Button(action: {
                        self.log_State = false
                    }, label: {
                        Image(systemName: "person.fill.badge.minus")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 30)
                    })
                    
                }
                Spacer()
                ScrollView{
                    ForEach(signinViewmodel.todoList){items in
                        VStack(alignment: .leading, spacing: 10){
                            Button(action: {
                                
                            }, label: {
                                HStack{
                                    Image(systemName: "circle")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 5)
                                        .padding(.vertical, 3)
                                    Text(items.title)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    if Delet{
                                        Button(action: {
                                            signinViewmodel.DeletTask(toDelet: items)
                                        }, label: {
                                            Image(systemName: "minus.circle.fill")
                                                .foregroundColor(.red)
                                                .font(.title2)
                                                .fontWeight(.bold)
                                        })
                                        .padding(.horizontal, 5)
                                    }
                                }
                                
                                
                            })
                        }
                    }
                }
                Spacer()
            }
            
        }
        .background(Color("black"))
    }
}

struct TaskView_Previews: PreviewProvider{
    static var previews: some View{
        TaskView()
            .environmentObject(SigninViewModel())
    }
}
