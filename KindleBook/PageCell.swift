//
//  PageCell.swift
//  KindleBook
//
//  Created by Caio Alcântara on 04/04/19.
//  Copyright © 2019 Red Ice. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
             textLabel.text = page?.text
        }
    }
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "dasdas"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLabel)
        
        NSLayoutConstraint.activate([textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
