# SwiftPygments Plugin for Publish

A Pygments plugin for Publish to highlight code. 

## Requirements

- Python
- Pygments: [https://pygments.org](https://pygments.org)
- SwiftPygments: [https://github.com/Ze0nC/SwiftPygments](https://github.com/Ze0nC/SwiftPygments)
- Swift 5

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

```
import SwiftPygmentsPublishPlugin
...
try DeliciousRecipes().publish(using: [
    .installPlugin(.pygments())
    ...
])
```

## Acknowledgement

Thanks to John Sundell (@johnsundell) for creating Publish and SplashPublishPlugin

## License
MIT License

