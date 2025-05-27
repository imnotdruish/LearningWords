//
//  TabLabelStyle.swift
//  LearningWords
//
//  Created by Dan June on 5/22/25.
//

import SwiftUI

enum TabType: CaseIterable {
    case units
    case cards
    
    var titleKey: String {
        "\(self)".capitalized
    }
    
    var symbolName: String {
        switch self {
        case .units: "list.bullet"
        case .cards: "square.stack.3d.down.right.fill"
        }
    }
}

class KeyboardManager: ObservableObject {
    @Published var keyboardFrame: CGRect? = nil
    @Published var keyboardIsVisible: Bool = false
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(willChangeFrame( notification: )), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(didShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didHide), name: UIResponder.keyboardDidHideNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(willShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func willChangeFrame(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        self.keyboardFrame = keyboardScreenEndFrame
    }
    
    @objc private func willShow() {
        self.keyboardIsVisible = true
    }
    
    @objc private func didShow() {
        self.keyboardIsVisible = true
    }
    
    @objc func willHide() {
        self.keyboardFrame = .zero
    }
    
    @objc private func didHide() {
        self.keyboardIsVisible = false
    }
    
}

struct TabLabelStyle: LabelStyle {
    let isSelected: Bool
 
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 4) {
            configuration.icon
                .imageScale(.large)
            configuration.title
                .font(.caption)
        }
        .symbolVariant(isSelected ? .fill : .none)
        .foregroundStyle(isSelected ? .green : .white)
        .frame(maxWidth: .infinity)
    }
}

struct CustomTabBar: View {
    @Binding var selection: TabType
    @StateObject private var keyboardManager = KeyboardManager()

    var body: some View {
        if keyboardManager.keyboardIsVisible {
            EmptyView()
        } else {
            HStack {
                ForEach(TabType.allCases, id: \.self) { type in
                    Button {
                        withAnimation(.spring) {
                            selection = type
                        }
                    } label: {
                        Label(type.titleKey, systemImage: type.symbolName)
                            .labelStyle(TabLabelStyle(isSelected: selection == type))
                    }
                }
            }
            .padding()
            .background(.black.opacity(0))
            .ignoresSafeArea(.all)
        }
    }
}
