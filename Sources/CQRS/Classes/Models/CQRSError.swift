//
// CQRS
// Copyright © 2023 Space Code. All rights reserved.
//

/// `CQRSError` is the error type returned by CQRS.
/// It encompasses a few different types of errors, each with their own associated reasons.
public enum CQRSError: Swift.Error {
    /// Failed to resolve object from dependency container.
    case failedResolve
}
