//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

import CQRS

final class CommandHandlerMock: ICommandHandler {
    typealias Command = CommandMock

    var invokedExecute = false
    var invokedExecuteCount = 0
    var invokedExecuteParameters: (command: CommandMock, Void)?
    var invokedExecuteParametersList = [(command: CommandMock, Void)?]()

    func execute(command: CommandMock) throws {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteParameters = (command, ())
        invokedExecuteParametersList.append((command, ()))
    }
}
