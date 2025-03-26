//
//  StartingServers.swift
//  TPGBucket
//
//  Created by Cesario Nivar on 3/23/25.
//

import SwiftUI


struct StartingServers: View {
    
    @EnvironmentObject var bucketViewModel: BucketViewModel
    
    var body: some View {
        Section("Bucket") {
            Stepper(value: $bucketViewModel.numberOfServers, in: 0...20, step: 1, onEditingChanged: { _ in
                bucketViewModel.adjustServerArrays()
            }) {
                HStack {
                    Text("Starting servers:")
                        .bold()
                    Text("\(bucketViewModel.numberOfServers)")
                        .padding(.leading, 5)
                }
            }
        }
    }
}

#Preview {
    StartingServers()
        .environmentObject(BucketViewModel())
}
