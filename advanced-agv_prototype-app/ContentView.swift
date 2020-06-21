//
//  ContentView.swift
//  advanced-agv_prototype-app
//
//  Created by Lukas Gehrke on 16.06.20.
//  Copyright © 2020 Lukas Gehrke. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // Mark: - Properties
    @ObservedObject var session = FirebaseSession()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("AGV: \(session.agv.name)")
                    Text("Current Battery Temperature is: \(session.agv.temperature)")
                    Text("Time checked: \(session.agv.timestamp)")
                }
            }
        .onAppear(perform: getAgv)
        .navigationBarTitle(Text("AdvancedAGV"))
        .padding()
        }
    }
    
    //MARK: Functions
    func getAgv() {
        session.listen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
