//
//  Server.swift
//  TPGBucket
//
//  Created by Cesario Nivar on 3/26/25.
//

import Foundation

struct Server: Identifiable {
    let id = UUID().uuidString
    let name: String
    let bar: Float
    let tips: Float
    let sales: Float
}
