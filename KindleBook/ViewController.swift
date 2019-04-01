//
//  ViewController.swift
//  KindleBook
//
//  Created by Caio Alcântara on 29/03/19.
//  Copyright © 2019 Red Ice. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var books: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Kindle"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        let book = books?[indexPath.row]
        
        cell.textLabel?.text = book?.title
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    
    func setupBooks() {
        let page1 = Page(number: 1, text: "Text for the first page")
        let page2 = Page(number: 2, text: "This is text for second page")
        
        let pages = [page1, page2]
        
        let book = Book(title: "Steve Jobs", author: "Walter Isaacson", pages: pages)
        
        let book2 = Book(title: "Bill Gates: A Biography", author: "Michael Becraft", pages:
            [Page(number: 1, text: "Text for page 1"),
             Page(number: 2, text: "Text for page 2"),
             Page(number: 3, text: "Text for page 3"),
             Page(number: 4, text: "Text for page 4")
            ])
        
        self.books = [book, book2]
    }
}

