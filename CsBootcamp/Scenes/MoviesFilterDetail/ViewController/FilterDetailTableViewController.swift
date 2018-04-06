//
//  FilterDetailTableViewController.swift
//  CsBootcamp
//
//  Created by Lucas Nascimento on 06/04/2018.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class FilterDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(frame: .zero)
        cell.textLabel?.text = "2008"
        return cell
    }

}
