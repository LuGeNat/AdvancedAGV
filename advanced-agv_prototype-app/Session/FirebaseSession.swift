//
//  FirebaseSession.swift
//  advanced-agv_prototype-app
//
//  Created by Lukas Gehrke on 21.06.20.
//  Copyright © 2020 Lukas Gehrke. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseDatabase

class FirebaseSession: ObservableObject {
    
    // Mark: - Properties
    @Published var agv: Agv = Agv(name: "nicht vorhanden", temperature: 0, voltage: 0, timestamp: "nicht gemessen")
    
    var ref: DatabaseReference = Database.database().reference()
    
    func listen() {
        _ = Auth.auth().addStateDidChangeListener { (_,_) in
            self.observeAgv()
        }
    }
    
    func observeAgv() {
        ref.observe(DataEventType.value) { (snapshot) in
            self.agv = Agv(name: "nicht vorhanden", temperature: 0, voltage: 0, timestamp: "nicht gemessen")
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot, let agv = Agv(snapshot: snapshot) {
                    self.agv = agv
                }
            }
        }
    }

}
