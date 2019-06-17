//
//  ItemController+DataSource.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/10/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

extension FoodViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch state {
        case .populated:
            return item.foodViewModels.count
        case .loading:
            return 10
        case .nodata:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch state {
        case .populated:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? FoodCell else { return FoodCell() }
            return  structure(cell: cell, indexPath: indexPath)
        case .loading:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "skeleton", for: indexPath) as? Skeleton else { return Skeleton() }
            cell.titleContainer.backgroundColor = .lightGray
            cell.imageContainer.backgroundColor = .lightGray
            return cell
        case .nodata:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "nodata", for: indexPath) as? NoData else { return NoData() }
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch state {
        case .populated:
            return 3
        case .loading:
            return 1
        case .nodata:
            return 1
        }
    }
    
    // MARK: - HELPER
    
    private func structure(cell: FoodCell, indexPath: IndexPath) -> FoodCell {
        cell.titleContainer.backgroundColor = nil
        cell.imageContainer.backgroundColor = nil
        cell.foodImageView.image = nil
        cell.foodTitle.text = nil
        if indexPath.section != 2 {//text only
            cell.foodTitle.text = "\(item.foodViewModels[indexPath.row].title)"
        }
        if indexPath.section != 1 {//image only
            let imageURL =  item.foodViewModels[indexPath.row].imageName
            let domain = URL(string: "https://www.weightwatchers.com/\(imageURL)")
            cell.foodImageView.sd_setImage(with: domain)//, placeholderImage: UIImage(named: "bear_first"), options: [], completed: nil)
        }
        return cell
    }

    
}
