//
//  ESCryptoManager.swift
//  ESCrypto
//
//  Created by Дмитрий Торопкин on 09.05.2020.
//  Copyright © 2020 Dmitriy Toropkin. All rights reserved.
//

import Foundation
import CommonCrypto

struct ESAESCryptoManager {
    
    private var key: Data!
    private var iv: Data!
    
    init(keys: ESAESCryptoKeysModel) throws {
        
        var keyData: Data
        var ivData: Data
        
        let initKey = keys.aesCryptoKey
        let initIV = keys.aesInitialVector
        
        if initKey.count == kCCKeySizeAES128 || initKey.count == kCCKeySizeAES256, let _keyData = initKey.data(using: .utf8) {
            keyData = _keyData
        } else {
            throw ESCryptoError.wrongKey
        }
        
        if initIV.count == kCCBlockSizeAES128, let _ivData = initIV.data(using: .utf8) {
            ivData = _ivData
        } else {
            throw ESCryptoError.wrongInitalVector
        }
        
        self.key = keyData
        self.iv = ivData
    }
    
    private func crypt(data: Data?, option: CCOperation, completion: (Data?, ESCryptoError?) -> Void) {
        
        guard let data = data else {
            completion(nil, .emptyData)
            return
        }
        let cryptLength = data.count + kCCBlockSizeAES128
        var cryptData   = Data(count: cryptLength)
        
        let keyLength = self.key.count
        let options   = CCOptions(kCCOptionPKCS7Padding)
        
        var bytesLength = Int(0)
        
        let status = cryptData.withUnsafeMutableBytes { cryptBytes in
            data.withUnsafeBytes { dataBytes in
                self.iv.withUnsafeBytes { ivBytes in
                    self.key.withUnsafeBytes { keyBytes in
                        CCCrypt(option, CCAlgorithm(kCCAlgorithmAES), options, keyBytes.baseAddress, keyLength, ivBytes.baseAddress, dataBytes.baseAddress, data.count, cryptBytes.baseAddress, cryptLength, &bytesLength)
                    }
                }
            }
        }
        
        guard UInt32(status) == UInt32(kCCSuccess) else {
            completion(nil, .failedCryptData(status: status.description))
            return
        }
        
        cryptData.removeSubrange(bytesLength..<cryptData.count)
        completion(cryptData, nil)
    }
}

extension ESAESCryptoManager: ESAESCryptoManagerProtocol {
    
    func deCrypt(data: Data?, completion: (Data?, ESCryptoError?) -> Void) {
        self.crypt(data: data, option: CCOperation(kCCDecrypt), completion: { decryptData, error in
            completion(decryptData, error)
        })
    }
    
    func enCrypt(data: Data?, completion: (Data?, ESCryptoError?) -> Void) {
        self.crypt(data: data, option: CCOperation(kCCEncrypt), completion: {data, error in
            completion(data, error)
        })
    }
}
