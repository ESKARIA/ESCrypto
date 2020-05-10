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
    
    /// Encrypt data
    /// - Parameter completion: completion with optional data and optional error
    /// - Parameter data: data to encrypt
    /// - Parameter cryptoType: type for encryption
    func encrypt(data: Data, cryptoType: ESCryptoType, completion: (Data?, ESCryptoError?) -> Void)
    /// decrypt data
    /// - Parameter data: optional string
    /// - Parameter completion: completion with decrypted optional string and optional error
    /// - Parameter cryptoType: type for encryption
    func decrypt(data: Data?, cryptoType: ESCryptoType, completion: (Data?, ESCryptoError?) -> Void)
    /// crypto keys. Without override used standart value from constant file
    var cryptoKeys: ESCryptoKeysModel { get set }
}

