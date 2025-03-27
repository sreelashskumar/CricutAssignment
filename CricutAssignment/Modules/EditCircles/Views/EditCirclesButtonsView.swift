//
//  EditCirclesButtonView.swift
//  CricutAssignment
//
//  Created by Sreelash on 26/03/25.
//

import SwiftUI

enum EditCircleButton: String, CaseIterable {
    case deleteAll = "Delete All"
    case add = "Add"
    case remove = "Remove"
}

struct EditCirclesButtonsView: View {
    var editCirclesButtonAction: (EditCircleButton) -> Void
    
    var body: some View {
        let buttonItems = EditCircleButton.allCases
        
        HStack {
            ForEach(buttonItems, id: \.self) { item in
                Spacer()
                Button(action: {
                    editCirclesButtonAction(item)
                }) {
                    Text(item.rawValue)
                }
            }
            Spacer()
        }
    }
}
