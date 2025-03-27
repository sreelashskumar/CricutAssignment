//
//  HttpError.swift
//  CricutAssignment
//
//  Created by Sreelash on 25/03/25.
//

import Foundation

enum HttpError: Error {
    case invalidURL
    case networkError(underlyingError: Error)
    case decodeError(underlyingError: Error)
    case serverError(code: Int)
    case unknownError
}

extension HttpError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return ErrorStrings.General.invalidURL
        case .networkError(underlyingError: let err):
            return String(format: ErrorStrings.Network.genericError,
                          err.localizedDescription)
        case .decodeError(underlyingError: let err):
            return String(format: ErrorStrings.Network.decodeError,
                          err.localizedDescription)
        case .serverError(code: let code):
            return mapServerErrorMessage(for: code)
        case .unknownError:
            return ErrorStrings.General.unknownError
        }
    }
    
    private func mapServerErrorMessage(for code: Int) -> String {
        switch code {
        case 400:
            return ErrorStrings.ServerError.badRequest
        case 401:
            return ErrorStrings.ServerError.unauthorized
        case 403:
            return ErrorStrings.ServerError.forbidden
        case 404:
            return ErrorStrings.ServerError.notFound
        case 408:
            return ErrorStrings.ServerError.timeout
        case 500:
            return ErrorStrings.ServerError.internalServerError
        case 502:
            return ErrorStrings.ServerError.badGateway
        case 503:
            return ErrorStrings.ServerError.serviceUnavailable
        case 504:
            return ErrorStrings.ServerError.gatewayTimeout
        default:
            return String(format: ErrorStrings.ServerError.unexpectedError, code)
        }
    }
}

enum ErrorStrings {
    enum General {
        static let invalidURL = "The URL provided is invalid. Please check and try again."
        static let unknownError = "An unknown error occurred. Please try again later."
    }

    enum Network {
        static let genericError = "Network error occurred: %@"
        static let decodeError = "Failed to parse server response: %@"
    }

    enum ServerError {
        static let badRequest = "Bad request. Please check your input and try again."
        static let unauthorized = "Unauthorized. Please log in to continue."
        static let forbidden = "Access forbidden. You don’t have permission to view this content."
        static let notFound = "Resource not found. Please check the URL or contact support."
        static let timeout = "Request timed out. Please try again later."
        static let internalServerError = "Internal server error. Please try again later."
        static let badGateway = "Bad gateway. The server received an invalid response."
        static let serviceUnavailable = "Service unavailable. The server is temporarily overloaded."
        static let gatewayTimeout = "Gateway timeout. Please try again after some time."
        static let unexpectedError = "An unexpected error occurred (code: %d). Please contact support if the issue persists."
    }
}
