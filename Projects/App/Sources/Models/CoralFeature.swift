// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation

enum CoralFeature: CaseIterable, Identifiable {

    case colorConverter
    case caseConverter
    case lineSorter
    case markdownPreview

    var id: CoralFeature { self }

    var title: String {
        switch self {
        case .colorConverter: return "🎨 Color Converter"
        case .caseConverter: return "🐪 Case Converter"
        case .lineSorter: return "🏛️ Line Sorter"
        case .markdownPreview: return "🔬 Markdown Preview"
        }
    }

}
