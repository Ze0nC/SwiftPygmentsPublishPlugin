import SwiftPygments
import Publish
import Ink
import Foundation

public extension Plugin {
    
    /// Pygments Plugin.
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
            
            let semaphore = DispatchSemaphore(value: 0)
            var result: String?
            let completionHandler = { result = $0 }
            
            Task {
                let result = await globalPygmentsActor.highlight(html: html, markdown: markdown)
                completionHandler(result)
                semaphore.signal()
            }
            
            semaphore.wait()
            return result!
        }
    }
}
