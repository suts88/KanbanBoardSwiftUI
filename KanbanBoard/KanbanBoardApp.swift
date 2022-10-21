//
//  KanbanBoardApp.swift
//  KanbanBoard
//
//  Created by Stefan Utschig on 05.10.22.
//

import SwiftUI


@main
struct KanbanBoardApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(displayedBoard: Content(name: "Preview", columns: [Column(name: "Task", tasks: [Task]())]))
                .environmentObject(ContentModel())
        }
    }
}
