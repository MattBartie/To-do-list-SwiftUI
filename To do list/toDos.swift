//
//  toDos.swift
//  To do list
//
//  Created by Matt Bartie on 12/19/23.
//

import Foundation
import SwiftUI

struct toDos{
    let task: String
    let date: [Int]
    var completed: Bool
}


struct toDoButton: View {
    @State var thisButton: toDos
    @Binding var updateN: Bool
    var body: some View {
                HStack{
                    ZStack{
                        var name = thisButton.completed ? "circle.inset.filled" : "circle"
                            Image(systemName: name)
                            .padding(.leading, 30)
                            .foregroundColor(.white)
                        
                    }
                    ZStack{
                        Text(thisButton.task)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                }
                Button(){
                    thisButton.completed.toggle()
                    updateN.toggle()
                    
                }label: {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 350, height: 30)
                    
                        
                }.padding(.leading, 30)
            .padding(.top, -40)
    }
}


struct addToDo: View {
    @State private var userInput = ""
    @Binding var toDoList: [toDos]
    @Binding var sheetVis: Bool

    var body: some View {
        VStack {
            TextField("Enter task here", text: $userInput)
                .padding()

            Button(action: {
                let currentDate = Date()
                let calendar = Calendar.current
                let components = calendar.dateComponents([.month], from: currentDate)
                
                let newTask = toDos(task: userInput, date: [components.month ?? 0, components.day ?? 0, components.year ?? 0], completed: false)
                toDoList.append(newTask)
                sheetVis = false
            }) {
                Text("ADD TASK")
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.4, green: 0.4, blue: 0.45),
                                Color(red: 0.4, green: 0.4, blue: 0.45)]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(3)
                    .padding(0)
                    
            }
            
        }
    }
}
