//
//  ShapeGridView.swift
//  CricutAssignment
//
//  Created by Sreelash on 25/03/25.
//

import SwiftUI

struct ShapeGridView: View {
    var shapes: [DrawPathShape]
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(shapes) { shape in
                    shapeView(for: shape.drawPath)
                        .frame(width: gridCellSize(), height: gridCellSize())
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                }
            }
            .padding()
        }
    }
    
    @ViewBuilder
    func shapeView(for type: DrawPath) -> some View {
        switch type {
        case .circle:
            CircleShape()
        case .square:
            SquareShape()
        case .triangle:
            TriangleShape()
        }
    }
    
    // 10 padding * 4 gaps (3 columns + outer padding) = totalSpacing, 40
    func gridCellSize() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let totalSpacing: CGFloat = 40
        return (screenWidth - totalSpacing) / 3
    }
}

#Preview {
    ShapeGridView(shapes: [
        DrawPathShape(drawPath: .circle),
        DrawPathShape(drawPath: .square),
        DrawPathShape(drawPath: .triangle)
    ])
}
