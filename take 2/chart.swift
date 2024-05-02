import Foundation
import SwiftUI
import Charts


struct ChartDataPoint: Identifiable {
    var id = UUID().uuidString  // Use the key as the unique identifier
    var time: String
    var clicks: Int
}

struct convi : View{
    @EnvironmentObject var viewModel: DashboardViewModel
   
    var body: some View{
        Chart {
            // Safely unwrapping the optional dictionary
            if let overallUrlChart = viewModel.schema?.data.overall_url_chart {
                let dataPoints = overallUrlChart.map { key, value in
                                   ChartDataPoint( time: key, clicks: value)
                               }
                
                ForEach(dataPoints) { dp in
                    LineMark(
                        x: .value("Time",dp.time),
                        y: .value("Clicks", dp.clicks)
                    ).foregroundStyle(Color.blue)
                        .lineStyle(StrokeStyle(lineWidth: 3))
                        .shadow(color: .blue, radius: 3, x: 0, y: 2)
                }
                
                
            }
        }
    }
    
}
struct ContentVie: PreviewProvider {
    static var previews: some View {
        convi()
    }
}
