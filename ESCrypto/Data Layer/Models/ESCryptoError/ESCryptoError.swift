//
//  ESCryptoError.swift
//  ESCrypto
//
//  Created by Дмитрий Торопкин on 09.05.2020.
//  Copyright © 2020 Dmitriy Toropkin. All rights reserved.
//

import Foundation

/// Enum with errors for catch this when encryption is execute
public enum ESCryptoError: Error {
    
    case wrongKey
    case wrongInitalVector
    case emptyData
    case failedCryptData(status: String)
    
    var errorDescription: String {
        switch self {
        case .wrongKey:
            return "Error: Failed to set a key."
        case .wrongInitalVector:
            return "Failed to set an initial vector"
        case .emptyData:
            return "Data is empty, we cant encrypt or decrypt nil"
        case .failedCryptData(status: let status):
            return "Error: Failed to crypt data. Status \(status)"
        }
    }
}

extension ESCryptoError: Equatable { }
