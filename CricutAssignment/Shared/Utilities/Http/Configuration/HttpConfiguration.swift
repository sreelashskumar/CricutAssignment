//
//  HttpConfiguration.swift
//  CricutAssignment
//
//  Created by Sreelash on 25/03/25.
//

struct HttpConfiguration {
    static private let baseURL = "http://staticcontent.cricut.com/"
    
    struct EndPoints {
        static let buttons = baseURL + "static/test/shapes_001.json"
    }
}
