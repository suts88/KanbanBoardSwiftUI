//
//  TaskDetailView.swift
//  KanbanBoard
//
//  Created by Stefan Utschig on 13.10.22.
//

import SwiftUI


struct TaskDetailView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
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
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            TaskDetailPotrait(sampleDescription: sampleDescription, task: $task, isShowing: $isShowing, description: description, currentStatus: currentStatus, completedSubtasks: 0, statusTypesList: statusTypesList)
        }//:IF
        else{
            TaskDetailLandscape(sampleDescription: sampleDescription, task: $task, isShowing: $isShowing, description: description, currentStatus: currentStatus, completedSubtasks: 0, statusTypesList: statusTypesList)
        }
    } //:body
    
} //:struct
