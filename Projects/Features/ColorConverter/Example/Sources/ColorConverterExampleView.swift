// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverter
import ColorConverterInterface
import Dependencies
import SwiftUI

struct ColorConverterExampleView: View {

    @Dependency(\.colorConverterBuilder) var colorConverterBuilder

    var body: some View {
        colorConverterBuilder(ColorConverterDependency(text: "Live!!"))
    }

}

struct ColorConverterExampleView_Previews: PreviewProvider {

    static var previews: some View {
        ColorConverterExampleView()
    }

}
