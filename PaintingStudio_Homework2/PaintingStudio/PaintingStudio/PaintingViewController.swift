//
//  PaintingViewController.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/17/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class PaintingViewController: UIViewController {
    private var _paintingCollection: PaintingCollection? = nil
    private var _paintingIndex: Int? = nil
    
    var paintingCollection: PaintingCollection? {
        get { return _paintingCollection }
        set { _paintingCollection = newValue }
    }
    var paintingIndex: Int? {
        get { return _paintingIndex }
        set { _paintingIndex = newValue }
    }
    
    var labelView: UILabel {
        return view as! UILabel
    }
    
    override func loadView() {
        view = UILabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelView.textAlignment = NSTextAlignment.center
        labelView.backgroundColor = UIColor.white
        labelView.numberOfLines = -1
        super.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "delete", style: .plain, target: self, action: #selector(deletePaintingSelected))
    }
    
//    var painting: Painting? {
//        didSet {
//            // Load painting into view
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if (_paintingCollection == nil || _paintingIndex == nil) {
            return
        }
        
        // TODO: Convert between a painting object from the data model and the data structure the painting view uses to store this
        //painting(painting, toPaintView: PaintingViewController.paintView)
        //paintViewController.labelView.text = "This painting is ugly! \(painting.strokes.count) that many strokes."
        let painting: Painting = _paintingCollection!.paintingWithIndex(paintingIndex: paintingIndex!)
        labelView.text = "this is a painting with \(painting.strokes.count) strokes."
    }
    
//    private func strokeToPolyLine(stroke: Stroke) -> PolyLine {
//        // TODO: Convert color and line characteristics
//        
//        for point: Point in stroke.points {
//            // from 0-1 to 0-view.bounds
//            let polylinePoint: CGPoint = CGPoint.zero
//            polylinePoint.x = point.x * paintingView.bounds.width
//            polylinePoint.y = point.x * paintingView.bounds.height
//        }
//    }
    
    func deletePaintingSelected() {
        NSLog("delete painting")
        _paintingCollection?.deletePaintingIndex(index: paintingIndex!)
        
        
    }
    
    
}
