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
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
        
        fetchBooks()
    }
    
    
    func fetchBooks() {
        
        guard let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let err = error {
                print(err)
                return
            }
            
            
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)

                guard let bookDictionary = json as? [[String: Any]] else { return }
                self.books = []
                 bookDictionary.forEach({ (book) in

                    let book = Book(dict: book)
                    
                    self.books?.append(book)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                })
                
            } catch (let err) {
                
            }
            
        }).resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BookCell
        
        let book = books?[indexPath.row]
        
        cell.book = book
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedBook = self.books?[indexPath.row]
        
        let layout = UICollectionViewFlowLayout()
        let bookPageController = BookPageController(collectionViewLayout: layout)
        
        bookPageController.book = selectedBook

        let navController = UINavigationController(rootViewController: bookPageController)
        
        present(navController , animated: true, completion: nil)
        
    }  
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    
    func setupBooks() {
        let page1 = Page(number: 1, text: "Text for the first page")
        let page2 = Page(number: 2, text: "This is text for second page")
        
        let pages = [page1, page2]
        
        let book = Book(title: "Steve Jobs", author: "Walter Isaacson", image: #imageLiteral(resourceName: "steve_jobs") , pages: pages)
        
        
        
        let book2 = Book(title: "Bill Gates: A Biography", author: "Michael Becraft", image: #imageLiteral(resourceName: "bill_gates"), pages:
            [Page(number: 1, text: "Text for page 1"),
             Page(number: 2, text: "Text for page 2"),
             Page(number: 3, text: "Text for page 3"),
             Page(number: 4, text: "Text for page 4")
            ])
        
        self.books = [book, book2]
    }
}

