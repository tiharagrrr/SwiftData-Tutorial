//
//  ContentView.swift
//  iTour Tutorial
//
//  Created by Tihara Egodage on 2025-12-03.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    //to insert, delete or modify data
    @Environment(\.modelContext) var modelContext
    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchtext = ""
    
    var body: some View {
        NavigationStack(path: $path){
            DestinationListingView(sort: sortOrder, searchString: searchtext)
                .navigationTitle(Text("iTour"))
                .navigationDestination(for: Destination.self, destination:EditDestinationView.init)
                .searchable(text: $searchtext)
                .toolbar {
                    Button("Add Destination", systemImage: "plus", action: addDestination)
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder ) {
                            Text("Name")
                                .tag(SortDescriptor(\Destination.name))
                            Text("Priority")
                                .tag(SortDescriptor(\Destination.priority))
                            Text("Date")
                                .tag(SortDescriptor(\Destination.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addSamples() {
        let rome = Destination(name: "Rome")
        let tokyo = Destination(name: "Tokyo")
        let washington = Destination(name: "Washington")
        
        modelContext.insert(rome)
        modelContext.insert(tokyo)
        modelContext.insert(washington)
    }
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
    
    
}

#Preview {
    ContentView()
}
