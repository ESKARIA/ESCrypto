//
//  ESCryptoProtocol.swift
//  ESCrypto
//
//  Created by Дмитрий Торопкин on 09.05.2020.
//  Copyright © 2020 Dmitriy Toropkin. All rights reserved.
//

import Foundation

public enum ESCryptoType {
    case aes
}

/// Protocol for encrypting and decrypting data
public protocol ESCryptoProtocol {
    
    /// Encrypt string with default key
    /// - Parameter string: encrypted data
    /// - Parameter completion: completion with optional data and optional error
    func encrypt(data: Data, cryptoType: ESCryptoType, completion: (Data?, ESCryptoError?) -> Void)
    /// decrypt data with default key
    /// - Parameter data: optional string
    /// - Parameter completion: completion with decrypted optional string and optional error
    func decrypt(data: Data?, cryptoType: ESCryptoType, completion: (Data?, ESCryptoError?) -> Void)
    /// crypto keys. Without override used standart value from constant file
    var cryptoKeys: ESCryptoKeysModel { get set }
}

