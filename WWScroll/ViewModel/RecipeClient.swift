//
//  Network.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/14/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

class RecipeClient {
    
    func getRecipes(session: URLSession, request: URLRequest, completion: @escaping ([RecipeModel]?, String?) -> Void) {
        var list = [RecipeModel]()
        let dataTask = session.dataTask(with: request, completionHandler: { (resultingData, response, error) in
            guard let httpStatus = response as? HTTPURLResponse else { return }
            guard httpStatus.statusCode == 200 else {
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
                        list.append(RecipeModel(item: item))
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
