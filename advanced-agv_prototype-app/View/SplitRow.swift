//
//  SplitRow.swift
//  advanced-agv_prototype-app
//
//  Created by Lukas Gehrke on 26.06.20.
//  Copyright © 2020 Lukas Gehrke. All rights reserved.
//

import SwiftUI

struct SplitRow: View {
    var leftText: String
    var rightText: String
    
    var body: some View {
        HStack {
            Text(leftText).foregroundColor(.white)
            Spacer()
            Text(rightText).foregroundColor(.white)
        }
    }
}
