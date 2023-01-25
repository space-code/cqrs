//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

/// Protocol that describes a command handler.
public protocol ICommandHandler<Command> {
    associatedtype Command: ICommand

    /// Execute a command.
    ///
    /// - Throws: `CQRSError.failedResolve` failed to resolve command handler.
    ///
    /// - Parameter command: A command object.
    func execute(command: Command) throws
}
