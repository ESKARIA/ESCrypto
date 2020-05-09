//
//  ESCryptoTest.swift
//  ESCryptoTest
//
//  Created by Дмитрий Торопкин on 09.05.2020.
//  Copyright © 2020 Dmitriy Toropkin. All rights reserved.
//

import XCTest
@testable import ESCrypto

class ESAESCryptoTest: XCTestCase {
    
    var cryptoManager: ESCryptoProtocol!
    var testModel: Data!
    private var encoder: JSONEncoder!
    private var decoder: JSONDecoder!
    
    override func setUp() {
        super.setUp()
        self.cryptoManager = ESCrypto.shared
        self.encoder = JSONEncoder()
        self.decoder = JSONDecoder()
        
        self.testModel = try? self.encoder.encode("Test crypto static framework")
    }
    
    override func tearDown() {
        super.tearDown()
        self.cryptoManager = nil
        self.testModel = nil
        self.decoder = nil
        self.encoder = nil
    }
    
    func testCrypt() {
        let expectation = XCTestExpectation(description: "ESCrypto class: testCrypt")
        var data: Data?
        self.cryptoManager.encrypt(data: self.testModel, cryptoType: .aes) { (_data, error) in
            XCTAssertNil(error, error?.errorDescription ?? "")
            data = _data
        }
        self.cryptoManager.decrypt(data: data, cryptoType: .aes) { (_data, error) in
            XCTAssertNil(error, error?.errorDescription ?? "")
            XCTAssertEqual(_data, self.testModel)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }

    func testSuccessUpdateKeys() {
        let keys = ESCryptoKeysModel()
        XCTAssertNoThrow(self.cryptoManager.cryptoKeys = keys)
    }
}
