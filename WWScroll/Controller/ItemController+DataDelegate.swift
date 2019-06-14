//
//  ItemController+DataDelegate.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/10/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

protocol DataDelegate: class {
    func doneLoading()
    func noDataDisplay()
}

//extension ItemController: DataDelegate  {
//    func doneLoading() {
//        DispatchQueue.main.async {
//            self.state = .populated
//            self.tableView.reloadData()
//        }
//    }
//    
//    func noDataDisplay() {
//        DispatchQueue.main.async {
//            self.state = .nodata
//            self.tableView.reloadData()
//        }
//    }
//}

extension ItemController: React {
    func changeStates(state: State) {
        DispatchQueue.main.async {
            self.state = state
            self.tableView.reloadData()
        }
    }
}
