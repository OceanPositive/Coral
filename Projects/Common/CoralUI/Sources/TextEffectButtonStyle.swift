// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import SwiftUI

public struct EffectButtonStyle<Content: View>: ButtonStyle {

    let effectView: Content
    @State private var showsEffect: Bool = false

    public init(_ effectView: Content) {
        self.effectView = effectView
    }

    public func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 0) {
            if showsEffect {
                effectView
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            } else {
                configuration
                    .label
            }
        }
        .clipped()
        .onChange(of: configuration.isPressed) { newValue in
            guard newValue, !showsEffect else { return }

            showsEffect = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.default) {
                    showsEffect = false
                }
            }
        }
        .animation(.spring(), value: showsEffect)
    }

}
