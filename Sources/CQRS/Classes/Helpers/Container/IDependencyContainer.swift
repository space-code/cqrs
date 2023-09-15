//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

/// Dependency injection container.
public protocol IDependencyContainer {
    /// Registers a command handler in the container.
    ///
    /// - Parameter object: The command handler that will be registered in the container.
    func register<T: ICommandHandler>(_ object: T)

    /// Registers a query handler in the container.
    ///
    /// - Parameter object: The query handler that will be registered in the container.
    func register<Q: IQueryHandler>(_ object: Q)

    /// Resolves a command handler for which the command type is equal to 'T'.
    ///
    /// - Throws: `CQRSError.failedResolve` if command handler could be resolved for the command.
    ///
    /// - Returns: A resolved command handle with  a command of type `T`.
    func resolve<T: ICommand>() throws -> any ICommandHandler<T>

    /// Resolves a query handler for which the command type is equal to 'Q'.
    ///
    /// - Throws: `CQRSError.failedResolve` if the query handler couldn't be resolved for the query.
    ///
    /// - Returns: A resolved query handle with  a query of type `Q`.
    func resolve<Q: IQuery>() throws -> any IQueryHandler<Q>
}
