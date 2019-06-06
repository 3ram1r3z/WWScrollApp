//
//  ItemsCell.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 5/31/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
//    var item: Item? {
//        didSet {
//            guard let unwrappedItem = item else { return }
//            foodImageView.image = UIImage(named: "\(unwrappedItem.imageName)")
//            foodTitle.text = unwrappedItem.title
//        }
//    }
    
    var itemViewModel: ItemCellViewModel? {
        didSet {
            guard let unwrappedItem = itemViewModel else { return }
            foodImageView.image = UIImage(named: "\(unwrappedItem.imageName)")
            foodTitle.text = itemViewModel?.title
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(imageContainer)
        imageContainer.addSubview(foodImageView)
        contentView.addSubview(containerView)
        containerView.addSubview(foodTitle)
        
        imageContainer.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        imageContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        
        foodImageView.topAnchor.constraint(equalTo: self.imageContainer.topAnchor).isActive = true
        foodImageView.leadingAnchor.constraint(equalTo: self.imageContainer.leadingAnchor).isActive = true
        foodImageView.trailingAnchor.constraint(equalTo: self.imageContainer.trailingAnchor).isActive = true
        foodImageView.bottomAnchor.constraint(equalTo: self.imageContainer.bottomAnchor).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.imageContainer.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        
        foodTitle.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        foodTitle.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        foodTitle.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        foodTitle.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
    }
    
    let foodImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()

    let foodTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()

    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let imageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}
