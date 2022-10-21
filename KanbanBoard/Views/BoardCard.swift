//
//  BoardCard.swift
//  KanbanBoard
//
//  Created by Stefan Utschig on 12.10.22.
//

import SwiftUI

struct BoardCard: View {
    var task:Task

    
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(width: 290, height: 95)
                .cornerRadius(10)
                .foregroundColor(Color("CardBackground"))
            VStack(alignment: .leading, spacing: 7){
                Text(task.title)
                    .font(Font.custom("PlusJakartaSans-Bold", size: 15))
                    .foregroundColor(.black)
                    .padding(.leading)
                Text("\(task.subtasks.count) subtasks")
                    .font(Font.custom("PlusJakartaSans-Medium", size: 15))
                    .foregroundColor(Color("EmptyBoardText"))
                    .padding(.leading)
            }
        }
        .padding([.horizontal,.bottom])
        .shadow(radius: 10)
        
    }
}

