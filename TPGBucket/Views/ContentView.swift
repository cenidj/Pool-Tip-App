//
//  ContentView.swift
//  TPGBucket
//
//  Created by Cesario Nivar on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var bucketViewModel = BucketViewModel()

    var body: some View {
        VStack {
            Form {
                StartingServers(bucketViewModel: bucketViewModel)
                
                if bucketViewModel.numberOfServers == 0 {
                    Section("Use the stepper above to add servers.") { }
                } else {
                    LabelsServerTable()
                    
                    ServersTable(bucketViewModel: bucketViewModel)
                    
                    Section("Busser - Type in busser tip out here.") {
                        TextField("Busser", value: $bucketViewModel.busserTipOut, format: .number)
                    }
                    
                    Section("Bar") {
                        Text("Total Bar =  \(String(format: "%.2f", bucketViewModel.totalBar))")
                        
                        Text("Bar tip out: \(String(format: "%.2f", bucketViewModel.totalBar)) * 7% = \(String(format: "%.2f", bucketViewModel.barTipOut))")
                    }
                    
                    
                    Section("Tip") {
                        Text("Total tip = \(String(format: "%.2f", bucketViewModel.totalTip))")
                        
                        Text("Total tip with tipout = \(String(format: "%.2f", bucketViewModel.totalTipWithTipOut))")
                        
                        
                    }
                    Section("Money on table") {
                        
                        TextField("Money on table: ", value: $bucketViewModel.moneyOnTable, format: .number)
                    }
                    
                    
                    Section("Piles") {
                        Text("\(bucketViewModel.numberOfServers) piles of \(bucketViewModel.piles)")
                    }
                    
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
    }
}

