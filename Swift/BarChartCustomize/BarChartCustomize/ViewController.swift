//
//  ViewController.swift
//  BarChartCustomize
//
//  Created by Kunal's MacBook on 20/10/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    
    var months: [String]!
    var dataEntries: [BarChartDataEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec","Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0,20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        setChart(dataPoints: months, values: unitsSold)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."

        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [values[i]])
            dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Units Sold")
        chartDataSet.drawValuesEnabled = false
        let chartData = BarChartData(dataSet: chartDataSet)
        chartData.barWidth = Double(0.60)
        
        
        barChartView.data = chartData
        chartDataSet.colors = [UIColor(red: 0.0, green: 125.0/255.0, blue: 147.0/255.0, alpha: 1)]
        barChartView.xAxis.labelPosition = .bottom
        barChartView.rightAxis.axisMinimum = 0.0
        barChartView.leftAxis.axisMinimum = 0.0
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        barChartView.leftAxis.valueFormatter = YAxisValueFormatter()
        barChartView.rightAxis.valueFormatter = YAxisValueFormatter()
        barChartView.rightAxis.enabled = false
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.legend.enabled = false//remove the chart data info that show in buttom of the chart
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
        barChartView.xAxis.axisLineColor = UIColor.darkGray
        barChartView.xAxis.axisLineWidth = 2
        barChartView.leftAxis.axisLineColor = UIColor.white
        barChartView.leftAxis.drawGridLinesEnabled = true
        barChartView.leftAxis.gridLineWidth = CGFloat(1)
        barChartView.leftAxis.gridColor = NSUIColor.gray.withAlphaComponent(0.9)
        let floatValue: [CGFloat] = [5,5]
        barChartView.leftAxis.gridLineDashLengths = floatValue
        
        barChartView.delegate = self
    }
    
    @IBAction func backBtn(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }

}

extension ViewController: ChartViewDelegate{
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: Highlight) {
        print(entry.x, entry.y)
    }
}



class YAxisValueFormatter: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return String(Int(value)) + "k"
    }
}

