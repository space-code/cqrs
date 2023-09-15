//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

/// A type that is used for executing commands.
///
/// `ICommandDispatcher` is a centralized way to execute a command.
///  It resolves the appropriate command handler for a given command.
public protocol ICommandDispatcher {
    /// Executes a command that conforms to the `ICommand` protocol.
    ///
    /// A command dispatch object resolves a command handler for the given type of command.
    /// If the command handler exists in the container, the command will be executed.
    ///
    /// - Parameter command: The command object.
    ///
    /// - Throws: `CQRSError.failedResolve`if the command handler failed to resolve.
    func execute<T: ICommand>(command: T) throws
}
