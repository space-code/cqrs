//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

import CQRS

final class QueryHandlerMock: IQueryHandler {
    typealias Query = QueryMock

    var invokedExecute = false
    var invokedExecuteCount = 0
    var invokedExecuteParameters: (query: QueryMock?, Void)?
    var invokedExecuteParametersList = [(query: QueryMock?, Void)]()
    var stubbedExecute: Int?

    func execute(query: QueryMock) -> Int {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteParameters = (query, ())
        invokedExecuteParametersList.append((query, ()))
        return stubbedExecute!
    }
}
