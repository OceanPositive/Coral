// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import Foundation
import MarkdownPreview
import MarkdownPreviewTesting
import XCTest

final class MarkdownPreviewTests: XCTestCase {

    func test_example() {
        MarkdownPreviewMock.hello()
        XCTAssertEqual("MarkdownPreview", "MarkdownPreview")
    }

}
