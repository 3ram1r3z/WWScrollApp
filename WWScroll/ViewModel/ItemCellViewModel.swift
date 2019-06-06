//
//  ItemViewModel.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/5/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import Foundation

struct ItemCellViewModel {
    let title: String
    let imageName: String
    
    init (item: Item) {
        self.title = item.title
        self.imageName = item.imageName 
    }
    
}
