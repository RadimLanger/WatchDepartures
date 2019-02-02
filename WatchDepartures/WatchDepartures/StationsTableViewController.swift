//
//  StationsTableViewController.swift
//  WatchDepartures
//
//  Created by Radim Langer on 02/02/2019.
//  Copyright © 2019 Radim Langer. All rights reserved.
//

import UIKit

final class StationsTableViewController: UIViewController {

    private var alertController: UIAlertController?
    private let userDefaults = UserDefaults.standard
    let stationsKey = "SavedStations"

    override func loadView() {
        view = StationsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }

    @objc private func addButtonTapped() {

    }

    private func createNewStation() {
        alertController = UIAlertController(title: "Add station", message: "Add station name and it's ID number", preferredStyle: .alert)

        alertController?.addTextField { $0.placeholder = "Station name" }
        alertController?.addTextField { $0.placeholder = "ID number" }

        let action = UIAlertAction(title: "OK", style: .default) { alertAction in
            let name = self.alertController?.textFields?[0].text ?? ""
            let stationID = self.alertController?.textFields?[1].text ?? "Destination example"
            self.save(new: Station(name: name, ID: stationID))

            self.alertController = nil
        }

        alertController?.addAction(action)

        present(alertController!, animated: true, completion: nil)
    }

    private func save(new station: Station) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(persistedStations + [station]) {
            userDefaults.set(encoded, forKey: stationsKey)
        }
    }

    private var persistedStations: [Station] {

        let decoder = JSONDecoder()

        guard
            let savedStations = userDefaults.object(forKey: stationsKey) as? Data,
            let loadedStations = try? decoder.decode([Station].self, from: savedStations)
        else {
            return []
        }

        return loadedStations
    }
}
