import SwiftUI

struct Sections: View {
    @EnvironmentObject private var vm: BucketViewModel
    
    private var formattedTotalBar: String { vm.totalBar.formattedToTwoDecimals() }
    private var formattedBarTipOut: String { vm.barTipOut.formattedToTwoDecimals() }
    private var formattedTotalTip: String { vm.totalTip.formattedToTwoDecimals() }
    private var formattedTotalTipWithTipOut: String { vm.totalTipWithTipOut.formattedToTwoDecimals() }
    private var formattedPiles: String { vm.piles.formattedToTwoDecimals() }
    
    var body: some View {
        Group {
            tipOutSection
            barSection
            tipSection
            moneyOnTableSection
            dockings
            pilesSection
            
        }
    }
    
    private var tipOutSection: some View {
        Section(header: Text("Busser")) {
            TextField("Type in busser tip out here", value: $vm.busserTipOut, format: .number)
        }
    }
    
    private var barSection: some View {
        Section(header: Text("Bar")) {
            Text("Total Bar = \(formattedTotalBar)")
            Text("Bar tip out: \(formattedTotalBar) * 7% = \(formattedBarTipOut)")
        }
    }
    
    private var tipSection: some View {
        Section(header: Text("Tip")) {
            Text("Total tip = \(formattedTotalTip)")
            Text("Total tip with tipout = \(formattedTotalTipWithTipOut)")
        }
    }
    
    private var moneyOnTableSection: some View {
        Section(header: Text("Money on Table")) {
            TextField("Money on table", value: $vm.moneyOnTable, format: .number)
        }
    }
    
    private var dockings: some View {
        Section(header: Text("Docking percentages needed?")) {
            DockingSelections()
        }
    }
    
    private var pilesSection: some View {
        Section(header: Text("Piles")) {
            Text("\(vm.numberOfServers) piles of \(formattedPiles)")
        }
    }
}

#Preview {
    List {
        Sections()
            .environmentObject(BucketViewModel())
    }
}
