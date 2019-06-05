//
//  ItemsController.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 5/31/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit
import SDWebImage

class ItemController: UITableViewController {
    
    var items:[Item] = []
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    let headerTitles = ["Section 1", "Section 2", "Section 3"]
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ItemCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? ItemCell {
            switch indexPath.section {
            case 1:
                cell.foodTitle.text = "\(items[indexPath.row].title)"
                cell.foodImageView.image = UIImage()
            case 2:
                cell.foodTitle.text = ""
                let imageURL =  items[indexPath.row].imageName
                let domain = URL(string: "https://www.weightwatchers.com/\(imageURL)")
                cell.foodImageView.image = UIImage(named: "bear_first")
                cell.foodImageView.sd_setImage(with: domain)
            default:
                cell.foodTitle.text = "\(items[indexPath.row].title)"
                let imageURL =  items[indexPath.row].imageName
                let domain = URL(string: "https://www.weightwatchers.com/\(imageURL)")
                cell.foodImageView.sd_setImage(with: domain, placeholderImage: UIImage(named: "bear_first"), options: [], completed: nil)
            }
            return cell
        } else  {
            return ItemCell()
        }
        
    }
    
    
    private func loadData() {
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
                    if let dataDictionary = try JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments) as? [NSDictionary] {
                        for data in dataDictionary {
                            //                        let imageName = data["image"].unsafelyUnwrapped
                            //                        let title = data["title"].unsafelyUnwrapped
                            if let imageName = data["image"] as? String? ?? "", let title = data["title"] as? String? ?? "" { //look good?
                                self.items.append(Item(imageName: imageName, title: title))
                            }
                            
                        }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ItemCell.self, forCellReuseIdentifier: "cellId")
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
}
