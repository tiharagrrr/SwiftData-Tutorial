//
//  EditDestinationView.swift
//  iTour Tutorial
//
//  Created by Tihara Egodage on 2025-12-24.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    @Bindable var destination: Destination
    var body: some View {
        Form {
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
            
            
            //this is a seperate section cuz otherwise it doesnt show the picker label for segmented picker style
            Section("Priority") {
                Picker("Priority", selection: $destination.priority) {
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Must").tag(3)
                    
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
        //temporary in-memory db setup for preview
    
        // 1. Setup config
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        // 2. Create container with 'try!' (Safe to do in Previews)
        // This removes the need for the do-catch block
        let container = try! ModelContainer(for: Destination.self, configurations: config)
        
        let example = Destination(name: "Sample Destination", details: "Example details go here...")

        // 3. Return the view directly (No 'return' keyword needed)
        EditDestinationView(destination: example)
            .modelContainer(container)
}

