//
//  ItemsController.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 5/31/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit
import SDWebImage

protocol DataDelegate: class {
    func doneLoading()
}

class ItemController: UITableViewController, DataDelegate {
    
    var item = ItemsViewModel()
    
    func doneLoading() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.itemViewModels.count
    }
    
    let headerTitles = ["Section 1", "Section 2", "Section 3"]
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ItemCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? ItemCell {
            switch indexPath.section {
            case 1:
                cell.foodTitle.text = "\(item.itemViewModels[indexPath.row].title)"
                cell.foodImageView.image = nil
            case 2:
                cell.foodTitle.text = nil
                let imageURL =  item.itemViewModels[indexPath.row].imageName
                let domain = URL(string: "https://www.weightwatchers.com/\(imageURL)")
//                cell.foodImageView.image = UIImage(named: "bear_first")
                cell.foodImageView.sd_setImage(with: domain)
            default:
                cell.foodTitle.text = "\(item.itemViewModels[indexPath.row].title)"
                let imageURL =  item.itemViewModels[indexPath.row].imageName
                let domain = URL(string: "https://www.weightwatchers.com/\(imageURL)")
                cell.foodImageView.sd_setImage(with: domain)//, placeholderImage: UIImage(named: "bear_first"), options: [], completed: nil)
            }
            return cell
        } else  {
            return ItemCell()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ItemCell.self, forCellReuseIdentifier: "cellId")
        tableView.dataSource = self
        tableView.delegate = self
        item.delegate = self
        item.loadData() //tableView: tableView)
        
    }
}
