//
//  PaintingViewController.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/17/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class PaintingViewController: UIViewController, BrushChooserDelegate {
    

    private var _paintingCollection: PaintingCollection? = nil
    private var _paintingIndex: Int? = nil
    
    private var _brushChooser: BrushChooser? = nil
    private var _brushChooserController: BrushChooserController? = nil
    
    private var _undoStack = [Line]()
    private var _cellUndoStack = [CellLine]()
    
    var paintingCollection: PaintingCollection? {
        get { return _paintingCollection }
        set { _paintingCollection = newValue }
    }
    var paintingIndex: Int? {
        get { return _paintingIndex }
        set { _paintingIndex = newValue }
    }
    
    var paintView: PaintingView {
        return view as! PaintingView
    }
    
    var cellView: CellView = CellView()
    
    override func loadView() {
        view = PaintingView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let undo: UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .undo, target: self, action: #selector(undoSelected))
        let redo: UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .redo, target: self, action: #selector(redoSelected))
        let brush: UIBarButtonItem = UIBarButtonItem.init(title: "Brush", style: .plain, target: self, action: #selector(brushSelected))
        let delete: UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .trash, target: self, action: #selector(deletePaintingSelected))
        
        super.navigationItem.rightBarButtonItems = [delete, brush, redo, undo]
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if (_paintingCollection == nil || _paintingIndex == nil) {
            return
        }
        
        let painting: Painting = _paintingCollection!.paintingWithIndex(paintingIndex: paintingIndex!)
        paintView.painting = painting
    }
    
    
    func deletePaintingSelected() {
        NSLog("delete painting")
        _paintingCollection?.deletePaintingIndex(index: paintingIndex!)
        _ = navigationController?.popViewController(animated: true)
    }
    
    func brushSelected() {
        NSLog("Brush Chooser selected")
        super.viewDidLoad()
        
        
        // open brush chooser
        _brushChooserController = BrushChooserController()
        _brushChooserController?.delegate = self
        self.navigationController?.pushViewController(_brushChooserController!, animated: true)
    }
    
    func back(sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func undoSelected() {
        let painting: Painting = _paintingCollection!.paintingWithIndex(paintingIndex: paintingIndex!)
        
        if (!painting.lines.isEmpty) {
            let line = painting.lines.popLast()
            _undoStack.append(line!)
            view.setNeedsDisplay()
            
            let cellLine = painting.cellLines.popLast()
            _cellUndoStack.append(cellLine!)
            cellView.setNeedsDisplay()
        }
        

    }
    func redoSelected() {
        let painting: Painting = _paintingCollection!.paintingWithIndex(paintingIndex:  paintingIndex!)
        
        if (!_undoStack.isEmpty) {
            painting.lines.append((_undoStack.popLast())!)
            view.setNeedsDisplay()
            
            painting.cellLines.append(_cellUndoStack.popLast()!)
            cellView.setNeedsDisplay()
        }
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        _undoStack.removeAll()
        let line = Line()
        line.width = _width
        line.color = _color
        line.join = _join
        line.cap = _cap
        paintView.painting.addLine(line: line)
        
        let cellLine = CellLine()
        cellLine.width = _width / 2.25
        cellLine.color = _color
        cellLine.join = _join
        cellLine.cap = _cap
        paintView.painting.addCellLine(cellLine: cellLine)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        
        var touchPoint = touch.location(in: paintView)
        paintView.painting.lines.last?.addPoint(point: touchPoint)
        
        touchPoint.x = touchPoint.x / 2.25
        touchPoint.y = touchPoint.y / 2.25
        paintView.painting.cellLines.last?.addPoint(point: touchPoint)
        //NSLog("\(touchPoint)")
        paintView.setNeedsDisplay()
    }
    
    
    
    var _width: CGFloat = 1.0
    var _color: UIColor = UIColor.white
    var _cap: CGLineCap = .butt
    var _join: CGLineJoin = .round
    
    
    
    
    
    func widthChanged(width: CGFloat) {
        _width = width
        paintView._width = _width
        cellView._width = _width
    }
    func colorChanged(color: UIColor) {
        _color = color
        paintView._color = _color
        cellView._color = _color
    }
    func capChanged(cap: CGLineCap) {
        _cap = cap
        paintView._cap = _cap
        cellView._cap = _cap
    }
    func joinChanged(join: CGLineJoin) {
        _join = join
        paintView._join = _join
        cellView._join = _join
    }
}
