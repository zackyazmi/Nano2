//
//  CreateTask.swift
//  Nano2
//
//  Created by Zacky Ilahi Azmi on 27/07/22.
//

import SwiftUI

struct CreateTask: View {
    
    @StateObject var vm = HomeViewModel()
    
    @State var textFieldText: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack (alignment: .topTrailing) {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color("Primary1"))
                            .font(.title3)
                            .padding(.trailing)
                })
                }
                
                HStack {
                    Text("Create")
                        .font(.title)
                        .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    
                    Text("Task")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary1"))
                }
                .padding(.leading)
                .padding(.bottom)
                
                VStack  {
                    Text("Task")
                        .font(.body)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    HStack {
                        Spacer()
                        
                        TextField("Add your task here...", text: $textFieldText)
                            .frame(width: 344, height: 48)
                            .padding(.leading)
                            .border(.white, width: 3)
                            .background(Color("Background"))
                            .cornerRadius(5)
                            .colorScheme(.dark)
                            .foregroundColor(Color("Primary1"))
                            .font(.headline)
                        
                        Spacer()
                    }
                    
                    Button(action: {
                        //text field cant submit when blank
                        guard !textFieldText.isEmpty else { return }
                        
                        //add to core data
                        vm.addTask(text: textFieldText)
                        
                        //changing text field to blank
                        textFieldText = ""
                        
                        //Close Create Task Screen
                        presentationMode.wrappedValue.dismiss()
                        
                        
                        
                        
                    }, label: {
                        Text("Submit")
                            .foregroundColor(Color.white)
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(width: 360, height: 50)
                            .background(Color("Primary1"))
                            .cornerRadius(8)
                            .padding()
                    })
                    
                }
                
                
                
            }
        }
        .navigationTitle("Create Task")
        .navigationBarHidden(true)
        .accentColor(Color("Primary1"))
    }
}


struct CreateTask_Previews: PreviewProvider {
    static var previews: some View {
        CreateTask()
    }
}
