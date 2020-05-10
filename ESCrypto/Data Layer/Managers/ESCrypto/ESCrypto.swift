//
//  ESCrypto.swift
//  ESCrypto
//
//  Created by Дмитрий Торопкин on 09.05.2020.
//  Copyright © 2020 Dmitriy Toropkin. All rights reserved.
//

import Foundation
import CommonCrypto

/// Manager for encrypting and decrypting data
public struct ESCrypto {
    
    /// singleton ESCrypto
    public static let shared: ESCryptoProtocol = ESCrypto()
    /// crypto keys. Without override used standart value from constant file
    public var cryptoKeys: ESCryptoKeysModel = ESCryptoKeysModel() {
        didSet {
            do {
                try self.aesCryptoManager = ESAESCryptoManager(keys: cryptoKeys.aesCryptoKeys)
            } catch {
                fatalError((error as! ESCryptoError).errorDescription)
            }
        }
    }
    
    private var aesCryptoManager: ESAESCryptoManagerProtocol
    
    private init() {
        do {
            try self.aesCryptoManager = ESAESCryptoManager(keys: cryptoKeys.aesCryptoKeys)
        } catch {
            fatalError((error as! ESCryptoError).errorDescription)
        }
    }

}

// MARK: - ALCryptoManagerProtocol

extension ESCrypto: ESCryptoProtocol {
    
    /// Encrypt data
    /// - Parameter completion: completion with optional data and optional error
    /// - Parameter data: data to encrypt
    /// - Parameter cryptoType: type for encryption
    public func encrypt(data: Data, cryptoType: ESCryptoType, completion: (Data?, ESCryptoError?) -> Void) {
        
        switch cryptoType {
        case .aes:
            self.aesCryptoManager.enCrypt(data: data, completion: completion)
        }
    }
    
    /// decrypt data
    /// - Parameter data: optional string
    /// - Parameter completion: completion with decrypted optional string and optional error
    /// - Parameter cryptoType: type for encryption
    public func decrypt(data: Data?, cryptoType: ESCryptoType, completion: (Data?, ESCryptoError?) -> Void) {
        
        switch cryptoType {
        case .aes:
            self.aesCryptoManager.deCrypt(data: data, completion: completion)
        }
    }
}

