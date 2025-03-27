//
//  ShapesViewModel.swift
//  CricutAssignment
//
//  Created by Sreelash on 25/03/25.
//

import Combine
import SwiftUI

class ShapesViewModel: ObservableObject {
    @Published var alertMessageWrapper: AlertMessageWrapper?
    @Published var buttons: [ShapeButton]?
    @Published var shapes = [DrawPathShape]()
    
    func addDrawPath(shapeButton: ShapeButton) {
        let path = shapeButton.drawPath
        
        if let drawPath = DrawPath(rawValue: path) {
            let shape = DrawPathShape(drawPath: drawPath)
                
            shapes.append(shape)
        }
        
        print("shapes - \(shapes)")
    }
    
    func clearAllDrawPaths() {
        shapes.removeAll()
        
        print("shapes - \(shapes)")
    }
    
    func fetchButtons() async {
        let provider = HttpServiceProvider<ButtonServices>()
        
        do {
            let shapeButtons = try await provider.performRequest(
                service: .buttons,
                decodeType: ShapeButtons.self)
            
            DispatchQueue.main.async { [weak self] in
                self?.buttons = shapeButtons.buttons
            }
        } catch {
            print(error)
            showAlertMessage(error: error)
        }
    }
    
    private func showAlertMessage(error: Error) {
        DispatchQueue.main.async { [weak self] in
            self?.alertMessageWrapper = AlertMessageWrapper(
                title: AppConstants.Alert.appTitle,
                message: error.localizedDescription,
                primaryButtonType: .default(title: AppConstants.Alert.okButton,
                                            action: { print("OK tapped") }),
                secondaryButtonType: .cancel(title: AppConstants.Alert.cancelButton,
                                             action: { print("Cancel tapped") }))
        }
    }
}
