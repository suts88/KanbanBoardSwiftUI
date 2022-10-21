//
//  HomeView.swift
//  KanbanBoard
//
//  Created by Stefan Utschig on 05.10.22.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var model:ContentModel
    @State var displayedBoard: Content
    @State var boardIsEmpty: Bool = false
    
    var body: some View {
        VStack{
            NavMenu(displayedBoard: $displayedBoard)
                .frame(minHeight: 50, maxHeight: 55)
                .padding(.top)
            ScrollView(showsIndicators: false){
                if boardIsEmpty{
                    EmptyBoard()
                }
                else{
                    BoardView(displayedBoard: displayedBoard)
                }
            }
            .ignoresSafeArea( edges: .bottom)
            .background(Color("mainBackground"))
        }
        .onChange(of: displayedBoard.name) { newValue in
            let result = filterifBoardIsEmpty()
            boardIsEmpty = result[0].columns.count == 0
        }
        
        
    }
    func filterifBoardIsEmpty()->[Content]{
        let filtered = model.boards.filter{
            board in
            return board.name == displayedBoard.name
        }
        return filtered
    }
    
}
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            HomeView(displayedBoard: Content(name: "Preview", columns: [Column(name: "Task", tasks: [Task]())]))
                .preferredColorScheme(.light)
                .environmentObject(ContentModel())
            HomeView(displayedBoard:Content(name: "Preview", columns: [Column]()) )
                .preferredColorScheme(.dark)
                .environmentObject(ContentModel())
        }
    }
}
