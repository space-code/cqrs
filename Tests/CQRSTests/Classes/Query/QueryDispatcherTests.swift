//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

@testable import CQRS
import XCTest

// MARK: - QueryDispatcherTests

final class QueryDispatcherTests: XCTestCase {
    // MARK: Properties

    private var queryDispatcher: IQueryDispatcher!
    private var container: IDependencyContainer!

    // MARK: XCTestCase

    override func setUp() {
        super.setUp()
        container = DependencyContainer()
        queryDispatcher = QueryDispatcher(container: container)
    }

    override func tearDown() {
        container = nil
        queryDispatcher = nil
        super.tearDown()
    }

    // MARK: Tests

    func test_thatQueryDispatcherExecutesCommand_whenQueryHandlerExistsInContainer() throws {
        // given
        let queryHandler = QueryHandlerMock()
        queryHandler.stubbedExecute = .queryValue
        let query = QueryMock(value: .queryValue)
        prepareContainer(with: [queryHandler])

        // when
        let result = try queryDispatcher.execute(query: query)

        // then
        XCTAssertTrue(queryHandler.invokedExecute)
        XCTAssertTrue(queryHandler.invokedExecuteParameters?.query === query)
        XCTAssertEqual(queryHandler.invokedExecuteCount, 1)
        XCTAssertEqual(result, .queryValue)
    }

    func test_thatQueryDispatcherThrowsAnError_whenQueryHandlerDoesNotExistInContainer() throws {
        // given
        let query = QueryMock(value: .queryValue)

        // then
        do {
            _ = try queryDispatcher.execute(query: query)
            XCTFail("The QueryDispatcher must throw an error because a query handler does not exist in the container")
        } catch {
            XCTAssertEqual(error as? CQRSError, .failedResolve)
        }
    }

    // MARK: Private

    private func prepareContainer(with queryHandlers: [any IQueryHandler]) {
        queryHandlers.forEach { container.register($0) }
    }
}

// MARK: - Constants

private extension Int {
    static let queryValue = 12031
}
