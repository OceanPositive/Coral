// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import SwiftUI

public struct CopyButton: View {

    let action: () -> Void

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Image(systemName: "doc.on.doc.fill")
                .font(Font.body.bold())
                .imageScale(.large)
                .foregroundColor(Color.white)
        }
        .buttonStyle(EffectButtonStyle(effectView))
    }

    var effectView: some View {
        HStack(spacing: 4) {
            Image(systemName: "checkmark")
                .font(Font.body.bold())
                .imageScale(.large)
                .foregroundColor(Color.white)

            Text("Copied!")
                .font(Font.body.bold())
                .transition(.move(edge: .trailing).combined(with: .opacity))
                .foregroundColor(.white)
        }
    }

}
