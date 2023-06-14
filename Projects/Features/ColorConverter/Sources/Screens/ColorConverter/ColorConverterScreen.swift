// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverterInterface
import SwiftUI

public struct ColorConverterScreen: View {

    @StateObject private var way: ColorConverterWay

    init(way: ColorConverterWay) {
        self._way = StateObject(wrappedValue: way)
    }

    public var body: some View {
        VStack {
            List {
                colorSlider

                Section {
                    rgbColorForm
                } header: {
                    Text("RGB")
                        .font(.headline)
                }

                Section {
                    hexColorForm
                } header: {
                    Text("HEX")
                        .font(.headline)
                }

                Section {
                    cmykColorForm
                } header: {
                    Text("CMYK")
                        .font(.headline)
                }

                Section {
                    hsbColorForm
                } header: {
                    Text("HSB")
                        .font(.headline)
                }
            }
            .textFieldStyle(.roundedBorder)
        }
    }

    private var colorSlider: some View {
        HStack {
            Color(
                red: way.state.red,
                green: way.state.green,
                blue: way.state.blue
            )
            VStack {
                Slider(
                    value: Binding<Double>(
                        get: { way.state.red },
                        set: { way.send(.setRed($0)) }
                    ),
                    in: Double.zero ... 1.0
                )
                .tint(Color.red)

                Slider(
                    value: Binding<Double>(
                        get: { way.state.green },
                        set: { way.send(.setGreen($0)) }
                    ),
                    in: Double.zero ... 1.0
                )
                .tint(Color.green)

                Slider(
                    value: Binding<Double>(
                        get: { way.state.blue },
                        set: { way.send(.setBlue($0)) }
                    ),
                    in: Double.zero ... 1.0
                )
                .tint(Color.blue)
            }
        }
    }

    private var rgbColorForm: some View {
        Form {
            HStack {
                TextField(
                    "R",
                    text: Binding<String>(
                        get: { multiplyForRGB(way.state.red) },
                        set: { way.send(.setRed(divideForRGB($0))) }
                    ),
                    prompt: Text("0 ~ 255")
                )
                TextField(
                    "G",
                    text: Binding<String>(
                        get: { multiplyForRGB(way.state.green) },
                        set: { way.send(.setGreen(divideForRGB($0))) }
                    ),
                    prompt: Text("0 ~ 255")
                )
                TextField(
                    "B",
                    text: Binding<String>(
                        get: { multiplyForRGB(way.state.blue) },
                        set: { way.send(.setBlue(divideForRGB($0))) }
                    ),
                    prompt: Text("0 ~ 255")
                )
            }
        }
    }

    private var hexColorForm: some View {
        TextField(
            "HEX",
            text: Binding<String>(
                get: { way.state.hex.value },
                set: { way.send(.setHex($0)) }
            )
        )
    }

    private var cmykColorForm: some View {
        Form {
            HStack {
                TextField(
                    "C",
                    text: Binding<String>(
                        get: { withPercent(way.state.cmyk.cyan) },
                        set: { way.send(.setCyan(excludePercent($0))) }
                    ),
                    prompt: Text("0 ~ 100")
                )
                TextField(
                    "M",
                    text: Binding<String>(
                        get: { withPercent(way.state.cmyk.magenta) },
                        set: { way.send(.setMagenta(excludePercent($0))) }
                    ),
                    prompt: Text("0 ~ 100")
                )
                TextField(
                    "Y",
                    text: Binding<String>(
                        get: { withPercent(way.state.cmyk.yellow) },
                        set: { way.send(.setYellow(excludePercent($0))) }
                    ),
                    prompt: Text("0 ~ 100")
                )
                TextField(
                    "K",
                    text: Binding<String>(
                        get: { withPercent(way.state.cmyk.key) },
                        set: { way.send(.setKey(excludePercent($0))) }
                    ),
                    prompt: Text("0 ~ 100")
                )
            }
        }
    }

    private var hsbColorForm: some View {
        Form {
            HStack {
                TextField(
                    "H",
                    text: Binding<String>(
                        get: { withRoundTwoDecimal(way.state.hsb.hue) },
                        set: { way.send(.setHue(Double($0) ?? .zero)) }
                    ),
                    prompt: Text("0 ~ 1.0")
                )
                TextField(
                    "S",
                    text: Binding<String>(
                        get: { withRoundTwoDecimal(way.state.hsb.saturation) },
                        set: { way.send(.setSaturation(Double($0) ?? .zero)) }
                    ),
                    prompt: Text("0 ~ 1.0")
                )
                TextField(
                    "B",
                    text: Binding<String>(
                        get: { withRoundTwoDecimal(way.state.hsb.brightness) },
                        set: { way.send(.setBrightness(Double($0) ?? .zero)) }
                    ),
                    prompt: Text("0 ~ 1.0")
                )
            }
        }
    }

    private func multiplyForRGB(_ value: Double) -> String {
        String(format: "%d", Int(value * 255.0))
    }

    private func divideForRGB(_ value: String) -> Double {
        (Double(value) ?? .zero) / 255.0
    }

    private func withPercent(_ value: Double) -> String {
        String(format: "%d%%", Int(round(value * 100.0)))
    }

    private func withRoundTwoDecimal(_ value: Double) -> String {
        String(format: "%.2f", value)
    }

    private func excludePercent(_ value: String) -> Double {
        Double(value.replacingOccurrences(of: "%", with: "")) ?? .zero
    }

}

struct ColorConverterView_Previews: PreviewProvider {

    static var previews: some View {
        let way = ColorConverterWay(
            initialState: .init(
                sourceColor: .black,
                hex: HexColor(value: "#000000"),
                cmyk: CMYKColor(cyan: .zero, magenta: .zero, yellow: .zero, key: 1.0),
                hsb: HSBColor(hue: .zero, saturation: .zero, brightness: .zero)
            )
        )
        return ColorConverterScreen(way: way)
    }

}
