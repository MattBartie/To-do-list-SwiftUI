//
//  ContentView.swift
//  To do list
//
//  Created by Matt Bartie on 12/18/23.
//

import SwiftUI


struct ContentView: View {
    
    
    @State private var toDoList: [toDos] = [
        toDos(task: "Homework 12 for CS1501, test test, tesing", date: [12, 2, 2023], completed: false),
        toDos(task: "Lab 3 for CS449", date: [12, 2, 2023], completed: false),
        toDos(task: "Mail cards", date: [12, 2, 3321], completed: false)]
    
    var body: some View {
        ZStack(alignment: .topLeading){
            BackgroundColor()
            VStack(alignment: .leading){
                ToDoText()
                ScrollView{
                    VStack(alignment: .leading){
                        //Adds each Todo item to view
                        ForEach(toDoList.indices, id: \.self) { index in
                            toDoButton(thisButton: toDoList[index])
                        }
                        
                    }
                }
                addButton(toDoList: $toDoList)
                HStack(){
                    
                }
      
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct BackgroundColor: View {
    var body: some View {
        Rectangle()
            .fill(Color(red: 0.1, green: 0.1, blue: 0.1))
            .frame(width: .infinity, height: .infinity)
            .ignoresSafeArea()
    }
}

struct ToDoText: View{
    var body: some View{
        Text("TO DO")
            .bold()
            .italic()
            .font(.system(size: 40))
            .foregroundColor(.white)
            .padding(.leading, 40) // Adjust these values as needed
            
        
        Rectangle()
            .fill(Color.red)
            .frame(width: 300, height: 1)
            .padding(.leading, 40) // Adjust these values as needed
            .padding(.top, -23)
            
    }
    
}




struct addButton: View {
    @Binding var toDoList: [toDos]
    @State private var showingAddToDo = false

    var body: some View {
        HStack(){
            Spacer()
            Button{
                showingAddToDo = true
            }label: {
                Image(systemName: "plus.circle.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 20)
            }
        }
        .sheet(isPresented: $showingAddToDo) {
            ZStack {
                // Dark background with subtle gradient:
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.14, green: 0.12, blue: 0.16), Color(red: 0.1, green: 0.08, blue: 0.12)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                // Content with appropriate text and accent color:
                addToDo(toDoList: $toDoList)
                    .padding() // Add some padding for visual breathing room
                    .foregroundColor(.white) // Use white for text and icons
                    .accentColor(.blue) // Accentuate interactive elements with blue
            }
        }

    }
}
