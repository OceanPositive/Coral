// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import SwiftUI

public struct CoralSettings: View {

    @AppStorage("isDebug")
    private var isDebug: Bool = true

    public init() {}

    public var body: some View {
        Form {
            Toggle(isOn: $isDebug) {
                Text("Debug Mode")
            }
        }
        .frame(width: 300)
        .navigationTitle("Coral Settings")
        .padding(80)
    }

}

struct CoralSettings_Previews: PreviewProvider {

    static var previews: some View {
        CoralSettings()
    }

}
