//
//  Network.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/14/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

class NetworkServices {
    
    func sendRequestGetResponse(session: URLSession, request: URLRequest, completion: @escaping ([ImageTitleStringViewModel]?, String?) -> Void) {
        var list = [ImageTitleStringViewModel]()
        let dataTask = session.dataTask(with: request, completionHandler: { (resultingData, response, error) in
            guard let httpStatus = response as? HTTPURLResponse else { return }
            guard httpStatus.statusCode != 200 else {
                completion(nil, "HTTP Error: \(httpStatus.statusCode)")
                return
            }
            if error != nil {
                completion(nil, "DataTask Error: \(error.debugDescription)")
                return
            }
       

            do {
                guard let theData = resultingData, let foodDictionary = try JSONSerialization.jsonObject(with: theData, options: .allowFragments) as? [NSDictionary]  else { return }
                for foodInstance in foodDictionary {
                    if let imageName = foodInstance["image"] as? String, let title = foodInstance["title"] as? String {
                        let item = ImageTitleStringModel(imageName: imageName, title: title)
                        list.append(ImageTitleStringViewModel(item: item))
                    }
                }
                completion(list, nil)
            } catch {
                return
            }
        })
        dataTask.resume()
    }
}
