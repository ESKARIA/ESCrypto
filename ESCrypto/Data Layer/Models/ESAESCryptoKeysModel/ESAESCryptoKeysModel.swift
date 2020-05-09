//
//  ESAESCryptoKeysModel.swift
//  ESCrypto
//
//  Created by Дмитрий Торопкин on 09.05.2020.
//  Copyright © 2020 Dmitriy Toropkin. All rights reserved.
//

import Foundation

public struct ESAESCryptoKeysModel {
    
    /// crypto key for aes encrypt\decrypt
    var aesCryptoKey: String
    /// crypto initial vector for aes encrypt\decrypt
    var aesInitialVector: String
    
    public init(aesCryptoKey: String, aesInitialVector: String) {
        self.aesCryptoKey = aesCryptoKey
        self.aesInitialVector = aesInitialVector
    }
}
