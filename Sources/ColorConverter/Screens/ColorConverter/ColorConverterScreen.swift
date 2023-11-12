// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import OneWay
import SwiftUI

public struct ColorConverterScreen: View {
    @StateObject private var store: ViewStore<ColorConverterReducer>

    init(store: ViewStore<ColorConverterReducer>) {
        self._store = StateObject(wrappedValue: store)
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
                red: store.state.red,
                green: store.state.green,
                blue: store.state.blue
            )
            VStack {
                Slider(
                    value: Binding<Double>(
                        get: { store.state.red },
                        set: { store.send(.setRed($0)) }
                    ),
                    in: Double.zero ... 1.0
                )
                .tint(Color.red)

                Slider(
                    value: Binding<Double>(
                        get: { store.state.green },
                        set: { store.send(.setGreen($0)) }
                    ),
                    in: Double.zero ... 1.0
                )
                .tint(Color.green)

                Slider(
                    value: Binding<Double>(
                        get: { store.state.blue },
                        set: { store.send(.setBlue($0)) }
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
                        get: { multiplyForRGB(store.state.red) },
                        set: { store.send(.setRed(divideForRGB($0))) }
                    ),
                    prompt: Text("0 ~ 255")
                )
                TextField(
                    "G",
                    text: Binding<String>(
                        get: { multiplyForRGB(store.state.green) },
                        set: { store.send(.setGreen(divideForRGB($0))) }
                    ),
                    prompt: Text("0 ~ 255")
                )
                TextField(
                    "B",
                    text: Binding<String>(
                        get: { multiplyForRGB(store.state.blue) },
                        set: { store.send(.setBlue(divideForRGB($0))) }
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
                get: { store.state.hex.value },
                set: { store.send(.setHex($0)) }
            )
        )
    }

    private var cmykColorForm: some View {
        Form {
            HStack {
                TextField(
                    "C",
                    text: Binding<String>(
                        get: { withPercent(store.state.cmyk.cyan) },
                        set: { store.send(.setCyan(excludePercent($0))) }
                    ),
                    prompt: Text("0 ~ 100")
                )
                TextField(
                    "M",
                    text: Binding<String>(
                        get: { withPercent(store.state.cmyk.magenta) },
                        set: { store.send(.setMagenta(excludePercent($0))) }
                    ),
                    prompt: Text("0 ~ 100")
                )
                TextField(
                    "Y",
                    text: Binding<String>(
                        get: { withPercent(store.state.cmyk.yellow) },
                        set: { store.send(.setYellow(excludePercent($0))) }
                    ),
                    prompt: Text("0 ~ 100")
                )
                TextField(
                    "K",
                    text: Binding<String>(
                        get: { withPercent(store.state.cmyk.key) },
                        set: { store.send(.setKey(excludePercent($0))) }
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
                        get: { withRoundTwoDecimal(store.state.hsb.hue) },
                        set: { store.send(.setHue(Double($0) ?? .zero)) }
                    ),
                    prompt: Text("0 ~ 1.0")
                )
                TextField(
                    "S",
                    text: Binding<String>(
                        get: { withRoundTwoDecimal(store.state.hsb.saturation) },
                        set: { store.send(.setSaturation(Double($0) ?? .zero)) }
                    ),
                    prompt: Text("0 ~ 1.0")
                )
                TextField(
                    "B",
                    text: Binding<String>(
                        get: { withRoundTwoDecimal(store.state.hsb.brightness) },
                        set: { store.send(.setBrightness(Double($0) ?? .zero)) }
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

#Preview{
    let store = ViewStore(
        reducer: ColorConverterReducer(),
        state: .init(
            sourceColor: .black,
            hex: HexColor(value: "#000000"),
            cmyk: CMYKColor(cyan: .zero, magenta: .zero, yellow: .zero, key: 1.0),
            hsb: HSBColor(hue: .zero, saturation: .zero, brightness: .zero)
        )
    )
    return ColorConverterScreen(store: store)
}
