//
//  Transaction.swift
//  BlockChain
//
//  Created by shindyu on 2018/01/09.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import Foundation

struct Transaction: Codable {
    let sender: String
    let recipient: String
    let amount: Int
}

extension Transaction: Equatable {}

func ==(lhs: Transaction, rhs: Transaction) -> Bool {
    return lhs.sender == rhs.sender &&
        lhs.recipient == rhs.recipient &&
        lhs.amount == rhs.amount
}
