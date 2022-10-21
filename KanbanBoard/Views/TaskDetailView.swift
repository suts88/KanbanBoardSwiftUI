//
//  TaskDetailView.swift
//  KanbanBoard
//
//  Created by Stefan Utschig on 13.10.22.
//

import SwiftUI


struct TaskDetailView: View {
    
    let sampleDescription = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr."
    // not globally reflected yet!!
    @Binding var task: Task
    @Binding var isShowing: Bool
    @State var description: String = ""
    @State var currentStatus = "Todo"
    @State var completedSubtasks = 0
    
    var statusTypesList = ["Todo", "Doing", "Done"]
    
    
    
    var body: some View {
        // MARK: body start
        ZStack {
            // MARK: background
            Color.white
                .ignoresSafeArea()
                .onTapGesture {
                    isShowing = false
                }
            // MARK: title and description
            VStack(alignment: .center) {
                Text(task.title)
                    .font(Font.custom("PlusJakartaSans-Bold", size: 18))
                    .font(.largeTitle)
                    .lineSpacing(10)
                    .padding(.bottom)
                Text(description)
                    .font(Font.custom("PlusJakartaSans-Regular", size: 15))
                    .foregroundColor(Color("EmptyBoardText"))
                    .lineSpacing(8)
                    .padding(.bottom, 30)
                // MARK: subtasks
                VStack {
                    HStack {
                        Text("Subtasks (\(completedSubtasks) of \(task.subtasks.count))")
                            .font(Font.custom("PlusJakartaSans-Bold", size: 12))
                            .foregroundColor(Color("EmptyBoardText"))
                            .lineLimit(16)
                            .padding(.leading, 5)
                        Spacer()
                    }
                    .padding(.bottom, 10.0)
                    ForEach(task.subtasks, id: \.self){
                        subtask in
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color("DetailViewCheckboxBackgorund"))
                                .frame(width: 295, height: 60)
                               
                            HStack(alignment: .center){
                                Image(systemName: subtask.isCompleted ? "checkmark.square" : "square")
                                    .padding(.horizontal)
                                Text(subtask.title)
                                    .strikethrough(subtask.isCompleted, color: Color("EmptyBoardText"))
                                Spacer()
                            } //:HStack
                            //.frame(width: <#T##CGFloat?#>, height: )
                            .onTapGesture {
                                var newCompletionStatus = !subtask.isCompleted
                                // After introducing DB: Change subtask.isCompleted to newCompletionStatus
                            }
                        }//:ZStack
                    }//:ForEach
                }//:VStack
                // MARK: select menu
                VStack {
                    HStack { // code repetition : ready for own component
                        Text("Current Status:")
                            .font(Font.custom("PlusJakartaSans-Bold", size: 12))
                            .foregroundColor(Color("EmptyBoardText"))
                            .lineLimit(16)
                            .padding(.leading, 5)
                        Spacer()
                    }
                    .padding(.bottom, 10.0)
                    Menu{
                        ForEach(statusTypesList, id: \.self){ s in
                            Button {
                                self.currentStatus = s
                                self.task.status = s
                            } label: {
                                Text(s)
                                    .accentColor(Color("MenuText"))
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                        } //:ForEach
                    } //:Menu
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.black, lineWidth: 0.5)
                            .frame(width: 295, height:40)
                            .foregroundColor(.white)
                        
                        HStack{
                            Text(task.status ?? "status")
                                .font(Font.custom("PlusJakartaSans-Medium", size: 18))
                                .frame( alignment:.leading)
                                .accentColor(Color("MenuText"))
                                .padding(.trailing, 200)
                            Image("icon-chevron-down")
                                .padding(.trailing)
                            
                        } //:HStack
                    } //:ZStack
                }//:Label
                }
                .padding(.top, 30.0)//:VStack
            }.frame(width: 295)
        } // :VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .onAppear {
            let unwrappedOptionalDescription: String = task.description ?? ""
            description = unwrappedOptionalDescription.count > 0 ? unwrappedOptionalDescription : sampleDescription
        }.onAppear {
            self.task.subtasks.forEach{
                subtask in
                if subtask.isCompleted{
                    self.completedSubtasks += 1
                }
            }
        } //:ZStack
        
    } //:body
    
} //:struct
