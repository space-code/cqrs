//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

/// A type that encapsulates the logic for executing a command.
public protocol ICommandHandler<Command> {
    associatedtype Command: ICommand

    /// Executes a command.
    ///
    /// - Throws: `CQRSError.failedResolve` if the command handler failed to resolve.
    ///
    /// - Parameter command: The command object.
    func execute(command: Command) throws
}
