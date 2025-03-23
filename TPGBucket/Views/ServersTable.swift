//
//  ServersTable.swift
//  TPGBucket
//
//  Created by Cesario Nivar on 3/23/25.
//

import SwiftUI

struct ServersTable: View {
    @ObservedObject var bucketViewModel: BucketViewModel
    
    var body: some View {
        ForEach(0..<bucketViewModel.numberOfServers, id: \.self) { index in
            HStack {
                TextField("Server", text: $bucketViewModel.serverNames[index])
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 120)
                
                Spacer()
                
                TextField("Bar", value: $bucketViewModel.serverBar[index], format: .number)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 80)
                
                Spacer()
                
                TextField("Tip", value: $bucketViewModel.serverTip[index], format: .number)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 80)
            }
        }
        .onDelete { indexSet in
            for index in indexSet {
                bucketViewModel.serverNames.remove(at: index)
                bucketViewModel.serverBar.remove(at: index)
                bucketViewModel.serverTip.remove(at: index)
                bucketViewModel.numberOfServers -= 1
            }
        }
    }
}


#Preview {
    ServersTable(bucketViewModel: BucketViewModel())
}
