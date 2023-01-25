//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

// MARK: - QueryDispatcher

public final class QueryDispatcher {
    // MARK: Properties

    private let container: IDependencyContainer

    // MARK: Initialization

    public init(container: IDependencyContainer) {
        self.container = container
    }
}

// MARK: IQueryDispatcher

extension QueryDispatcher: IQueryDispatcher {
    public func execute<Q: IQuery>(query: Q) throws -> Q.Result {
        let handler = try container.resolve() as any IQueryHandler<Q>
        // swiftlint:disable:next force_cast
        return handler.execute(query: query) as! Q.Result
    }
}
