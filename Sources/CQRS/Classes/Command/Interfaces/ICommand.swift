//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

/// The type to which all commands must conform.
///
/// In `CQRS` the command object is only responsible for
/// executing tasks that modify the state of the application.
///
/// The command has the following properties:
/// - Changes the state of the system;
/// - Returns nothing;
/// - The command context stores the data necessary for its execution.
///
/// For instance, you can create a command and put some data to it:
///
/// ```
/// final class MyCommand: ICommand {
///     // MARK: - Properties
///
///     let value: Int
///
///     // MARK: - Initialization
///
///     init(value: Int) {
///         self.value = value
///     }
/// }
/// ```
public protocol ICommand: AnyObject {}
