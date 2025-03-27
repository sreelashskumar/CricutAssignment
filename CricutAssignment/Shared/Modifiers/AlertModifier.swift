//
//  AlertModifier.swift
//  CricutAssignment
//
//  Created by Sreelash on 25/03/25.
//

import SwiftUI

enum AlertButtonType {
    case `default`(title: String, action: (() -> Void)? = nil)
    case cancel(title: String, action: (() -> Void)? = nil)
    case destructive(title: String, action: (() -> Void)? = nil)
    
    func toAlertButton() -> Alert.Button {
        switch self {
        case .default(let title, let action):
            return .default(Text(title), action: {
                action?()
            })
        case .cancel(let title, let action):
            return .cancel(Text(title), action: {
                action?()
            })
        case .destructive(let title, let action):
            return .destructive(Text(title), action: {
                action?()
            })
        }
    }
}

struct AlertMessageWrapper: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let primaryButtonType: AlertButtonType
    let secondaryButtonType: AlertButtonType?
    
    init(
        title: String,
        message: String,
        primaryButtonType: AlertButtonType,
        secondaryButtonType: AlertButtonType? = nil
    ) {
        self.title = title
        self.message = message
        self.primaryButtonType = primaryButtonType
        self.secondaryButtonType = secondaryButtonType
    }
}

struct AlertModifier: ViewModifier {
    @Binding var messageWrapper: AlertMessageWrapper?
    
    func body(content: Content) -> some View {
        content
            .alert(item: $messageWrapper) { alertMessage in
                if let secondaryButtonType = alertMessage.secondaryButtonType {
                    Alert(
                        title: Text(alertMessage.title),
                        message: Text(alertMessage.message),
                        primaryButton: alertMessage.primaryButtonType.toAlertButton(),
                        secondaryButton: secondaryButtonType.toAlertButton()
                    )
                } else {
                    Alert(
                        title: Text(alertMessage.title),
                        message: Text(alertMessage.message),
                        dismissButton: alertMessage.primaryButtonType.toAlertButton()
                    )
                }
            }
    }
}

extension View {
    func alertMessage(alertMessageWrapper: Binding<AlertMessageWrapper?>) -> some View {
        self.modifier(AlertModifier(messageWrapper: alertMessageWrapper))
    }
}
