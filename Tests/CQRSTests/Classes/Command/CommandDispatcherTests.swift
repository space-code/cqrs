//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

@testable import CQRS
import Foundation
import XCTest

final class CommandDispatcherTests: XCTestCase {
    // MARK: Properties

    private var commandDispatcher: ICommandDispatcher!
    private var commandHandler: CommandHandlerMock!
    private var container: IDependencyContainer!

    // MARK: XCTestCase

    override func setUp() {
        super.setUp()
        container = DependencyContainer()
        commandHandler = CommandHandlerMock()
        commandDispatcher = CommandDispatcher(container: container)
    }

    override func tearDown() {
        commandDispatcher = nil
        container = nil
        super.tearDown()
    }

    // MARK: Tests

    func test_thatCommandDispatcherExecuteCommand_whenCommandHandlerExistsInContainer() throws {
        // given
        let command = CommandMock()
        prepareContainer(with: [commandHandler])

        // when
        try commandDispatcher.execute(command: command)

        // then
        XCTAssertTrue(commandHandler.invokedExecute)
        XCTAssertEqual(commandHandler.invokedExecuteCount, 1)
        XCTAssertTrue(commandHandler.invokedExecuteParameters?.command === command)
    }

    func test_thatCommandDispatcherThrowAnError_whenCommandHandlerDoesNotExistInContainer() throws {
        // given
        let command = CommandMock()

        // then
        do {
            try commandDispatcher.execute(command: command)
            XCTFail("CommandDispatcher must throw an error because of a command handler does not exists in the container.")
        } catch {
            XCTAssertEqual(error as? CQRSError, .failedResolve)
        }
    }

    func test_thatCommandDispatcherExecuteCommandOnRightHandler_whenCoupleOfHandlersExist() throws {
        // given
        let command = CommandMock()
        let secondCommandHandlerMock = SecondCommandHandlerMock()
        prepareContainer(with: [commandHandler, secondCommandHandlerMock])

        // when
        try commandDispatcher.execute(command: command)

        // then
        XCTAssertTrue(commandHandler.invokedExecute)
        XCTAssertEqual(commandHandler.invokedExecuteCount, 1)
        XCTAssertTrue(commandHandler.invokedExecuteParameters?.command === command)
    }

    // MARK: Private

    private func prepareContainer(with commandHandlers: [any ICommandHandler]) {
        commandHandlers.forEach { container.register($0) }
    }
}
