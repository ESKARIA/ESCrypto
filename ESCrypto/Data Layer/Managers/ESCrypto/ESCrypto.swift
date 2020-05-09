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
struct ESCrypto {
    
    public static let shared: ESCryptoProtocol = ESCrypto()
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
    
    /// encrypt data with key
    /// - Parameter string: string to crypt
    /// - Parameter completion: completion with optional data and optional error
    public func encrypt(data: Data, cryptoType: ESCryptoType, completion: (Data?, ESCryptoError?) -> Void) {
        
        switch cryptoType {
        case .aes:
            self.aesCryptoManager.enCrypt(data: data, completion: completion)
        }
    }
    
    /// decrypt data with default key
    /// - Parameter data: data to decrypt
    /// - Parameter completion: completion with decrypted optional string and optional error
    public func decrypt(data: Data?, cryptoType: ESCryptoType, completion: (Data?, ESCryptoError?) -> Void) {
        
        switch cryptoType {
        case .aes:
            self.aesCryptoManager.deCrypt(data: data, completion: completion)
        }
    }
}

