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
        moneyOnTable / Float(numberOfServers)
    }
    
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
}
