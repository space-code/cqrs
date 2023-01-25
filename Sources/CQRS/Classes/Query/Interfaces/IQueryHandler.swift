//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

/// Protocol that describes a query handler.
public protocol IQueryHandler<Query> {
    associatedtype Query: IQuery

    /// Execute a query.
    ///
    /// - Throws: `CQRSError.failedResolve` failed to resolve query handler.
    ///
    /// - Parameter query: A query object.
    func execute(query: Query) -> Query.Result
}
