//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

/// Protocol that describes a query object.
///
/// In `CQRS` the query object is only responsible for
/// executing tasks that modify the state of the application.
///
/// The command has the following properties:
/// - Query does not change the state of the system;
/// - The query context stores the data necessary for its execution;
/// - Returns a result.
///
/// For instance, you can create a query and put some data to it:
///
/// ```
/// final class MyQuery: IQuery {
///     typealias Result = Int
///
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
public protocol IQuery: AnyObject {
    associatedtype Result
}
