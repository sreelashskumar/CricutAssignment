//
//  HttpRequestProtocol.swift
//  CricutAssignment
//
//  Created by Sreelash on 25/03/25.
//

protocol HttpRequestProtocol {
    var path: String { get }
    var parameters: [String: Any]? { get }
    var method: HttpAction { get }
}
