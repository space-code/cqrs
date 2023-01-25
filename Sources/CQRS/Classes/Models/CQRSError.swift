//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

public enum CQRSError: Swift.Error {
    /// Failed to resolve object from dependency container.
    case failedResolve
}
