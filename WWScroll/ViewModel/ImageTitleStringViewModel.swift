//
//  ItemViewModel.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/5/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import Foundation

struct ImageTitleStringViewModel {
    let title: String
    let imageName: String
    
    init (item: ImageTitleStringModel) {
        self.title = item.title
        self.imageName = item.imageName 
    }
    
}
