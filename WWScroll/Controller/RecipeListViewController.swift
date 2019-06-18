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
    case noData
}

class RecipeListViewController: UIViewController {
    
    var tableView = UITableView()
    var state: State = .loading // initial state of app
    var recipeViewModel = RecipeViewModel() //
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(RecipeCell.self, forCellReuseIdentifier: String(describing: RecipeCell.self))
        tableView.register(NoDataCell.self, forCellReuseIdentifier: String(describing: NoDataCell.self))
        tableView.register(RecipeSkeletonCell.self, forCellReuseIdentifier: String(describing: RecipeSkeletonCell.self))
        
        tableView.dataSource = self
        tableView.delegate = self
        recipeViewModel.delegate = self        
    }
}
