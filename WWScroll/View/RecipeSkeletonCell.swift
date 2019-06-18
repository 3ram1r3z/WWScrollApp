//
//  Skeleton.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/10/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

extension UIColor {
    //test this
    static var lightgray = UIColor(red: 123/255, green: 234/255, blue: 1/255, alpha: 1)
}

class RecipeSkeletonCell: UITableViewCell {
    
    let titleContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .purple
        return view
    }()
    
    let imageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .lightgray
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageContainer.widthAnchor.constraint(equalToConstant: 80),
            imageContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            imageContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            titleContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            titleContainer.leadingAnchor.constraint(equalTo: self.imageContainer.trailingAnchor, constant: 10),
            titleContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
            ])
    }
    
    func addSubviews() {
        contentView.addSubview(imageContainer)
        contentView.addSubview(titleContainer)
    }

}
