//
//  EditCircles.swift
//  CricutAssignment
//
//  Created by Sreelash on 26/03/25.
//

import SwiftUI

struct EditCirclesView: View {
    @ObservedObject var vm: EditCirclesViewModel
    
    var body: some View {
        let circleShapes = vm.shapes.filter { $0.drawPath == .circle }
        
        VStack {
            ShapeGridView(shapes: circleShapes)
            Spacer()
            EditCirclesButtonsView(editCirclesButtonAction: { button in
                vm.editCirclesAction(with: button)
            })
        }
    }
}
