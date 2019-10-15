//
//  DetailViewController.swift
//  Artistry
//
//  Created by pennyworth on 10/3/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController, UITextViewDelegate {
    
    var author: Artist!
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = author.name
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 117/255, green: 157/255, blue: 71/255, alpha: 1)
        self.tableView.tableFooterView = UIView()
        tableView.register(DetailArtistryCell.self, forCellReuseIdentifier: cellId)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DetailArtistryCell
        let work = author.works[indexPath.row]
        
        cell.workNameLabel.text = work.title
        cell.workImageView.image = UIImage(named: work.image)
        cell.selectionStyle = .none
        cell.moreInfoTextView.text = work.isExpanded ? work.info : "Select For More Info >"
        cell.moreInfoTextView.textAlignment = work.isExpanded ? .left : .center

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? DetailArtistryCell else {
            return
        }
        
        var work = author.works[indexPath.row]
        
        work.isExpanded = !work.isExpanded
        author.works[indexPath.row] = work
        
        cell.moreInfoTextView.text = work.isExpanded ? work.info : "Select For More Info >"
        cell.moreInfoTextView.textAlignment = work.isExpanded ? .left : .center
        
        
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = cell.moreInfoTextView.sizeThatFits(size)
        
        
        cell.moreInfoTextView.constraints.forEach{ (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        
        self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 250
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return author.works.count
    }
}
