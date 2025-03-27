//
//  EditCirclesViewModel.swift
//  CricutAssignment
//
//  Created by Sreelash on 26/03/25.
//

import Combine
import SwiftUI

class EditCirclesViewModel: ObservableObject {
    @Binding var shapes: [DrawPathShape]
    
    init(shapes: Binding<[DrawPathShape]>) {
        self._shapes = shapes
    }
    
    func editCirclesAction(with button: EditCircleButton) {
        switch button {
        case .add:
            addCirclePath()
        case .deleteAll:
            deleteAllCircles()
        case .remove:
            removeLastCircle()
        }
    }
    
    private func addCirclePath() {
        let drawPath = DrawPath.circle
        let circleShape = DrawPathShape(drawPath: drawPath)
        
        shapes.append(circleShape)
    }
    
    private func deleteAllCircles() {
        shapes.removeAll(where: { $0.drawPath == .circle })
    }
    
    private func removeLastCircle() {
        if let lastIndex = shapes.lastIndex(where: { $0.drawPath == .circle }) {
            shapes.remove(at: lastIndex)
        }
    }
}
