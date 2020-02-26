/**
*  Dark image plugin for Publish
*  © 2020 Guilherme Rambo
*  BSD-2 license, see LICENSE file for details
*/

import Publish
import Ink

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
    private static let noDarkMarker = "?nodark"

    static func darkImage(suffix: String) -> Self {
        return Modifier(target: .images) { html, markdown in
            let lightOnly = markdown.contains(Self.noDarkMarker)
            let input = markdown.replacingOccurrences(of: Self.noDarkMarker, with: "")

            let path = input.dropFirst("![".count).dropLast(")".count).drop(while: { $0 != "(" }).dropFirst()

            guard let dotIndex = path.lastIndex(of: ".") else { return html }

            var darkPath = path
            darkPath.insert(contentsOf: suffix, at: dotIndex)

            var altSuffix = ""
            if let alt = input.firstSubstring(between: "[", and: "]") {
                altSuffix = " alt=\"\(alt)\""
            }

            if lightOnly {
                return """
                <figure>
                    <picture>
                        <img src="\(path)"\(altSuffix)>
                    </picture>
                </figure>
                """
            } else {
                return """
                <figure>
                    <picture>
                        <source srcset="\(darkPath)" media="(prefers-color-scheme: dark)">
                        <img src="\(path)"\(altSuffix)>
                    </picture>
                </figure>
                """
            }
        }
    }
}
