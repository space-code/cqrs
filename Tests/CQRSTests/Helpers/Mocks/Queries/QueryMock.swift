//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

import CQRS

final class QueryMock: IQuery {
    typealias Result = Int

    let value: Int

    init(value: Int) {
        self.value = value
    }
}
