//
//  NoData.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/10/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

class NoDataCell: UITableViewCell {
    
    let foodTitlePlaceholderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let noDataText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.text = "Sorry, no data to display"
        return label
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
            foodTitlePlaceholderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            foodTitlePlaceholderView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            foodTitlePlaceholderView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            foodTitlePlaceholderView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            noDataText.centerXAnchor.constraint(equalTo: foodTitlePlaceholderView.centerXAnchor),
            noDataText.centerYAnchor.constraint(equalTo: foodTitlePlaceholderView.centerYAnchor),
            noDataText.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
    
    func addSubviews() {
        contentView.addSubview(foodTitlePlaceholderView)
        foodTitlePlaceholderView.addSubview(noDataText)
    }

}

