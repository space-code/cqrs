//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

public final class CommandDispatcher: ICommandDispatcher {
    // MARK: Properties

    private let container: IDependencyContainer

    // MARK: Initialization

    public init(container: IDependencyContainer) {
        self.container = container
    }

    // MARK: ICommandDispatcher

    public func execute<T: ICommand>(command: T) throws {
        let handler = try container.resolve() as any ICommandHandler<T>
        try handler.execute(command: command)
    }
}
