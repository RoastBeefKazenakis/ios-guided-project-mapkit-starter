//
//  Quake.swift
//  Quakes
//
//  Created by Thomas Sabino-Benowitz on 2/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation

//MKAnnotation


class Quake: NSObject, Decodable {
    //place
    //time
    //magnitude
    //coordinates
    
    let magnitude: Double
    let place: String
    let time: Date
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case magnitude = "mag"
        case properties
        case place
        case time
        case geometry
        case coordinates
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let properties = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .properties)
        let geometry = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .geometry)
        
        var coordinates = try geometry.nestedUnkeyedContainer(forKey: .coordinates)
        
        self.magnitude = try properties.decode(Double.self, forKey: .magnitude)
        self.place = try properties.decode(String.self, forKey: .place)
        self.time = try properties.decode(Date.self, forKey: .time)
        
        self.longitude = try coordinates.decode(Double.self)
        self.latitude = try coordinates.decode(Double.self)
        
        
        super.init()
        
    }
    
   
}

class QuakeResults: Decodable {
       let quakes: [Quake]
       enum CodingKeys: String, CodingKey {
           case quakes = "features"
       }
   }
