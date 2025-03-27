//
//  HttpAction.swift
//  CricutAssignment
//
//  Created by Sreelash on 25/03/25.
//

enum HttpAction {
    case get
    case post
    case put
    case delete
    
    var value: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        case .delete: return "DELETE"
        }
    }
}
