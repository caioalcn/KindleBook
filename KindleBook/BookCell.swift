//
//  BookCell.swift
//  KindleBook
//
//  Created by Caio Alcântara on 04/04/19.
//  Copyright © 2019 Red Ice. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {

    var book: Book? {
        didSet{
            coverImage.image = book?.image
            titleLabel.text = book?.title
            describingLabel.text = book?.author
        }
    }
    
    private let coverImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let describingLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(coverImage)
        addSubview(titleLabel)
        addSubview(describingLabel)
 
        NSLayoutConstraint.activate([coverImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            coverImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            coverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            coverImage.widthAnchor.constraint(equalToConstant: 50),
            
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            describingLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            describingLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 8),
            describingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            describingLabel.heightAnchor.constraint(equalToConstant: 20)])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
