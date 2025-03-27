//
//  ShapeButton.swift
//  CricutAssignment
//
//  Created by Sreelash on 25/03/25.
//

import Foundation

struct ShapeButtons: Codable {
    var buttons: [ShapeButton]
}

struct ShapeButton: Codable {
    var name: String
    var drawPath: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case drawPath = "draw_path"
    }
}
