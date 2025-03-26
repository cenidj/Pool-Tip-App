//
//  StartingServers.swift
//  TPGBucket
//
//  Created by Cesario Nivar on 3/23/25.
//

import SwiftUI


struct StartingServers: View {
    
    @EnvironmentObject var vm: BucketViewModel
    
    var body: some View {
        Section("Bucket") {
            Stepper(value: $vm.numberOfServers, in: 0...20, step: 1, onEditingChanged: { _ in
                vm.adjustServerArrays()
            }) {
                HStack {
                    Text("Starting servers:")
                        .bold()
                    Text("\(vm.numberOfServers)")
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
