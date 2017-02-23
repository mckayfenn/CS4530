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
    
    private var _undoStack: [Line]? = []
    private var _redoStack: [Line]? = []
    
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
        paintView.painting = painting
        //labelView.text = "this is a painting"
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
    
//    private func polylineToStroke(line: PolyLine) -> Stroke {
//        // get color components
//        let c = line.color
//        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0
//        c.getRed(&r, green: &g, blue: &b, alpha: nil)
//        
//        let stroke: Stroke = Stroke()
//        stroke.color = Color(r: Double(r), g: Double(g), b: Double(b))
//        
//        stroke.width = Double(line.width)
//
//        
//        return stroke
//    }
//    
//    private func pointToCGPoint(point: Point) -> CGPoint {
//        return CGPoint(x: point.x, y: point.y)
//    }
//    private func cgpointToPoint(cgpoint: CGPoint) -> Point {
//        let point: Point = Point()
//        point.x = Double(cgpoint.x)
//        point.y = Double(cgpoint.y)
//        return point
//    }
//    
//    private func paintViewtoPainting(view: PaintingView) -> Painting {
//        let paint: Painting = Painting()
//        //paint.strokes
//        
//        return paint
//    }
    
    func deletePaintingSelected() {
        NSLog("delete painting")
        _paintingCollection?.deletePaintingIndex(index: paintingIndex!)
        _ = navigationController?.popViewController(animated: true)
    }
    
    func brushSelected() {
        NSLog("Brush Chooser selected")
        super.viewDidLoad()
        // open brush chooser
//        _brushChooser = BrushChooser(frame: UIScreen.main.bounds)
//        paintView.addSubview(_brushChooser!)
//        
//        self.navigationItem.hidesBackButton = true
//        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(PaintingViewController.back(sender:)))
//        self.navigationItem.leftBarButtonItem = newBackButton
//        
//        _brushChooser?.colorWheel?.addTarget(self, action: #selector(knobChanged), for: UIControlEvents.valueChanged)
//        
//        _brushChooser?.endCap?.addTarget(self, action: #selector(buttButton), for: UIControlEvents.touchDown)
//        
//        _brushChooser?.strokeWidth?.widthSlider.addTarget(self, action: #selector(widthChanged), for: UIControlEvents.valueChanged)
//        
//        _brushChooser?.strokeJoin?.addTarget(self, action: #selector(joinSelected), for: UIControlEvents.touchDown)
        
        _brushChooserController = BrushChooserController()
        _brushChooserController?.delegate = self
        //self.present(_brushChooser!, animated: true, completion: nil)
        self.navigationController?.pushViewController(_brushChooserController!, animated: true)
    }
    
    func back(sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func undoSelected() {
        let painting: Painting = _paintingCollection!.paintingWithIndex(paintingIndex: paintingIndex!)
        
        let line = painting.lines.popLast()!
        _undoStack?.append(line)
        paintView.setNeedsDisplay()

    }
    func redoSelected() {
        paintView.painting.lines.append((_undoStack?.popLast())!)
        paintView.setNeedsDisplay()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let line: Line = Line()
        line.width = _width
        line.color = _color
        line.join = _join
        line.cap = _cap
        paintView.painting.addLine(line: line)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        
        let touchPoint = touch.location(in: paintView)
        paintView.painting.lines.last?.addPoint(point: touchPoint)
        //NSLog("\(touchPoint)")
        paintView.setNeedsDisplay()
    }
    

    
    
    
    var _width: CGFloat = 1.0
    var _color: UIColor = UIColor.white
    var _cap: CGLineCap = .butt
    var _join: CGLineJoin = .round
    
    
    
    
    
    func widthChanged(width: CGFloat) {
        //paintView.painting.lines[paintView.painting.lines.count - 1].width = width
        _width = width
    }
    func colorChanged(color: UIColor) {
        //paintView.painting.lines[paintView.painting.lines.count - 1].color = color
        _color = color
    }
    func capChanged(cap: CGLineCap) {
        //paintView.painting.lines[paintView.painting.lines.count - 1].cap = cap
        _cap = cap
    }
    func joinChanged(join: CGLineJoin) {
        //paintView.painting.lines[paintView.painting.lines.count - 1].join = join
        _join = join
    }
}
