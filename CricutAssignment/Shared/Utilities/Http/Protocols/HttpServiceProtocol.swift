//
//  HttpServiceProtocol.swift
//  CricutAssignment
//
//  Created by Sreelash on 25/03/25.
//

protocol HttpServiceProtocol {
    associatedtype T
    
    func performRequest<U>(service: T, decodeType: U.Type) async throws -> U where U: Decodable
}
