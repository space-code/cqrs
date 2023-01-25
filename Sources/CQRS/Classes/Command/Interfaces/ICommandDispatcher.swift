//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

/// Protocol that describes a command dispatcher.
///
/// `ICommandDispatcher` is a centralization way to execute a command.
/// It resolves the right command handler for given command.
public protocol ICommandDispatcher {
    /// Execute a command which conforms to `ICommand` protocol.
    ///
    /// A command dispatch object resolves a command handler for given type of the command.
    /// If command handler exists in the container, the command will be executed.
    ///
    /// - Parameter command: A command object.
    ///
    /// - Throws: `CQRSError.failedResolve`failed to resolve command handler.
    func execute<T: ICommand>(command: T) throws
}
