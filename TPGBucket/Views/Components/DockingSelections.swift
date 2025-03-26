//
//  DockingSelections.swift
//  TPGBucket
//
//  Created by Cesario Nivar on 3/25/25.
//

import SwiftUI

struct DockingSelections: View {
    @EnvironmentObject private var vm: BucketViewModel
    
    var body: some View {
        HStack {
            ForEach(vm.dockingOptions, id: \.self) { option in
                Text("\(option)")
                    .font(.footnote)
                    .padding(.horizontal, 4)
                    .foregroundStyle(Color.primary)
                    .background(vm.selectedDockingOptions.contains(option) ? Color.blue : Color.clear)
                    .onTapGesture {
                        vm.toggleDockingSelection(option)
                    }
                    .background(RoundedRectangle(cornerRadius: 2).stroke().foregroundStyle(Color.primary))
            }
        }
    }
}

#Preview {
    DockingSelections()
        .environmentObject(BucketViewModel())
}

