//
//  LabelsServerTable.swift
//  TPGBucket
//
//  Created by Cesario Nivar on 3/23/25.
//

import SwiftUI

struct LabelsServerTable: View {
    var body: some View {
        HStack {
            Text("Server name   ")
            Spacer()
            Text("Bar          ")
            Spacer()
            Text("Tip        ")
        }
        .font(.subheadline.bold())
        .foregroundStyle(.blue)
    }
}

#Preview {
    LabelsServerTable()
}
