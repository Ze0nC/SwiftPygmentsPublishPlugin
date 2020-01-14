# SwiftPygments Plugin for Publish

A Pygments plugin for [Publish](https://github.com/johnsundell/publish) to highlight code. 

## Requirements

- Python
- Pygments: [https://pygments.org](https://pygments.org)
- SwiftPygments: [https://github.com/Ze0nC/SwiftPygments](https://github.com/Ze0nC/SwiftPygments)
- Swift 5
- Pygments color scheme in your .css file

SwiftPygments uses `PythonKit` to interact with Pygments.

Pygments can be installed via
``` zsh
pip3 install pygments
```

### Swift Package Manager
```swift
let package = Package(
    ...
    dependencies: [
    .package(url: "https://github.com/Ze0nC/SwiftPygmentsPublishPlugin", .branch("master"))
    ],
    targets: [
        .target(
            ...
            dependencies: [
                ...
                "SwiftPygmentsPublishPlugin"
            ]
        )
    ]
    ...
)
```


## Usage:

```swift
import SwiftPygmentsPublishPlugin
...
try DeliciousRecipes().publish(using: [
    .installPlugin(.pygments())
    ...
])
```

If the code block isn't marked with any language, it will be treated as swift. 


## Acknowledgement

Thanks to John Sundell (@johnsundell) for creating [Publish](https://github.com/johnsundell/publish) and SplashPublishPlugin

## License
MIT License

