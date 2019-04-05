//
//  Models.swift
//  KindleBook
//
//  Created by Dev iOS on 01/04/19.
//  Copyright © 2019 Red Ice. All rights reserved.
//

import UIKit

struct Book {
    let title: String
    let author: String
    let image: UIImage
    let pages: [Page]
    
    init(title: String, author: String, image: UIImage, pages: [Page]) {
        self.title = title
        self.author = author
        self.image = image
        self.pages = pages
    }
    
    init(dict: [String: Any]) {
        self.title = dict["title"] as? String ?? ""
        self.author = dict["author"] as? String ?? ""
        self.image = #imageLiteral(resourceName: "steve_jobs")
        
        var totalPages = [Page]()

        if let dictpages = dict["pages"] as? [[String: Any]] {
            dictpages.forEach { (pages) in
                let p = Page(dict: pages)
                
                totalPages.append(p)
            }
         }
        self.pages = totalPages

    }
}

struct Page {
    let number: Int
    let text: String
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
    
    init(dict: [String: Any]) {
        self.number = dict["id"] as? Int ?? 0
        self.text = dict["text"] as? String ?? ""
    }
}

