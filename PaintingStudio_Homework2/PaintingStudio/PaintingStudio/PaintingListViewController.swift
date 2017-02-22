//
//  PaintingListViewController.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/17/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class PaintingListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, PaintingCollectionDelegate {
    
    private var _paintingCollection: PaintingCollection = PaintingCollection()

    
    var paintingListView: UICollectionView {
        return view as! UICollectionView
    }

    
    // MARK: - UIViewController Overrides
    override func loadView() {
        let paintingsListLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        view = UICollectionView(frame: CGRect.zero, collectionViewLayout: paintingsListLayout)
    }
    
    override func viewDidLoad() {
        _paintingCollection.delegate = self
        
        paintingListView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(UICollectionViewCell.self))
        paintingListView.backgroundColor = UIColor.lightGray
        
        let addButton = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(createPaintingClicked))
        self.navigationItem.rightBarButtonItem = addButton
        
        paintingListView.dataSource = self
        paintingListView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        paintingListView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        NSLog("\(_paintingCollection.paintingCount)")
        // Return the number of items in the data model
        return _paintingCollection.paintingCount
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Obtain data element based on indexPath
        let painting: Painting = _paintingCollection.paintingWithIndex(paintingIndex: indexPath.item)
        
        
        // fill in the cell with the painting
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(UICollectionViewCell.self), for: indexPath)
        cell.backgroundColor = UIColor.white
        
        
        
        let titleLabel: UILabel = cell.contentView.subviews.count == 0 ? UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0)) : cell.contentView.subviews[0] as! UILabel
        titleLabel.text = "\(painting.strokes.count)"
        cell.contentView.addSubview(titleLabel)
        
        return cell
    }
    
    
    // MARK: - UICollecitonViewDelegate Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Obtain data element based on indexPath
        //let painting: Painting = _paintingCollection.paintingWithIndex(paintingIndex: indexPath.item)
        let paintingIndex: Int = indexPath.item
        
        // Build a view controller and get it the data it needs

        let paintViewController: PaintingViewController = PaintingViewController()
        paintViewController.paintingCollection = _paintingCollection
        paintViewController.paintingIndex = paintingIndex
        
        
        
        navigationController?.pushViewController(paintViewController, animated: true)
    }
    
    func createPaintingClicked() {
        _paintingCollection.createPainting(painting: Painting())
        paintingListView.reloadData()
    }
    
//    private func paintingFromPaintView(paintView: PaintView) -> Painting {
//        // Convert from PaintView to a Painting
//    }
//    
//    private func painting(paint: Painting, toPaintView: PaintView) {
//        // Convert from Painting to PaintView
//    }

    // MARK: - PaintingCollectionDelegate Methods
    func collection(collection: PaintingCollection, strokeAddedToPainting paintIndex: Int) {
        paintingListView.reloadData()
    }
}
