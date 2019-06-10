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

class Skeleton: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imageContainer)
        contentView.addSubview(titleContainer)
        
        imageContainer.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        imageContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        
        titleContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        titleContainer.leadingAnchor.constraint(equalTo: self.imageContainer.trailingAnchor, constant: 10).isActive = true
        titleContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
    }
    
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
