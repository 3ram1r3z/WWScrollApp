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
//    var network = NetworkServices()
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ItemCell.self, forCellReuseIdentifier: "cellId")
        tableView.register(NoData.self, forCellReuseIdentifier: "nodata")
        tableView.register(Skeleton.self, forCellReuseIdentifier: "skeleton")
        
        tableView.dataSource = self
        tableView.delegate = self

//        item.delegate = self
//        item.network.delegate = self
//                item.network.delegate = item
//         item.network = self
//        network.delegate = self // must do this when using protocols to instantiate them
        //change delegate of item to viewmodel
        state = .loading
        item.loadData() // move call to the ItemsViewModel
        
    }
}
