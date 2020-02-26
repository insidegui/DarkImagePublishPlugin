/**
*  Dark image plugin for Publish
*  © 2020 Guilherme Rambo
*  BSD-2 license, see LICENSE file for details
*/

import Publish
import Ink
import Foundation

public extension Plugin {
    static func darkImage(suffix: String = "-dark") -> Self {
        Plugin(name: "DarkImage") { context in
            context.markdownParser.addModifier(
                .darkImage(suffix: suffix)
            )
        }
    }
}

public extension Modifier {
    static func darkImage(suffix: String) -> Self {
        return Modifier(target: .images) { html, markdown in
            let path = markdown.dropFirst("![".count).dropLast(")".count).drop(while: { $0 != "(" }).dropFirst()

            guard let dotIndex = path.lastIndex(of: ".") else { return html }

            var darkPath = path
            darkPath.insert(contentsOf: suffix, at: dotIndex)

            var altSuffix = ""
            if let alt = markdown.firstSubstring(between: "[", and: "]") {
                altSuffix = " alt=\"\(alt)\""
            }

            return """
            <figure class="dark">
                <img src="\(darkPath)"\(altSuffix)>
            </figure>
            <figure class="light">
                <img src="\(path)"\(altSuffix)>
            </figure>
            """
        }
    }
}
