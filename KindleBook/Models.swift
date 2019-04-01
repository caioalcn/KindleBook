//
//  Models.swift
//  KindleBook
//
//  Created by Dev iOS on 01/04/19.
//  Copyright © 2019 Red Ice. All rights reserved.
//

import Foundation


struct Book {
    let title: String
    let author: String
    let pages: [Page]
    
    init(title: String, author: String, pages: [Page]) {
        self.title = title
        self.author = author
        self.pages = pages
    }
}

struct Page {
    let number: Int
    let text: String
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
}

