//
//  HomeController.swift
//  FacebookMe
//
//  Created by pennyworth on 9/29/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    let cellId = "cellId"
    let headerId = "headerId"
    let footerId = "footerId"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(displayP3Red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        self.navigationItem.title = "Facebook"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.tableFooterView = UIView()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 7
        case 2:
            return 1
        case 3:
            return 3
        case 4:
            return 1
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellId)
        if indexPath.section != 2 && indexPath.section != 4 {
            cell.accessoryType = .disclosureIndicator
        }
        
        cell.textLabel?.text = "test"
        if indexPath.section == 0 {
            cell.textLabel?.text = "BuyMax"
            cell.imageView?.image = UIImage(imageLiteralResourceName: "bayMax")
            cell.detailTextLabel?.text = "View your profile"
        }
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        } else {
            return 50
        }
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        if section == 2 {
            label.text = "Favotites"
            return label
        }
        let view = UIView()
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

