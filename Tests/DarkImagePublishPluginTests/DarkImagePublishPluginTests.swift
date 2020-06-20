import XCTest
import DarkImagePublishPlugin
import Ink

// TODO: update tests for new architecture
//final class DarkImagePublishPluginTests: XCTestCase {
//    func testGeneratingFigureTagsForImage() {
//        let parser = MarkdownParser(modifiers: [.darkImage(suffix: "-dark")])
//        let html = parser.html(from: "![some image](/assets/img/2/1.png)")
//
//        XCTAssertEqual(html, """
//        <figure>
//            <picture>
//                <source srcset="/assets/img/2/1-dark.png" media="(prefers-color-scheme: dark)">
//                <img src="/assets/img/2/1.png" alt="some image">
//            </picture>
//        </figure>
//        """)
//    }
//
//    func testNoDarkMarker() {
//        let parser = MarkdownParser(modifiers: [.darkImage(suffix: "-dark")])
//        let html = parser.html(from: "![some image](/assets/img/2/1.png?nodark)")
//
//        XCTAssertEqual(html, """
//        <figure>
//            <picture>
//                <img src="/assets/img/2/1.png" alt="some image">
//            </picture>
//        </figure>
//        """)
//    }
//
//    static var allTests = [
//        ("testGeneratingFigureTagsForImage", testGeneratingFigureTagsForImage),
//        ("testNoDarkMarker", testNoDarkMarker),
//    ]
//}
//
