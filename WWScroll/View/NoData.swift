//
//  NoData.swift
//  WWScroll
//
//  Created by Emmanuel Ramirez on 6/10/19.
//  Copyright © 2019 Emmanuel Ramirez. All rights reserved.
//

import UIKit

class NoData: UITableViewCell {
    
    let textContainer: UIView = {
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
        textContainer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        textContainer.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        textContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        textContainer.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        noDataText.centerXAnchor.constraint(equalTo: textContainer.centerXAnchor).isActive = true
        noDataText.centerYAnchor.constraint(equalTo: textContainer.centerYAnchor).isActive = true
        noDataText.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func addSubviews() {
        contentView.addSubview(textContainer)
        textContainer.addSubview(noDataText)
    }

}

