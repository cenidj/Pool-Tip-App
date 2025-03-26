//
//  ServersTable.swift
//  TPGBucket
//
//  Created by Cesario Nivar on 3/23/25.
//

import SwiftUI

struct ServersTable: View {
    @EnvironmentObject private var vm: BucketViewModel
    
    var body: some View {
        VStack {
            LabelsServerTable()
            
            ForEach(0..<vm.numberOfServers, id: \.self) { index in
                HStack {
                    TextField("Server", text: $vm.serverNames[index])
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 120)
                    
                    Spacer()
                    
                    TextField("Bar", value: $vm.serverBar[index], format: .number)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 80)
                    
                    Spacer()
                    
                    TextField("Tip", value: $vm.serverTip[index], format: .number)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 80)
                }
            }
            .onDelete(perform: vm.deleteServerData)
        }
    }
}


#Preview {
    ServersTable()
        .environmentObject(BucketViewModel())
}
