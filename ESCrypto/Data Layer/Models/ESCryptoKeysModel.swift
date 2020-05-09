//
//  ESCryptoKeysModel.swift
//  ESCrypto
//
//  Created by Дмитрий Торопкин on 09.05.2020.
//  Copyright © 2020 Dmitriy Toropkin. All rights reserved.
//

import Foundation

public struct ESCryptoKeysModel {
    
    var aesCryptoKeys: ESAESCryptoKeysModel
    
    public init(aesCryptoKeys: ESAESCryptoKeysModel = ESAESCryptoKeysModel(aesCryptoKey: ESConstants.ESAESConstant.key.rawValue,
                                                                           aesInitialVector: ESConstants.ESAESConstant.initialVector.rawValue)) {
        self.aesCryptoKeys = aesCryptoKeys
    }
}
