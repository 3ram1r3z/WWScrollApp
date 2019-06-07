//
//  ItemsViewModel.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/6/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit



class ItemsViewModel: NSObject {
    
    weak var delegate: DataDelegate?

    var itemViewModels = [ItemCellViewModel]()
    
    func loadData(){//tableView: UITableView) {
        let sharedSession = URLSession.shared
        if let url = URL(string: "https://www.weightwatchers.com/assets/cmx/us/messages/collections.json") {
            let request = URLRequest(url: url)
            let dataTask = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) in
                if error != nil {
                    return
                }
                if let httpStatus = response as? HTTPURLResponse {
                    if httpStatus.statusCode != 200 {
                        return
                    }
                }
                do {
                    //look good??
                    if let theData = data, let dataDictionary = try JSONSerialization.jsonObject(with: theData, options: .allowFragments) as? [NSDictionary] {
                        for data in dataDictionary {
                            if let imageName = data["image"] as? String, let title = data["title"] as? String { //look good?
                                let item = Item(imageName: imageName, title: title)
                                self.itemViewModels.append(ItemCellViewModel(item: item))
                            }
                        }
                        self.delegate?.doneLoading()
                    } else {
                        return
                    }
                } catch {
                    return
                }
            })
            dataTask.resume()
        }
    }
}


