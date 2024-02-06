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

  var body: some View {
    VStack {
      // Add label and TextField with accessibility label
      TextField("Enter task here", text: $userInput)
        .padding()
        .accessibilityLabel("New to-do item")

      Button(action: {
        let newTask = toDos(task: userInput, date: [12, 2, 2023], completed: false)
        toDoList.append(newTask)
      }) {
        Text("Submit")
      }
    }
  }
}
