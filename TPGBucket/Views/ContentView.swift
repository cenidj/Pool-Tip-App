//
//  ContentView.swift
//  TPGBucket
//
//  Created by Cesario Nivar on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var bucketViewModel: BucketViewModel
    
    var body: some View {
        VStack {
            List {
                StartingServers(bucketViewModel: _bucketViewModel)
                
                if bucketViewModel.numberOfServers == 0 {
                    Section("Use the stepper above to add servers.") { }
                } else {
                    LabelsServerTable()
                    ServersTable(bucketViewModel: bucketViewModel)
                    Sections(bucketViewModel: bucketViewModel)
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

