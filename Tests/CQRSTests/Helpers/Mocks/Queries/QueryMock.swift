import CQRS

final class QueryMock: IQuery {
    typealias Result = Int

    let value: Int

    init(value: Int) {
        self.value = value
    }
}
