//
//  ItemController+DataDelegate.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/10/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

extension FoodViewController: FoodViewModelDelegate {
    func updateTableView(with state: State) {
        DispatchQueue.main.async {
            self.state = state
            self.tableView.reloadData()
        }
    }
}
