//
//  ItemController+DataSource.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/10/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

extension RecipeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch state {
        case .populated:
            return recipeViewModel.recipes.count
        case .loading:
            return 10
        case .noData:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch state {
        case .populated:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeCell.self), for: indexPath) as? RecipeCell else { return RecipeCell() }
            return  structure(cell: cell, indexPath: indexPath)
        case .loading:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeSkeletonCell.self), for: indexPath) as? RecipeSkeletonCell else { return RecipeSkeletonCell() }
            cell.titleContainer.backgroundColor = .lightGray
            cell.imageContainer.backgroundColor = .lightGray
            return cell
        case .noData:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NoDataCell.self), for: indexPath) as? NoDataCell else { return NoDataCell() }
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch state {
        case .populated:
            return 3
        case .loading:
            return 1
        case .noData:
            return 1
        }
    }
    
    // MARK: - HELPER
    
    private func structure(cell: RecipeCell, indexPath: IndexPath) -> RecipeCell {
        cell.titleContainer.backgroundColor = nil
        cell.imageContainer.backgroundColor = nil
        cell.foodImageView.image = nil
        cell.foodTitle.text = nil
        if indexPath.section != 2 {//text only
            cell.foodTitle.text = "\(recipeViewModel.recipes[indexPath.row].title)"
        }
        if indexPath.section != 1 {//image only
            let imageURL =  recipeViewModel.recipes[indexPath.row].imageName
            let domain = URL(string: "https://www.weightwatchers.com/\(imageURL)")
            cell.foodImageView.sd_setImage(with: domain)//, placeholderImage: UIImage(named: "bear_first"), options: [], completed: nil)
        }
        return cell
    }

    
}
