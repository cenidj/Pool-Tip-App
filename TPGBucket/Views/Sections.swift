import SwiftUI

struct Sections: View {
    
    @ObservedObject var bucketViewModel: BucketViewModel
    
    private var formattedTotalBar: String { bucketViewModel.totalBar.formattedToTwoDecimals() }
    private var formattedBarTipOut: String { bucketViewModel.barTipOut.formattedToTwoDecimals() }
    private var formattedTotalTip: String { bucketViewModel.totalTip.formattedToTwoDecimals() }
    private var formattedTotalTipWithTipOut: String { bucketViewModel.totalTipWithTipOut.formattedToTwoDecimals() }
    private var formattedPiles: String { bucketViewModel.piles.formattedToTwoDecimals() }
    
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
            TextField("Type in busser tip out here", value: $bucketViewModel.busserTipOut, format: .number)
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
            TextField("Money on table", value: $bucketViewModel.moneyOnTable, format: .number)
        }
    }
    
    private var dockings: some View {
        Section(header: Text("Docking percentages needed?")) {
            DockingSelections()
        }
    }
    
    private var pilesSection: some View {
        Section(header: Text("Piles")) {
            Text("\(bucketViewModel.numberOfServers) piles of \(formattedPiles)")
        }
    }
}

#Preview {
    Form {
        Sections(bucketViewModel: BucketViewModel())
    }
}
