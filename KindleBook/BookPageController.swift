//
//  BookPageController.swift
//  KindleBook
//
//  Created by Caio Alcântara on 04/04/19.
//  Copyright © 2019 Red Ice. All rights reserved.
//

import UIKit


class BookPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var book: Book? {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "itemid")
        collectionView.isPagingEnabled = true
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0
        navigationItem.title = book?.title
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseBook))
        
    }
    
    @objc func handleCloseBook() {
        dismiss(animated: true, completion: nil)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.pages.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemid", for: indexPath) as! PageCell
        
        let page = book?.pages[indexPath.row]
     
        cell.page = page
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height  - 44 - 20);
    }

}
