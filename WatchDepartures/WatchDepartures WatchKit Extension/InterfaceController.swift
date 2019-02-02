//
//  InterfaceController.swift
//  WatchDepartures WatchKit Extension
//
//  Created by Radim Langer on 02/02/2019.
//  Copyright © 2019 Radim Langer. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!

    private var items = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.updateTable()
            }
        }
    }

    override func willActivate() {
        super.willActivate()

        items = ["OMEGA LUL", "yay", "oi", "boi"]
    }

    private func updateTable() {
        table.setNumberOfRows(items.count, withRowType: "RowController")
        for (i, item) in items.enumerated() {
            if let row = table.rowController(at: i) as? RowController {
                row.textLabel.setText(item)
            }
        }
    }

    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pushController(withName: "DetailController", context: items[rowIndex])
    }
}
