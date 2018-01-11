//
//  DateProvider.swift
//  BlockChain
//
//  Created by shindyu on 2018/01/09.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import Foundation

protocol DateProvider {
    func timestamp() -> Double
}

struct DefaultDateProvider: DateProvider {
    func timestamp() -> Double {
        return Date().timeIntervalSince1970
    }
}
