//
//  HomeView.swift
//  KanbanBoard
//
//  Created by Stefan Utschig on 05.10.22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var displayedBoard: String
    
    var body: some View {
        HStack{
            NavMenu(displayedBoard: $displayedBoard)
        }
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(displayedBoard: "Preview")
            .environmentObject(ContentModel())
    }
}
