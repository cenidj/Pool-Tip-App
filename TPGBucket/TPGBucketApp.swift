//
//  TPGBucketApp.swift
//  TPGBucket
//
//  Created by Cesario Nivar on 3/11/25.
//

import SwiftUI

@main
struct TPGBucketApp: App {
    @StateObject var bucketViewModel = BucketViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environmentObject(bucketViewModel)
            }
        }
    }
}
