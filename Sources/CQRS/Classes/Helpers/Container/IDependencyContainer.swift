//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

// Dependency injection container.
public protocol IDependencyContainer {
    /// Register a command handler in the container.
    ///
    /// - Parameter object: A command handler which will be register in the container.
    func register<T: ICommandHandler>(_ object: T)

    /// Resolve a command handler that command type is equal to `T`.
    ///
    /// - Throws: `CQRSError.failedResolve` if command handler could be resolved for the command.
    ///
    /// - Returns: Resolver command handler with `T` command type.
    func resolve<T: ICommand>() throws -> any ICommandHandler<T>
}
