//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

/// Protocol that describes a query dispatcher.
///
/// `IQueryDispatcher` is a centralization way to execute a query.
/// It resolves the correct query handler for the given query.
public protocol IQueryDispatcher {
    /// Execute a query which conforms to `IQuery` protocol.
    ///
    /// A query dispatch object resolves a query handler for given type of the query.
    /// If query handler exists in the container, the query will be executed.
    ///
    /// - Parameter query: A query object.
    ///
    /// - Throws: `CQRSError.failedResolve`failed to resolve command handler.
    ///
    /// - Returns: A query result.
    func execute<Q: IQuery>(query: Q) throws -> Q.Result
}
