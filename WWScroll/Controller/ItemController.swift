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

class ItemController: UIViewController {
    
    var tableView = UITableView()
    var state: State = .loading
    var item = ItemsViewModel()
    
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
