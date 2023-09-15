//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

/// A type that encapsulates the logic for executing a query.
public protocol IQueryHandler<Query> {
    associatedtype Query: IQuery

    /// Executes a query.
    ///
    /// - Throws: `CQRSError.failedResolve`if the command handler failed to resolve.
    ///
    /// - Parameter query: The query object.
    func execute(query: Query) -> Query.Result
}
