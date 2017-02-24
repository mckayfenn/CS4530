//
//  PaintingCollection.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/17/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import Foundation

protocol PaintingCollectionDelegate: class {
    func collection(collection: PaintingCollection, strokeAddedToPainting paintIndex: Int)
}

class PaintingCollection {
    private var _paintings: [Painting] = []
    
    
    // MARK: - Indexing paintings
    var paintingCount: Int {
        return _paintings.count
    }

    // MARK: - Accessing Paintings
    func createPainting(painting: Painting) {
        _paintings.append(painting)
        NSLog("new painting created. \(_paintings.count)")
    }
    
    func paintingWithIndex(paintingIndex: Int) -> Painting {
        return _paintings[paintingIndex]
    }
    
    func deletePaintingIndex(index: Int) {
        _paintings.remove(at: index)
    }

    // MARK: - Events
    weak var delegate: PaintingCollectionDelegate?
}
