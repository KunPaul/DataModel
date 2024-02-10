//
//  ContentView.swift
//  DataModel
//
//  Created by Павел Кунгурцев on 09.02.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query var destinations: [Destination]
    @Environment(\.modelContext) var modelContext
    @State private var path = [Destination]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(destinations) { destination in
                    NavigationLink(value: destination) {
                        VStack(alignment: .leading) {
                            Text(destination.name)
                                .font(.headline)
                            
                            
                            Text(destination.date.formatted(date: .long, time: .shortened))
                        }
                    }
                }
                .onDelete(perform: deleteDestinations)
            }
            .navigationTitle("iTest")
            .navigationDestination(for: Destination.self, destination: EditDestination.init)
            .toolbar {
                Button("Add Sample", action: addSample )
                Button("Add Destination", systemImage: "plus", action: addDestination)
            }
        }
    }
    
    func addSample() {
        let rome = Destination(name: "Rome")
        let moscow = Destination(name: "Moscow")
        let london = Destination(name: "London")
        
        modelContext.insert(rome)
        modelContext.insert(moscow)
        modelContext.insert(london)
        
    }
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    ContentView()
}
