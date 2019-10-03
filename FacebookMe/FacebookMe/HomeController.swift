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
    
    let mainMenuItems: [MenuItem] = [
        MenuItem(name: "Friends", icon: "fb_friends"),
        MenuItem(name: "Events", icon: "fb_events"),
        MenuItem(name: "Groups", icon: "fb_groups"),
        MenuItem(name: "CMU", icon: "fb_education"),
        MenuItem(name: "Town Hall", icon: "fb_town_hall"),
        MenuItem(name: "Instant Games", icon: "fb_games"),
    ]
    
    let addMenuItems: [MenuItem] = [
        MenuItem(name: "Settings", icon: "fb_settings"),
        MenuItem(name: "Privacy Shortcuts", icon: "fb_privacy_shortcuts"),
        MenuItem(name: "Help and Support", icon: "fb_help_and_support")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.backgroundColor = UIColor(displayP3Red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        self.navigationItem.title = "Facebook"
        self.navigationItem.titleView?.backgroundColor = .red
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 91/255, green: 112/255, blue: 162/255, alpha: 1)
        navigationController?.navigationBar.backgroundColor = UIColor(displayP3Red: 91/255, green: 112/255, blue: 162/255, alpha: 1)
        
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
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "BuyMax"
            cell.imageView?.image = UIImage(imageLiteralResourceName: "bayMax")
            cell.detailTextLabel?.text = "View your profile"
        case 1:
            if indexPath.row == mainMenuItems.count {
                cell.textLabel?.text = "See More..."
                cell.imageView?.image = UIImage(imageLiteralResourceName: "fb_placeholder")
                cell.textLabel?.textColor = .systemBlue
                cell.accessoryType = .none
                return cell
            }
            cell.textLabel?.text = mainMenuItems[indexPath.row].name
            cell.imageView?.image = mainMenuItems[indexPath.row].icon
        case 2:
            cell.textLabel?.text = "Add Favorites..."
            cell.imageView?.image = UIImage(imageLiteralResourceName: "fb_placeholder")
            cell.textLabel?.textColor = .systemBlue
            cell.textLabel?.textAlignment = .center
            cell.accessoryType = .none
        case 3:
            cell.textLabel?.text = addMenuItems[indexPath.row].name
            cell.imageView?.image = addMenuItems[indexPath.row].icon
        case 4:
            let logOutCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellId)
            logOutCell.textLabel?.text = "Log Out"
            logOutCell.textLabel?.textColor = .systemRed
            logOutCell.textLabel?.textAlignment = .center
            return logOutCell
        default:
            ()
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
        

        if section == 2 {
            let view = UIView()
//            view.backgroundColor = .red
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.951).isActive = true
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            label.textColor = .systemGray
            label.text = "Favotites"
            return view
        }
        
        let view = UIView()
        return view
    }
    
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 2 {
//            return "test"
//        } else {
//            return nil
//        }
//    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

