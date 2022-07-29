//
//  Home.swift
//  Nano2
//
//  Created by Zacky Ilahi Azmi on 26/07/22.
//

import SwiftUI
import CoreData

struct Home: View {
    
    @StateObject var vm = HomeViewModel()
    
    @State var month: String = ""
    @State var year: String = ""
    
    @State var task: [String] = []
    
    @State var date: Date = Date()
    
    @State var isShowing: Bool = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd"
        return formatter
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack() {
                        Text("July")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        
                        Text("2022")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Primary1"))
                        
                        Spacer()
                        
                        Button {
                            isShowing.toggle()
                        } label: {
                            Image(systemName: "calendar")
                                .foregroundColor(Color.white)
                                .font(.system(size: 23))
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                    
                    HStack {
                        Text(dateFormatter.string(from: date))
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.left.circle.fill")
                            .foregroundColor(Color("Primary1"))
                            .font(.system(size: 23))
                            .padding(.trailing)
                        
                        Image(systemName: "chevron.right.circle.fill")
                            .foregroundColor(Color("Primary1"))
                            .font(.system(size: 23))
                            .padding(.trailing)
                    }
                    
                    taskList
                    
                    NavigationLink(destination: CreateTask()) {
                        Text("Create Task")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Primary1"))
                            .font(.title)
                            .padding()
                            .background(Color("Background"))
                            .cornerRadius(8)
                    }
                }
                DatePickerView(isShowing: $isShowing)
            }
            .navigationBarHidden(true)
        }
    }
    
    var taskList: some View {
        
        List {
            ForEach(vm.savedEntities) { entity in
                HStack {
                    Image(systemName: "circle")
                        .foregroundColor(Color.white)
                        .font(.system(size: 24))
                        .padding()
                    
                    VStack (alignment: .leading) {
                        HStack {
                            Text("06.00 -07.00")
                                .font(.subheadline)
                                .foregroundColor(Color("Neutrals4"))
                                .padding(.trailing)
        
                            HStack {
                                Image(systemName: "checkmark.square.fill")
                                    .foregroundColor(Color.white)
        
                                Text("0/2")
                                    .font(.subheadline)
                                    .foregroundColor(Color.white)
                            }
                        }
                        .padding(.bottom, 1)
                        
                        Text(entity.name ?? "NO NAME")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        .onAppear(perform: vm.fetchTask)
                    }
                }
            }
            .onDelete(perform: vm.deleteTask)
            .listRowBackground(Color("Background"))
        }
        .listStyle(.plain)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
