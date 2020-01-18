import SwiftPygments
import Publish
import Ink

public extension Plugin {
    static func pygments() -> Self {
        Plugin(name: "Pygments") { context in
            context.markdownParser.addModifier(
                .pygmentsCodeBlocks()
            )
        }
    }
}

public extension Modifier {
    static func pygmentsCodeBlocks() -> Self {
        return Modifier(target: .codeBlocks) { html, markdown in
            var markdown = markdown.dropFirst("```".count)

            guard !markdown.hasPrefix("no-highlight") else {
                return html
            }
            
            var lexer : Pygments.Lexer = .swift
            
            if !markdown.hasPrefix("\n"),
                let language = markdown.split(separator: "\n").first,
                let aLexer = Pygments.Lexer.named(String(language).trimmingCharacters(in: .whitespacesAndNewlines)) {
                // Found language matching. Override default lexer.
                lexer = aLexer
            }
            markdown = markdown
                .drop(while: { !$0.isNewline })
                .dropFirst()
                .dropLast("\n```".count)

            var highlighted = Pygments.html(String(markdown), use: lexer)
            highlighted = highlighted.replacingOccurrences(of: "<pre>", with: "")
            highlighted = highlighted.replacingOccurrences(of: "</pre>", with: "")
            highlighted = highlighted.trimmingCharacters(in: .newlines)
            return "<pre><code>" + highlighted + "</code></pre>"
        }
    }
}


struct SwiftPygmentsPublishPlugin {
    var text = "Hello, World!"
    
}
