//
//  ItemsViewModel.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/6/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

protocol React: class {
    func changeStates(state: State)
}

class ItemsViewModel: NSObject {
    
//    weak var delegate: DataDelegate?
    weak var delegate: React?
    var itemViewModels = [ItemCellViewModel]()
    let network = NetworkServices()
    
    func loadData(session: URLSession=URLSession.shared) {
        network.delegate = self
//        let sharedSession = session
        guard let url = URL(string: "https://www.weightwatchers.com/assets/cmx/us/messages/collections.json") else { return }
        let request = URLRequest(url: url)
        
        
        itemViewModels = network.sendRequestGetResponse(session: session, request: request)
        
        return
    }
}

extension ItemsViewModel: DataDelegate  {
    
    func doneLoading() {
        DispatchQueue.main.async {
//            state = .populated
            self.delegate?.changeStates(state: .populated)
        }
    }
    
    func noDataDisplay() {
        DispatchQueue.main.async {
//            state = .nodata
        }
    }
}
