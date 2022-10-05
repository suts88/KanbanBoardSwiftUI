//
//  NavMenu.swift
//  KanbanBoard
//
//  Created by Stefan Utschig on 06.10.22.
//

import SwiftUI

struct NavMenu: View {
   
    @EnvironmentObject var model:ContentModel
    @Binding var displayedBoard: String
    
    var body: some View {
        GeometryReader{ geoP in
             HStack{
                 Image("logo-mobile")
                 
                 Menu {
                     ForEach(model.boards, id: \.self){ b in
                         Button {
                             self.displayedBoard = b.name
                         } label: {
                             Text(b.name)
                                 .accentColor(.black)
                         }.accentColor(.black)
                     }.frame(width: 160.0)
                 }
             label: {
                 Text(displayedBoard)
                     .frame(width: 160.0)
                 Image("icon-chevron-down")
                     .padding(.trailing)
             }
                 Button(action: {}) {
                     Image("icon-add-task-mobile")
                 }
                 .frame(width: 48, height: 32)
                 .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                 .background(Color.blue)
                 .cornerRadius(20)
                 Menu {
                     Text("Logout")
                 }
             label: {
                 Image("icon-vertical-ellipsis").frame(height: 16)
             }
             .padding(.leading)
                 
             }
             .frame(maxWidth: geoP.size.width)
             .onAppear{
                 displayedBoard = model.boards[0].name
             }
         }
  
     }
    }


