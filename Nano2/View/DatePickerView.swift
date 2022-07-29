//
//  DatePickerView.swift
//  Nano2
//
//  Created by Zacky Ilahi Azmi on 29/07/22.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var isShowing: Bool
    @State var date: Date = Date()
    
    var body: some View {
        if isShowing {
            ZStack {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Group {
                        DatePicker("Date", selection: $date, displayedComponents: [.date])
                            .datePickerStyle(.graphical)
                            .labelsHidden()
                            .colorScheme(.dark)
                            .frame(width: 370, height: 430, alignment: .top)
                            .background(Color("Background"))
                            .cornerRadius(8)
                            .accentColor(Color("Primary1"))
                            .overlay(
                                Button {
                                    isShowing = false
                                } label: {
                                    Text("Jump To Day")
                                        .foregroundColor(Color.white)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .frame(width: 330, height: 50)
                                        .background(Color("Primary1"))
                                        .cornerRadius(8)
                                        .padding(.horizontal)
                                        .padding(.bottom, 24)
                                    
                                }, alignment: .bottom
                            )
                    }
                    
                    
                }
            }
        }
    }

}
