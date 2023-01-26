![cqrs: The Command and Query Responsibility Segregation](https://raw.githubusercontent.com/space-code/cqrs/main/Resources/cqrs.png)

<h1 align="center" style="margin-top: 0px;">cqrs</h1>

<p align="center">
<a href="https://github.com/space-code/cqrs/blob/main/LICENSE"><img alt="License" src="https://img.shields.io/github/license/space-code/cqrs?style=flat"></a> 
<a href="https://developer.apple.com/"><img alt="Platform" src="https://img.shields.io/badge/platform-ios%20%7C%20osx%20%7C%20watchos%20%7C%20tvos-%23989898"/></a> 
<a href="https://developer.apple.com/swift"><img alt="Swift5.7" src="https://img.shields.io/badge/language-Swift5.7-orange.svg"/></a>
<a href="https://github.com/space-code/cqrs"><img alt="CI" src="https://github.com/space-code/cqrs/actions/workflows/ci.yml/badge.svg?branch=main"></a>
<a href="https://github.com/apple/swift-package-manager" alt="RxSwift on Swift Package Manager" title="cqrs on Swift Package Manager"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" /></a>
</p>

## Description
`cqrs` is an implementation of the command and query responsibility segregation in Swift

- [Usage](#usage)
- [Requirements](#requirements)
- [Installation](#installation)
- [Communication](#communication)
- [Contributing](#contributing)
- [Author](#author)
- [License](#license)

## Usage

1. Create an instance of a command or a query conforms to `ICommand` or `IQuery` respectively:
```swift
import CQRS

final class ExampleCommand: ICommand {
  // MARK: Properties
 
  let value: Int
 
  // MARK: Initialization
  
  init(value: Int) {
    self.value = value
  }
}
```

```swift
import CQRS

final class ExampleQuery: IQueue {
    typealias Result = Int

    // MARK: Properties

    let value: Int

    // MARK: Initialization

    init(value: Int) {
        self.value = value
    }
}
```

2. Create an instance of a command handler or a query handler conforms to `ICommandHandler` or `IQueryHandler` respectively:
```swift
import CQRS

final class ExampleCommandHandler: ICommandHandler {
  typealias Command = ExampleCommand

  // MARK: ICommandHandler

  func execute(command: Command) throws {
    // write execution logic
  }
}
```

```swift
import CQRS

final class ExampleQueryHandler: IQueryHandler {
    typealias Query = ExampleQuery

    // MARK: IQueryHandler

    func execute(query: Query) throws -> Query.Result {
        // write execution logic
    }
}
```

3. Register your handler implementation in container:
```swift
import CQRS

let container = DependencyContainer()
container.register { ExampleCommandHandler() }
```

```swift
import CQRS

let container = DependencyContainer()
container.register { ExampleQueryHandler() }
```

4. Create an instance of a `CommandDispatcher` or a `QueryDispatcher` with created container, like this:
```swift
import CQRS

let commandDispatcher = CommandDispatcher(container: container)
```

```swift
import CQRS

let commandDispatcher = QueryDispatcher(container: container)
```

5. Execute your command on `commandDispatcher` or `queryDispatcher`:
```swift
let command = ExampleCommand()

do {
  try commandDispatcher.execute(command: command)
} catch {
  // Handle an error.
}
```

```swift
let query = ExampleCommand()

do {
  let result = try queryDispatcher.execute(query: query)
} catch {
  // Handle an error.
}
```

## Requirements
- iOS 16.0+ / macOS 13+ / tvOS 16.0+ / watchOS 9.0+
- Xcode 14.0
- Swift 5.7

## Installation
### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but `
cqrs` does support its use on supported platforms.

Once you have your Swift package set up, adding `cqrs` as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/space-code/cqrs.git", .upToNextMajor(from: "1.0.0"))
]
```

## Communication
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Contributing
Bootstrapping development environment

```
make bootstrap
```

Please feel free to help out with this project! If you see something that could be made better or want a new feature, open up an issue or send a Pull Request!

## Author
Nikita Vasilev, nv3212@gmail.com

## License
cqrs is available under the MIT license. See the LICENSE file for more info.
