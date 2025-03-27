//
//  ButtonService.swift
//  CricutAssignment
//
//  Created by Sreelash on 25/03/25.
//

enum ButtonServices {
    case buttons
}

extension ButtonServices: HttpRequestProtocol {
    var path: String {
        switch self {
        case .buttons: return HttpConfiguration.EndPoints.buttons
        }
    }
    
    var parameters: [String : Any]? {
        nil
    }
    
    var method: HttpAction {
        switch self {
        case .buttons: return .get
        }
    }
}
