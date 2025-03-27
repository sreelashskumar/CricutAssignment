//
//  TriangleShape.swift
//  CricutAssignment
//
//  Created by Sreelash on 26/03/25.
//

import SwiftUI

struct TriangleShape: View {
    var body: some View {
        Triangle()
            .fill(Color.red)
            .padding(10)
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        path.move(to: CGPoint(x: width / 2, y: 0))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.closeSubpath()
        
        return path
    }
}
