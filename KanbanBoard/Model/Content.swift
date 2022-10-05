//
//  Content.swift
//  KanbanBoard
//
//  Created by Stefan Utschig on 05.10.22.
//

import Foundation


struct Content: Decodable, Hashable{
    var name: String
    var columns: [Column]
}

struct Column: Decodable, Hashable{
    var name: String
    var tasks: [Task]?
}

struct Task: Decodable, Hashable{
    var title: String
    var description: String?
    var status: String?
    var subtasks: [Subtask]
}

struct Subtask: Decodable, Hashable{
    var title: String
    var isCompleted: Bool
}
