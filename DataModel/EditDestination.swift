//
//  EditDestination.swift
//  DataModel
//
//  Created by Павел Кунгурцев on 09.02.2024.
//

import SwiftUI
import SwiftData

struct EditDestination: View {
    
    
    @Bindable var destination: Destination
    
    var body: some View {
        Form {
            TextField("Name" , text: $destination.name)
            TextField("Details" , text: $destination.details)
            DatePicker("Date", selection: $destination.date)
            
            Section("Priority") {
                Picker("Priority" , selection: $destination.priority) {
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
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        let example = Destination(name: "Exampel Destination", details: "Automattically expand")
        return EditDestination(destination: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
