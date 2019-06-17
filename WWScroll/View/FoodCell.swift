//
//  ItemsCell.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 5/31/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {

    var itemViewModel: ImageTitleStringViewModel? {
        didSet {
            guard let unwrappedItem = itemViewModel else { return }
            foodImageView.image = UIImage(named: "\(unwrappedItem.imageName)")
            foodTitle.text = itemViewModel?.title
        }
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
    
    let titleContainer: UIView = {
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addContraints() {
        imageContainer.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        imageContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        
        foodImageView.topAnchor.constraint(equalTo: self.imageContainer.topAnchor).isActive = true
        foodImageView.leadingAnchor.constraint(equalTo: self.imageContainer.leadingAnchor).isActive = true
        foodImageView.trailingAnchor.constraint(equalTo: self.imageContainer.trailingAnchor).isActive = true
        foodImageView.bottomAnchor.constraint(equalTo: self.imageContainer.bottomAnchor).isActive = true
        
        titleContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        titleContainer.leadingAnchor.constraint(equalTo: self.imageContainer.trailingAnchor, constant: 10).isActive = true
        titleContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        
        foodTitle.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        foodTitle.leadingAnchor.constraint(equalTo: self.titleContainer.leadingAnchor).isActive = true
        foodTitle.trailingAnchor.constraint(equalTo: self.titleContainer.trailingAnchor).isActive = true
    }
    
    func addSubviews() {
        contentView.addSubview(imageContainer)
        imageContainer.addSubview(foodImageView)
        contentView.addSubview(titleContainer)
        titleContainer.addSubview(foodTitle)
    }
    
}
