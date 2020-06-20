/**
*  Dark image plugin for Publish
*  © 2020 Guilherme Rambo
*  BSD-2 license, see LICENSE file for details
*/

import Publish
import Ink
import Files

public extension Plugin {
    static func darkImage(suffix: String = "-dark") -> Self {
        Plugin(name: "DarkImage") { context in
            context.markdownParser.addModifier(
                .darkImage(suffix: suffix, context: context)
            )
        }
    }
}

public extension Modifier {
    static func darkImage<Site: Website>(suffix: String, context: PublishingContext<Site>) -> Self {
        return Modifier(target: .images) { html, markdown in
            let input = markdown

            let imagePath = input.dropFirst("![".count).dropLast(")".count).drop(while: { $0 != "(" }).dropFirst()

            guard let dotIndex = imagePath.lastIndex(of: ".") else { return html }

            var darkImagePath = imagePath
            darkImagePath.insert(contentsOf: suffix, at: dotIndex)

            let hasDarkImage = (try? context.file(at: Path(String(darkImagePath)))) != nil

            var altSuffix = ""
            if let alt = input.firstSubstring(between: "[", and: "]") {
                altSuffix = " alt=\"\(alt)\""
            }

            if hasDarkImage {
                return """
                <figure>
                <picture>
                <source srcset="\(darkImagePath)" media="(prefers-color-scheme: dark)">
                <img src="\(imagePath)"\(altSuffix)>
                </picture>
                </figure>
                """
            } else {
                return """
                <figure>
                <picture>
                <img src="\(imagePath)"\(altSuffix)>
                </picture>
                </figure>
                """
            }
        }
    }
}
