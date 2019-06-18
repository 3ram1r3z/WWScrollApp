//
//  ItemsViewModel.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/6/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

protocol didUpdateTableView: class {
    func updateTableView(with state: State)
}

class RecipeViewModel: NSObject {

    weak var delegate: didUpdateTableView?
    var recipes = [RecipeModel]()
    let network = RecipeClient()
    
    override init() {
        super.init()
        self.loadData()
    }
    
    func loadData(session: URLSession=URLSession.shared) {
        guard let url = URL(string: "https://www.weightwatchers.com/assets/cmx/us/messages/collections.json") else { return }
        let request = URLRequest(url: url)
        network.getRecipes(session: session, request: request, completion: { (resultingList, error) in
            guard let list = resultingList, !list.isEmpty, error == nil else
            {
                print(error ?? "Unhandled Error")
                self.delegate?.updateTableView(with: .noData)
                return
            }
            self.recipes = list
            self.delegate?.updateTableView(with: .populated)
        })
    }
}
