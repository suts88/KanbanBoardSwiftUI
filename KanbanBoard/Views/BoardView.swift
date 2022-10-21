//
//  BoardView.swift
//  KanbanBoard
//
//  Created by Stefan Utschig on 12.10.22.
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var model:ContentModel
    @State var isShowing: Bool =  false
    @State var touchedTask: Task = Task(title: "Lorem",  subtasks: [Subtask]())
    @State var indexOfcurrentColumn = 0
    @State var indexOfTask = 0
    var displayedBoard: Content
    
    func circleColorFunc(columnName: String)->Color{
        switch columnName{
        case "Todo": return Color.red
        case "Doing": return Color.yellow
        case "Done": return Color.green
        default: return Color.black
        }
    }
    
    
    var body: some View {
        // MARK: body start
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top){
                ForEach(0..<displayedBoard.columns.count, id: \.self){
                    index in
                    //let taskCount = column.tasks?.count ?? 0
                    let taskCount = displayedBoard.columns[index].tasks?.count ?? 0
                    VStack(alignment: .leading) {
                        HStack{
                            Circle()
                                .foregroundColor(circleColorFunc(columnName: displayedBoard.columns[index].name))
                                .frame(width: 15, height: 15)
                                .cornerRadius(20)
                            Text("\(displayedBoard.columns[index].name) (\(taskCount))")
                                .padding(.leading, 5.0)
                        }//:HStack
                        .padding(.leading, 25)
                        .padding(.bottom)
                        if taskCount > 0 && (!isShowing){
                            ForEach(0..<displayedBoard.columns[index].tasks!.count, id: \.self){
                                taskIndex in
                                // MARK: board cards
                                BoardCard(task: displayedBoard.columns[index].tasks![taskIndex])
                                    .onTapGesture {
                                        isShowing = true
                                        touchedTask = displayedBoard.columns[index].tasks![taskIndex]
                                        indexOfcurrentColumn = index
                                        indexOfTask = taskIndex
                                }
                            }//:ForEach
                        }//:If

                    }//:VStack
                    .padding()
                    .frame(minWidth: 290, maxWidth: 340)
                } //:ForEach
            } //:HStack
            .ignoresSafeArea( edges: .bottom)
            .padding(.top,25)
            .background(Color("mainBackground"))
        }//:ScrollView
        .sheet(isPresented: $isShowing){
            TaskDetailView(task: $touchedTask, isShowing: $isShowing)
        }
    }//:body

}//:struct

