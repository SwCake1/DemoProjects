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
        Phone(name: "1907 Wall Set", logoImgName: "image-cell1", pictureName: "phone-fullscreen1"),
        Phone(name: "1921 Dial Phone", logoImgName: "image-cell2", pictureName: "phone-fullscreen2"),
        Phone(name: "1937 Desk Set", logoImgName: "image-cell3", pictureName: "phone-fullscreen3"),
        Phone(name: "1984 Moto Portable", logoImgName: "image-cell4", pictureName: "phone-fullscreen4"),
    ]
    
    let productsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.text = "Products"
        return button
    }()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 244.0/255.0, alpha: 1)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = phones[indexPath.row].name
        cell.imageView?.image = phones[indexPath.row].logo
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
        let productVC = ProductViewController()
        productVC.phoneName = phones[indexPath.row].name
        productVC.phoneImg = phones[indexPath.row].picture
        self.navigationController?.pushViewController(productVC, animated: true)
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


