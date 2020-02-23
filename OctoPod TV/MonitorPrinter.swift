import SwiftUI

struct MonitorPrinter : View {
    @EnvironmentObject var service: ViewService

    var body: some View {
        HStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("State")
                    Text("File")
                    Text("Progress")
                    Text("Print Time")
                    Text("Print Time Left")
                    Text("Print Completion")
                    Text("Extruder Temp")
                    Text("Bed Temp")
                    Text("Current Height")
                    Text("Layer")
                }
                VStack(alignment: .trailing, spacing: 8) {
                    Text(service.printerStatus)
                    Text(service.printingFile)
                    Text(service.progress)
                    Text(service.printTime)
                    Text(service.printTimeLeft)
                    Text(service.printEstimatedCompletion)
                    Text("\(service.tool0Actual) / \(service.tool0Target)")
                    Text("\(service.bedActual) / \(service.bedTarget)")
                    if service.currentHeight != nil {
                        Text(service.currentHeight!)
                    } else {
                        Text("-")
                    }
                    if service.layer != nil {
                        Text(service.layer!)
                    } else {
                        Text("-")
                    }
                }
            }
            Image("Image", bundle: nil)
        }
    }
}

struct MonitorPrinter_Previews: PreviewProvider {
    static var previews: some View {
        MonitorPrinter()
    }
}