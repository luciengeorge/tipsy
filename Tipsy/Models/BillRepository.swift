//
//  BillRepository.swift
//  Tipsy
//
//  Created by Lucien George on 01/12/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct BillRepository {
    var bill: Bill = Bill()

    mutating func setTip(buttonText: String) {
        let endOfNumber = buttonText.firstIndex(of: "%")
        bill.tip = Int((buttonText[..<endOfNumber!]))!
    }

    mutating func setSplit(value: Float) {
        bill.splitNumber = Int(value)
    }

    mutating func setTotalAmount(value: Float) {
        bill.totalAmount = value
    }

    func calculateSplitPerPerson() -> String {
        return String(format: "%.2f", Float(bill.totalAmount! * (1 + (Float(bill.tip!) / 100))) / Float(bill.splitNumber!))
    }

    func information() -> String {
        return "Split between \(bill.splitNumber!) people, with \(bill.tip!)% tip."
    }
}
