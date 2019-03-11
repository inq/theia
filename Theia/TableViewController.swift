//
//  TableViewController.swift
//  Theia
//
//  Created by inkyu on 08/03/2019.
//  Copyright © 2019 q. All rights reserved.
//

import CoreData
import UIKit

class TableViewController: UITableViewController {
    var actions: [Action] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let context = Store.shared.persistentContainer.viewContext
        let request: NSFetchRequest<Action> = Action.fetchRequest()
        do {
            actions = try context.fetch(request)
        } catch {
            print("Error")
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return actions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrototypeCell", for: indexPath)

        _ = indexPath.section
        let row = indexPath.row

        cell.textLabel?.text = "id \(actions[row].id!) name \(actions[row].name!)"

        return cell
    }
}
