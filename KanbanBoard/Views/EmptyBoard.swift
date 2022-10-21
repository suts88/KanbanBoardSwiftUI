//
//  EmptyBoard.swift
//  KanbanBoard
//
//  Created by Stefan Utschig on 07.10.22.
//

import SwiftUI

struct EmptyBoard: View {
    var body: some View {
        GeometryReader{ gp in
            VStack(alignment: .center) {
                Text("This board is empty. Create a new column to get started.")
   
                    .foregroundColor(Color("EmptyBoardText"))
                    .font(Font.custom("PlusJakarta-Medium", size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .frame(width: 350, height: 80)
                    .lineSpacing(5)
                Button(action: {}) {
                    HStack{
                        Image("icon-add-task-mobile")
                        Text("Add New Column")
                            .font(Font.custom("PlusJakarta-Medium", size: 15))
                            .accentColor(.white)
                    }
                }
                .frame(width: 150, height: 45)
                .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .background(Color.blue)
                .cornerRadius(20)
            }
                .frame(width: gp.size.width , height: gp.size.height/10)
        }
    }
}

struct EmptyBoard_Previews: PreviewProvider {
    static var previews: some View {
        EmptyBoard()
    }
}
