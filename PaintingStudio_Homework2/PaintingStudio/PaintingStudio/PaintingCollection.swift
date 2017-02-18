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
    func paintingWithIndex(paintingIndex: Int) -> Painting {
        return _paintings[paintingIndex]
    }
    
    func createPainting(painting: Painting) {
        _paintings.append(painting)
    }
    
    func deletePaintingIndex(index: Int) {
        _paintings.remove(at: index)
    }
    
    func addStroke(stroke: Stroke, toPainting paintIndex: Int) {
        let painting: Painting = paintingWithIndex(paintingIndex: paintIndex)
        painting.strokes.append(stroke)
        delegate?.collection(collection: self, strokeAddedToPainting: paintIndex)
    }

    // MARK: - Events
    weak var delegate: PaintingCollectionDelegate?
}
