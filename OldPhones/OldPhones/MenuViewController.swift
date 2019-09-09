//
//  MenuViewController.swift
//  OldPhones
//
//  Created by pennyworth on 9/9/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit


class MenuViewController: UITableViewController {
    
    let phones = [
        (phoneName: "1907 Wall Set", picName: "image-cell1"), (phoneName: "1921 Dial Phone", picName: "image-cell2"), (phoneName: "1937 Desk Set", picName: "image-cell3"), (phoneName: "1984 Moto Portable", picName: "image-cell4"),
    ]
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 244.0/255.0, alpha: 1)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = phones[indexPath.row].phoneName
        let cellImgName = phones[indexPath.row].picName
        cell.imageView?.image = UIImage(imageLiteralResourceName: cellImgName)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phones.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let registerVC = ProductViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}


