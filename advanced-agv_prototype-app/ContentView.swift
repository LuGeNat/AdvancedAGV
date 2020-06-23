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
                    Text("AGV name: \(session.agv.name)")
                }
                Section {
                    Text("Current Battery Temperature is: ")
                    Text("\(session.agv.temperature) °C")
                    Text("Current Battery Voltage is: ")
                    Text("\(session.agv.voltage) V")
                }
                Section {
                    Text("Last Timestamp:")
                    Text("\(session.agv.timestamp)")
                }
            }
        .onAppear(perform: getAgv)
        .navigationBarTitle(Text("Advanced AGV - \(session.agv.name)"), displayMode: .inline)
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
