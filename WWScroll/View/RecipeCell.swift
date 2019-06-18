//
//  ItemsCell.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 5/31/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
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
        setContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContraints() {
        NSLayoutConstraint.activate([
            imageContainer.widthAnchor.constraint(equalToConstant: 80),
            imageContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            imageContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            foodImageView.topAnchor.constraint(equalTo: self.imageContainer.topAnchor),
            foodImageView.leadingAnchor.constraint(equalTo: self.imageContainer.leadingAnchor),
            foodImageView.trailingAnchor.constraint(equalTo: self.imageContainer.trailingAnchor),
            foodImageView.bottomAnchor.constraint(equalTo: self.imageContainer.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            titleContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            titleContainer.leadingAnchor.constraint(equalTo: self.imageContainer.trailingAnchor, constant: 10),
            titleContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            foodTitle.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            foodTitle.leadingAnchor.constraint(equalTo: self.titleContainer.leadingAnchor),
            foodTitle.trailingAnchor.constraint(equalTo: self.titleContainer.trailingAnchor)
            ])
    }
    
    func addSubviews() {
        contentView.addSubview(imageContainer)
        imageContainer.addSubview(foodImageView)
        contentView.addSubview(titleContainer)
        titleContainer.addSubview(foodTitle)
    }
    
}
