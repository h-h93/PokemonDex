//
//  PokemonStatsChartView.swift
//  PokemonDex
//
//  Created by hanif hussain on 06/05/2024.
//

import SwiftUI
import Charts

struct ChartData: Identifiable, Equatable {
    var id: String { return type }
    var type: String
    var count: Int
}
// hp, att, defence, special attack, special defence, speed
struct PokemonStatsChartView: View {
    var data: [ChartData]
    
    init(data: [ChartData]) {
        self.data = data
    }
    
    var body: some View {
        Chart(data) { dataPoint in
            BarMark(x: .value("Base Stat", dataPoint.count),
                    y: .value("Type", dataPoint.type))
            .foregroundStyle(by: .value("Type", dataPoint.type))
            .annotation(position: .trailing) {
                Text(String(dataPoint.count))
                    .foregroundColor(.gray)
            }
        }
        .chartLegend(.hidden)
        .chartXAxis(.hidden)
        .chartYAxis {
            AxisMarks { _ in
                AxisValueLabel()
            }
        }
        .aspectRatio(2, contentMode: .fill)
        .padding()
    }
    
    
    mutating func updateData(chartData: [ChartData]) {
        data = chartData
    }
}
