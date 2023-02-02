import SwiftPygments

internal var globalPygmentsActor = PygmentsActor()

actor PygmentsActor {
    
    internal func highlight(html: String, markdown: Substring) -> String {
        // Determine if the codeblock is wrapped by ``` or ````
        var backticks : String
        if markdown.hasPrefix("````") {
            backticks = "````"
        } else {
            backticks = "```"
        }
        
        var markdown = String(markdown.dropFirst(backticks.count))
        
        guard !markdown.hasPrefix("no-highlight") else {
            return html
        }
        
        // Default: Swift
        var lexer : Pygments.Lexer = .swift
        
        if !markdown.hasPrefix("\n"),
            let language = markdown.split(separator: "\n").first,
            let aLexer = Pygments.Lexer.named(String(language).trimmingCharacters(in: .whitespacesAndNewlines)) {
            // Found language matching. Override default lexer.
            lexer = aLexer
        }
        markdown = String(markdown
            .drop(while: { !$0.isNewline })
            .dropFirst()
            .dropLast("\n\(backticks)".count)
        )
        
        var highlighted = Pygments.html(String(markdown), use: lexer)
        highlighted = highlighted.replacingOccurrences(of: "<pre>", with: "")
        highlighted = highlighted.replacingOccurrences(of: "</pre>", with: "")
        highlighted = highlighted.trimmingCharacters(in: .newlines)
        
        return "<pre><code>" + highlighted + "</code></pre>"
    }
    
}
