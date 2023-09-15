//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

/// A type that is used for executing queries.
///
/// `IQueryDispatcher` is a centralized way to execute a query.
///  It resolves the appropriate query handler for a given query.
public protocol IQueryDispatcher {
    /// Executes a query that conforms to the `IQuery` protocol.
    ///
    /// A query dispatch object resolves a query handler for the given type of query.
    /// If the query handler exists in the container, the query will be executed.
    ///
    /// - Parameter command: The query object.
    ///
    /// - Throws: `CQRSError.failedResolve`if the query handler failed to resolve.
    ///
    /// - Returns: A query result.
    func execute<Q: IQuery>(query: Q) throws -> Q.Result
}
