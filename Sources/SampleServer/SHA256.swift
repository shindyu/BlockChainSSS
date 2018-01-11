//
//  SHA256.swift
//  BlockChain
//
//  Created by shindyu on 2018/01/09.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import Foundation
import CommonCrypto

enum CryptoAlgorithm {
    case SHA256

    var digestLength: Int {
        var result: Int32 = 0
        switch self {
        case .SHA256:
            result = CC_SHA256_DIGEST_LENGTH
        }
        return Int(result)
    }
}

extension String {
    var sha256: String { return digest(string: self, algorithm: .SHA256) }

    func digest(string: String, algorithm: CryptoAlgorithm) -> String {
        var result: [CUnsignedChar]
        let digestLength = Int(algorithm.digestLength)
        if let cdata = string.cString(using: String.Encoding.utf8) {
            result = Array(repeating: 0, count: digestLength)
            switch algorithm {
            case .SHA256:   CC_SHA256(cdata, CC_LONG(cdata.count-1), &result)
            }
        } else {
            fatalError("Nil returned when processing input strings as UTF8")
        }
        return (0..<digestLength).reduce("") { $0 + String(format: "%02hhx", result[$1])}
    }
}
