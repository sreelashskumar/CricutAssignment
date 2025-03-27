//
//  ShapesView.swift
//  CricutAssignment
//
//  Created by Sreelash on 25/03/25.
//

import SwiftUI

struct ShapesView: View {
    @StateObject private var vm = ShapesViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ShapeGridView(shapes: vm.shapes)
                Spacer()
                ShapesButtonsView(
                    shapeButtons: vm.buttons,
                    shapeButtonAction: { button in
                        vm.addDrawPath(shapeButton: button)
                })
            }
            .navigationDestination(for: ShapesNavigation.self) { value in
                switch value {
                case .editCircles:
                    let editCirclesVM = EditCirclesViewModel(shapes: $vm.shapes)
                    EditCirclesView(vm: editCirclesVM)
                }
            }
            .navigationTitle(AppConstants.ShapesView.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        vm.clearAllDrawPaths()
                    }) {
                        Text(AppConstants.ShapesView.clearAllButtonTitle)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(value: ShapesNavigation.editCircles) {
                        Text(AppConstants.ShapesView.editCirclesButtonTitle)
                    }
                }
            }
            .onAppear {
                Task {
                    await vm.fetchButtons()
                }
            }
            .alertMessage(alertMessageWrapper: $vm.alertMessageWrapper)
        }
    }
}
