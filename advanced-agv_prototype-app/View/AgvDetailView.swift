//
//  AgvDetailView.swift
//  advanced-agv_prototype-app
//
//  Created by Lukas Gehrke on 26.06.20.
//  Copyright © 2020 Lukas Gehrke. All rights reserved.
//

import SwiftUI

struct AgvDetailView: View {
    
    var agv: Agv
    
    var body: some View {
        Form {
            Section(header: Text("")) {
                SplitRow(leftText: "AGV name:", rightText: agv.name)
            }
            Section {
                SplitRow(leftText: "Battery Temperature: ", rightText: "\(agv.temperature) °C")
                SplitRow(leftText: "Battery Voltage: ", rightText: "\(agv.voltage) V")
            }
            Section {
                SplitRow(leftText: "Last Timestamp:", rightText: "\(agv.timestamp)")
            }
        }
    }
}
