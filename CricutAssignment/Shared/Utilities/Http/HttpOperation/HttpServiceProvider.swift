//
//  HttpServiceProvider.swift
//  CricutAssignment
//
//  Created by Sreelash on 25/03/25.
//

import Foundation

class HttpServiceProvider<T: HttpRequestProtocol>: HttpServiceProtocol {
    
    func performRequest<U>(service: T, decodeType: U.Type) async throws -> U where U : Decodable {
        guard let url = URL(string: service.path) else {
            throw HttpError.invalidURL
        }
        
        let httpMethod = service.method.value
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let parameters = service.parameters {
            let data = try JSONSerialization.data(withJSONObject: parameters)
            urlRequest.httpBody = data
        }
        
        let (data, response): (Data, URLResponse)
        
        do {
            (data, response) = try await URLSession.shared.data(for: urlRequest)
        } catch {
            throw HttpError.networkError(underlyingError: error)
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HttpError.unknownError
        }
        
        let statusCode = httpResponse.statusCode
        
        guard (200...299).contains(statusCode) else {
            throw HttpError.serverError(code: statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedObject = try decoder.decode(U.self, from: data)
            return decodedObject
        } catch {
            throw HttpError.decodeError(underlyingError: error)
        }
    }
}
