import XCTest
import SwiftPygmentsPublishPlugin
import Ink

final class SplashPublishPluginTests: XCTestCase {
    func testHighlightingMarkdown() {
        let parser = MarkdownParser(modifiers: [.pygmentsCodeBlocks()])
        let html = parser.html(from: """
        Swift
        ```swift
        var i = 1
        print(i)
        func test(i:Int) {
            print(i * 2)
        }
        ```
        Not highlighted
        ```no-highlight
        not.highlighted()
        ```
        
        Python
        ```python
        import numpy as np
        np.linspace(0, 100, 101)
        ```
        
        Random
        ```asdfasdfasdf
        Language not exist
        ```

        Wrong swift
        ```
        asdfasdfasfasdf
        ```
        
        """)
        
        
        
        
        
        
        print(html)
        XCTAssertEqual(html, """
        <p>Swift</p><pre><code><div class="highlight"><pre><span></span><span class="kd">var</span> <span class="nv">i</span> <span class="p">=</span> <span class="mi">1</span>
        <span class="bp">print</span><span class="p">(</span><span class="n">i</span><span class="p">)</span>
        <span class="kd">func</span> <span class="nf">test</span><span class="p">(</span><span class="n">i</span><span class="p">:</span><span class="nb">Int</span><span class="p">)</span> <span class="p">{</span>
            <span class="bp">print</span><span class="p">(</span><span class="n">i</span> <span class="o">*</span> <span class="mi">2</span><span class="p">)</span>
        <span class="p">}</span>
        </pre></div>

        </code></pre><p>Not highlighted</p><pre><code class="language-no-highlight">not.highlighted()
        </code></pre><p>Python</p><pre><code><div class="highlight"><pre><span></span><span class="kn">import</span> <span class="nn">numpy</span> <span class="kn">as</span> <span class="nn">np</span>
        <span class="n">np</span><span class="o">.</span><span class="n">linspace</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span> <span class="mi">100</span><span class="p">,</span> <span class="mi">101</span><span class="p">)</span>
        </pre></div>

        </code></pre><p>Random</p><pre><code><div class="highlight"><pre><span></span><span class="n">Language</span> <span class="n">not</span> <span class="n">exist</span>
        </pre></div>

        </code></pre><p>Wrong swift</p><pre><code><div class="highlight"><pre><span></span><span class="n">asdfasdfasfasdf</span>
        </pre></div>

        </code></pre>
        """)
    }

    static var allTests = [
        ("testHighlightingMarkdown", testHighlightingMarkdown)
    ]
}
