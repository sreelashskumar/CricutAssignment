//
//  ShapesButtonsView.swift
//  CricutAssignment
//
//  Created by Sreelash on 26/03/25.
//

import SwiftUI

struct ShapesButtonsView: View {
    var shapeButtons: [ShapeButton]?
    var shapeButtonAction: (ShapeButton) -> Void
    
    var body: some View {
        HStack {
            if let buttons = shapeButtons {
                ForEach(buttons, id: \.name) { button in
                    Spacer()
                    Button(action: {
                        shapeButtonAction(button)
                    }) {
                        Text(button.name)
                    }
                    Spacer()
                }
            } else {
                Text("Loading...")
            }
        }
    }
}
