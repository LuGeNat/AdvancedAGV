//
//  Agv.swift
//  advanced-agv_prototype-app
//
//  Created by Lukas Gehrke on 21.06.20.
//  Copyright © 2020 Lukas Gehrke. All rights reserved.
//

import SwiftUI
import FirebaseDatabase

class Agv: NSObject {
    
    let ref: DatabaseReference?
    let key: String
    let name: String
    let temperature: Int
    let timestamp: String
    
    init(name: String, temperature: Int, timestamp: String, key: String = "") {
        self.ref = nil
        self.key = ""
        self.name = name
        self.temperature = temperature
        self.timestamp = timestamp
    }
    
    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: AnyObject], let name = value["name"] as? String, let temperature = value["temperature"] as? Int, let timestamp = value["timestamp"] as? String else { return nil }
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.name = name
        self.temperature = temperature
        self.timestamp = timestamp
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "temperature": temperature,
            "timestamp": timestamp
        ]
    }
}
