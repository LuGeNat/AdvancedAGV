//
//  ContentView.swift
//  advanced-agv_prototype-app
//
//  Created by Lukas Gehrke on 16.06.20.
//  Copyright © 2020 Lukas Gehrke. All rights reserved.
//

import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()


struct ColorManager {
    static let yellow = UIColor(named: "advancedAgvYellow")
    static let gray = UIColor(named: "advancedAgvGray")
    static let darkGray = UIColor(named: "advancedAgvDarkGray")
}


struct ContentView: View {
    
    init() {
        configureAppearance()
    }
    
    //MARK: Properties
    @ObservedObject var session = FirebaseSession()
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: User Interface
    var body: some View {
        NavigationView {
            List(self.session.agvs) { agv in
                NavigationLink(destination: AgvDetailView(agv: agv)) {
                    HStack {
                        Text(agv.name).foregroundColor(.white)
                        Spacer()
                        Text(self.getCheckedTemperature(agv.temperature)).foregroundColor(.white)
                        Spacer()
                    }
                }
                
            }
            .onAppear(perform: connectToDatabase)
            .navigationBarItems(leading:
                HStack {
                    Image("advancedAgv2")
                    .resizable().frame(width: 32.0, height: 32.0)
                }
            )
            .navigationBarTitle(Text("Advanced AGV"))
            }
        }
    
    //MARK: Functions
    
    /// establish database connection and get contained agvs
    func connectToDatabase() {
        session.listen()
    }
    
    /// return a string with warning sign in case of high temperature
    func getCheckedTemperature(_ temperature: Int) -> String {
        return temperature > 37 ? "⚠️ \(temperature)°C" : "\(temperature)°C"
    }
    
    /// configure appearance of Navigation Bar and Table View Cells
    func configureAppearance() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = ColorManager.gray

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
        UITableViewCell.appearance().backgroundColor = ColorManager.darkGray
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
