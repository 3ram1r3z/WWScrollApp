//
//  ItemsController.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 5/31/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit
import SDWebImage

enum State {
    case loading
    case populated
    case nodata
}

protocol DataDelegate: class {
    func doneLoading()
    func noDataDisplay()
}

class ItemController: UITableViewController, DataDelegate {
    
    
    var state = State.loading
    var item = ItemsViewModel()
//    let headerTitles = ["Section 1", "Section 2", "Section 3"]
    
    func doneLoading() {
        DispatchQueue.main.async {
            self.state = .populated
            self.tableView.reloadData()
        }
    }
    
    func noDataDisplay() {
        DispatchQueue.main.async {
            self.state = .nodata
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        switch state {
        case .populated:
            return 3
        case .loading:
            return 1
        case .nodata:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch state {
        case .populated:
            return item.itemViewModels.count
        case .loading:
            return 10
        case .nodata:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch state {
        case .nodata:
            return nil
        case .loading, .populated:
            return "Section \(section+1)"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch state {
        case .populated:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? ItemCell else { return ItemCell() }
            switch indexPath.section  {
                //method to take in cell
            case 0:
                //create method for each case
                cell.titleContainer.backgroundColor = nil
                cell.imageContainer.backgroundColor = nil
                cell.foodTitle.text = "\(item.itemViewModels[indexPath.row].title)"
                let imageURL =  item.itemViewModels[indexPath.row].imageName
                let domain = URL(string: "https://www.weightwatchers.com/\(imageURL)")
                cell.foodImageView.sd_setImage(with: domain)//, placeholderImage: UIImage(named: "bear_first"), options: [], completed: nil)
            case 1:
                cell.titleContainer.backgroundColor = nil
                cell.imageContainer.backgroundColor = nil
                cell.foodTitle.text = "\(item.itemViewModels[indexPath.row].title)"
                cell.foodImageView.image = nil
            case 2:
                cell.titleContainer.backgroundColor = nil
                cell.imageContainer.backgroundColor = nil
                cell.foodTitle.text = nil
                let imageURL =  item.itemViewModels[indexPath.row].imageName
                let domain = URL(string: "https://www.weightwatchers.com/\(imageURL)")
                //                cell.foodImageView.image = UIImage(named: "bear_first")
                cell.foodImageView.sd_setImage(with: domain)
            default:
                break
            }
            return cell
        case .loading:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "skeleton", for: indexPath) as? Skeleton else { return Skeleton() }
            cell.titleContainer.backgroundColor = .lightGray
            cell.imageContainer.backgroundColor = .lightGray
            return cell
        case .nodata:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "nodata", for: indexPath) as? NoData else { return NoData() }
            return cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ItemCell.self, forCellReuseIdentifier: "cellId")
        tableView.register(NoData.self, forCellReuseIdentifier: "nodata")
        tableView.register(Skeleton.self, forCellReuseIdentifier: "skeleton")
        
        tableView.dataSource = self
        tableView.delegate = self
        item.delegate = self // must do this when using protocols to instantiate them
        state = .loading
        item.loadData() 
        
    }
}
