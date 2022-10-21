//
//  NavMenu.swift
//  KanbanBoard
//
//  Created by Stefan Utschig on 06.10.22.
//

import SwiftUI

struct NavMenu: View {
    
    @EnvironmentObject var model:ContentModel
    @Binding var displayedBoard: Content
    
    var body: some View {
        GeometryReader{ geoP in
            HStack{
                Image("logo-mobile")
                
                Menu {
                    ForEach(model.boards, id: \.self){ b in
                        Button {
                            self.displayedBoard = b
                        } label: {
                            Text(b.name)
                                .accentColor(Color("MenuText"))
                        }.buttonStyle(PlainButtonStyle())
                        
                    }//:ForEach
                }//:Menu
            label: {
                Text(displayedBoard.name)
                    .font(Font.custom("PlusJakarta-Medium", size: 18))
                    .frame(width: 160.0)
                    .accentColor(Color("MenuText"))
                Image("icon-chevron-down")
                    .padding(.trailing)
            }//:Label
                Button(action: {}) {
                    Image("icon-add-task-mobile")
                }//:Button
                .frame(width: 48, height: 32)
                .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .background(Color.blue)
                .cornerRadius(20)
                Menu {
                    Text("Logout")
                        .accentColor(Color("MenuText"))
                        .font(Font.custom("PlusJakarta-Medium", size: 18))
                }//:Menu
            label: {
                Image("icon-vertical-ellipsis").frame(height: 16)
            }//:Label
            .padding(.leading)
                
            }//:HStack
            .frame(maxWidth: geoP.size.width)
            .onAppear{
                displayedBoard = model.boards[0]
            }
        }//:GeometryReader
        
    }//:body
}//:struct


