//
//  ContentModel.swift
//  KanbanBoard
//
//  Created by Stefan Utschig on 05.10.22.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject{
    
    @Published var boards =  [Content]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.boards = ContentModel.getData()
        
    }
    

    static func getData()->[Content]{
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        guard pathString != nil else {
            return [Content]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        do{
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do{
                return try decoder.decode([Content].self, from: data)
            }
            catch{
                print(error)
            }
            
        }
        catch{
            print(error)
        }
        
        return [Content]()
    }
}
