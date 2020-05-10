# ESCrypto

Simple crypto manager for your app

# Usage

## Standart use

1) Import in project

```swift
import ESCrypto
```

2) For encrypt your data use

```swift
ESCrypto.shared.encrypt(data: Data, cryptoType: ESCryptoType, completion: (Data?, ESCryptoError?) -> Void)
```

3) For decrypt your data use

```swift
ESCrypto.shared.decrypt(data: Data, cryptoType: ESCryptoType, completion: (Data?, ESCryptoError?) -> Void)
```

4) For update crypto key set cryptoKeys property

```swift
ESCrypto.shared.cryptoKeys
```
