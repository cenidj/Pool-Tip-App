//
//  ContentView.swift
//  TPGBucket
//
//  Created by Cesario Nivar on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var vm: BucketViewModel
    
    var body: some View {
        VStack {
            List {
                StartingServers(vm: _vm)
                
                if vm.numberOfServers == 0 {
                    Section("Use the stepper above to add servers.") { }
                } else {
                    ServersTable()
                    Sections()
                }
            }
        }
        .navigationTitle("The Park Grill - Pool Tip")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    NavigationStack {
        ContentView()
            .environmentObject(BucketViewModel())
    }
}

