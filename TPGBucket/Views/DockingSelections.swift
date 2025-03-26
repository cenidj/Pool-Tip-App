//
//  DockingSelections.swift
//  TPGBucket
//
//  Created by Cesario Nivar on 3/25/25.
//

import SwiftUI

struct DockingSelections: View {
    let dockingOptions = ["40", "45", "50", "55", "60", "65", "70", "75", "80", "90"]
    @State private var selectedOptions: Set<String> = []
    
    var body: some View {
        HStack {
            ForEach(dockingOptions, id: \.self) { option in
                Text("\(option)")
                    .font(.footnote)
                    .padding(.horizontal, 4)
                    .foregroundStyle(Color.primary)
                    .background(selectedOptions.contains(option) ? Color.blue : Color.clear)
                    .onTapGesture {
                        toggleSelection(option)
                    }
                    .background(RoundedRectangle(cornerRadius: 2).stroke().foregroundStyle(Color.primary))
            }
        }
    }
    
    private func toggleSelection(_ option: String) {
        if selectedOptions.contains(option) {
            selectedOptions.remove(option)
        } else {
            selectedOptions.insert(option)
        }
    }
}

#Preview {
    DockingSelections()
}

