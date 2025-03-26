//
//  BucketViewModel.swift
//  TPGBucket
//
//  Created by Cesario Nivar on 3/23/25.
//

import Foundation


class BucketViewModel: ObservableObject {
    @Published var numberOfServers = 0
    @Published var serverNames: [String] = []
    @Published var serverBar: [Float] = []
    @Published var serverTip: [Float] = []
    @Published var busserTipOut: Float = 0
    @Published var moneyOnTable: Float = 0
    @Published var selectedDockingOptions: Set<String> = []
    
    var totalBar: Float {
        serverBar.reduce(0, +)
    }
    
    var totalTip: Float {
        serverTip.reduce(0, +)
    }
    
    var barTipOut: Float {
        totalBar * 0.07
    }
    
    var totalTipWithTipOut: Float {
        totalTip - barTipOut - busserTipOut
    }
    
    // TODO: Change to full share and get docks before makes piles.
    var piles: Float {
        if selectedDockingOptions.isEmpty {
            return moneyOnTable / Float(numberOfServers)
        } else {
            print("Get docks before making piles")
        }
        return 0.00
    }
    
    let dockingOptions = ["40", "45", "50", "55", "60", "65", "70", "75", "80", "90"]
    
    // Helper function to match array sizes
    func adjustServerArrays() {
        if serverNames.count < numberOfServers {
            for _ in serverNames.count..<numberOfServers {
                serverNames.append("Server \(serverNames.count + 1)")
                serverBar.append(0.0)
                serverTip.append(0.0)
            }
        } else {
            serverNames = Array(serverNames.prefix(numberOfServers))
            serverBar = Array(serverBar.prefix(numberOfServers))
            serverTip = Array(serverTip.prefix(numberOfServers))
        }
    }
    
    func deleteServerData(_ indexSet: IndexSet) {
        for index in indexSet {
            serverNames.remove(at: index)
            serverBar.remove(at: index)
            serverTip.remove(at: index)
            numberOfServers -= 1
        }
    }
    
    func toggleDockingSelection(_ option: String) {
        if selectedDockingOptions.contains(option) {
            selectedDockingOptions.remove(option)
        } else {
            selectedDockingOptions.insert(option)
        }
    }
}
