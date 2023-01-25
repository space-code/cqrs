//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

import CQRS

final class SecondCommandHandlerMock: ICommandHandler {
    typealias Command = SecondCommandMock

    var invokedExecute = false
    var invokedExecuteCount = 0
    var invokedExecuteParameters: (command: Command, Void)?
    var invokedExecuteParametersList = [(command: Command, Void)?]()

    func execute(command: Command) throws {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteParameters = (command, ())
        invokedExecuteParametersList.append((command, ()))
    }
}
