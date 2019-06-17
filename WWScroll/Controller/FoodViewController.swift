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

class FoodViewController: UIViewController {
    
    var tableView = UITableView()
    var state: State = .loading // initial state of app
    var item = FoodViewModel() //
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(FoodCell.self, forCellReuseIdentifier: "cellId")
        tableView.register(NoData.self, forCellReuseIdentifier: "nodata")
        tableView.register(Skeleton.self, forCellReuseIdentifier: "skeleton")
        
        tableView.dataSource = self
        tableView.delegate = self
        item.delegate = self        
    }
}
