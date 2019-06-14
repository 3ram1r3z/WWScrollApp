//
//  Network.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/14/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

class NetworkServices {
    
    weak var delegate: DataDelegate?
    
    func sendRequestGetResponse(session: URLSession, request: URLRequest) -> [ItemCellViewModel] {
        var list = [ItemCellViewModel]()
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
            //different class, single responsibility
            //array of itemcellviewmodels
            if error != nil {
                self.delegate?.noDataDisplay()
                return
            }
            guard let httpStatus = response as? HTTPURLResponse else { return }
            if httpStatus.statusCode != 200 {
                return
            }
            
            do {
                if let theData = data, let dataDictionary = try JSONSerialization.jsonObject(with: theData, options: .allowFragments) as? [NSDictionary] {
                    for data in dataDictionary {
                        if let imageName = data["image"] as? String, let title = data["title"] as? String {
                            let item = Item(imageName: imageName, title: title)
                            list.append(ItemCellViewModel(item: item))
                        }
                    }
//                    completion()
                    self.delegate?.doneLoading()
                } else {
                    return
                }
            } catch {
                return
            }
        })
        dataTask.resume()
        return list
    }
}
