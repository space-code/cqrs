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

    /// Register a query handler in the container.
    ///
    /// - Parameter object: A query handler which will be register in thr container.
    func register<Q: IQueryHandler>(_ object: Q)

    /// Resolve a command handler that command type is equal to `T`.
    ///
    /// - Throws: `CQRSError.failedResolve` if command handler could be resolved for the command.
    ///
    /// - Returns: Resolver command handler with `T` command type.
    func resolve<T: ICommand>() throws -> any ICommandHandler<T>

    /// Resolve a query handler that command type is equal to `Q`.
    ///
    /// - Throws: `CQRSError.failedResolve` if query handler could be resolved for the query.
    ///
    /// - Returns: Resolver query handler with `Q` command type.
    func resolve<Q: IQuery>() throws -> any IQueryHandler<Q>
}
