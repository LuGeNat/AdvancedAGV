//
//  Agv.swift
//  advanced-agv_prototype-app
//
//  Created by Lukas Gehrke on 21.06.20.
//  Copyright © 2020 Lukas Gehrke. All rights reserved.
//

import SwiftUI
import FirebaseDatabase

struct Agv: Identifiable {
    
    let id: UUID
    let ref: DatabaseReference?
    let key: String
    let name: String
    let temperature: Int
    let voltage: Double
    let timestamp: String
    
    init(name: String, temperature: Int, voltage: Double, timestamp: String, key: String = "") {
        self.id = UUID()
        self.ref = nil
        self.key = ""
        self.name = name
        self.temperature = temperature
        self.voltage = Double(round(10*voltage)/10)
        self.timestamp = timestamp
    }
    
    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: AnyObject], let name = value["name"] as? String, let temperature = value["temperature"] as? Int, let voltage = value["voltage"] as? Double, let timestamp = value["timestamp"] as? String else { return nil }
        self.id = UUID()
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.name = name
        self.temperature = temperature
        self.voltage = Double(round(10*voltage)/10)
        self.timestamp = timestamp
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "temperature": temperature,
            "voltage": voltage,
            "timestamp": timestamp
        ]
    }
}
