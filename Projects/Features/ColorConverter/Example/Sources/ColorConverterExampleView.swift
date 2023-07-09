// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverterContainer
import ColorConverterInterface
import Factory
import SwiftUI

struct ColorConverterExampleView: View {

    @Injected(\ColorConverterContainer.colorConverterBuilder)
    private var colorConverterBuilder

    var body: some View {
        colorConverterBuilder(ColorConverterDependency(text: "Live!!"))
    }

}

struct ColorConverterExampleView_Previews: PreviewProvider {

    static var previews: some View {
        ColorConverterExampleView()
    }

}
