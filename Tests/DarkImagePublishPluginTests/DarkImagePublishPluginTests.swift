import XCTest
import DarkImagePublishPlugin
import Ink

final class DarkImagePublishPluginTests: XCTestCase {
    func testGeneratingFigureTagsForImage() {
        let parser = MarkdownParser(modifiers: [.darkImage(suffix: "-dark")])
        let html = parser.html(from: "![some image](/assets/img/2/1.png)")

        XCTAssertEqual(html, """
        <figure class="dark">
            <img src="/assets/img/2/1-dark.png" alt="some image">
        </figure>
        <figure class="light">
            <img src="/assets/img/2/1.png" alt="some image">
        </figure>
        """)
    }

    func testNoDarkMarker() {
        let parser = MarkdownParser(modifiers: [.darkImage(suffix: "-dark")])
        let html = parser.html(from: "![some image](/assets/img/2/1.png?nodark)")

        XCTAssertEqual(html, """
        <figure>
            <img src="/assets/img/2/1.png" alt="some image">
        </figure>
        """)
    }

    static var allTests = [
        ("testGeneratingFigureTagsForImage", testGeneratingFigureTagsForImage),
        ("testNoDarkMarker", testNoDarkMarker),
    ]
}

