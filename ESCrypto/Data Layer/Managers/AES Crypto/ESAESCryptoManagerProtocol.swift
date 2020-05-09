//
//  ESAESCryptoManagerProtocol.swift
//  ESCrypto
//
//  Created by Дмитрий Торопкин on 09.05.2020.
//  Copyright © 2020 Dmitriy Toropkin. All rights reserved.
//

import Foundation

public protocol ESAESCryptoManagerProtocol {
    
    func deCrypt(data: Data?, completion: (Data?, ESCryptoError?) -> Void)
    func enCrypt(data: Data?, completion: (Data?, ESCryptoError?) -> Void)
}
