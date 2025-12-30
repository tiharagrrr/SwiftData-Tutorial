//
//  DestinationListingView.swift
//  iTour Tutorial
//
//  Created by Tihara Egodage on 2025-12-30.
//

import SwiftData
import SwiftUI

struct DestinationListingView: View {
    @Environment(\.modelContext) var modelContext
    
    //to fetch data, sorting can be a single attribute or an array of sort descriptors
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)]) var destinations: [Destination]
    
    var body: some View {
        List{
            ForEach(destinations) {destination in
                NavigationLink(value: destination){
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteDestinations)
        }
    }
    
    init(sort: SortDescriptor<Destination>) {
        //_destinations accesses the property wrapper, destinations refers to the array
        _destinations = Query(filter: #Predicate{
            //$0 is a shorthand to say first param (in this case there is only 1 param anyway
            // alternative would be like destination.priority
            $0.priority >= 2
        },sort: [sort])
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }

}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name))
}
