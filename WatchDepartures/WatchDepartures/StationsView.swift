//
//  StationsView.swift
//  WatchDepartures
//
//  Created by Radim Langer on 02/02/2019.
//  Copyright © 2019 Radim Langer. All rights reserved.
//

import UIKit

final class StationsView: UIView {

    let tableView = UITableView()

    convenience init() {
        self.init()
        addSubview(tableView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
