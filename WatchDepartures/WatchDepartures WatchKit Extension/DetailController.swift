//
//  DetailController.swift
//  WatchDepartures WatchKit Extension
//
//  Created by Radim Langer on 02/02/2019.
//  Copyright © 2019 Radim Langer. All rights reserved.
//

import WatchKit
import Foundation

class DetailController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        guard let selectedStationID = context as? String else { dismiss(); return }


//        UserDefaults.standard.array(forKey: "") // TODO: try if it loads something
        setTitle(selectedStationID)
        super.awake(withContext: context)
    }

    override func willActivate() {
        
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
