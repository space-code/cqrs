//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

import Dip

// MARK: - DependencyContainer

public final class DependencyContainer {
    // MARK: Properties

    private let container: Dip.DependencyContainer

    // MARK: Initialization

    public init() {
        container = Dip.DependencyContainer()
    }
}

// MARK: IDependencyContainer

extension DependencyContainer: IDependencyContainer {
    public func register<T: ICommandHandler>(_ object: T) {
        container.register { object as any ICommandHandler<T.Command> }
    }

    public func register<Q: IQueryHandler>(_ object: Q) {
        container.register { object as any IQueryHandler<Q.Query> }
    }

    public func resolve<T: ICommand>() throws -> any ICommandHandler<T> {
        do {
            return try container.resolve()
        } catch {
            throw CQRSError.failedResolve
        }
    }

    public func resolve<Q: IQuery>() throws -> any IQueryHandler<Q> {
        do {
            return try container.resolve()
        } catch {
            throw CQRSError.failedResolve
        }
    }
}
