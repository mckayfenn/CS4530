//
//  BrushChooserController.swift
//  PaintingStudio
//
//  Created by u0939404 on 2/22/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

protocol BrushChooserDelegate: class {
    func colorChanged(color: UIColor)
    func widthChanged(width: CGFloat)
    func capChanged(cap: CGLineCap)
    func joinChanged(join: CGLineJoin)
}

class BrushChooserController: UIViewController {
    
    private var _brushChooser: BrushChooser? = BrushChooser(frame: UIScreen.main.bounds)
    

    override func loadView() {
        super.loadView()
        view = _brushChooser
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // make back button
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton

        
        // make targets/selectors for changes
        _brushChooser?.colorWheel?.addTarget(self, action: #selector(knobChanged), for: UIControlEvents.valueChanged)
        
        _brushChooser?.endCap?.addTarget(self, action: #selector(buttButton), for: UIControlEvents.touchDown)
        
        _brushChooser?.strokeWidth?.widthSlider.addTarget(self, action: #selector(widthChanged), for: UIControlEvents.valueChanged)
        
        _brushChooser?.strokeJoin?.addTarget(self, action: #selector(joinSelected), for: UIControlEvents.touchDown)
    }
    
    
    func back(sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func knobChanged() {
        //NSLog("Changed to: \(_brushChooser?.colorWheel?.angle)")
        _brushChooser?.preview?.color = (_brushChooser?.colorWheel?.color)!
        //paintView.painting.color = (_brushChooser?.colorWheel?.color)!
        delegate?.colorChanged(color: (_brushChooser?.colorWheel?.color)!)
    }
    
    func buttButton() {
        //NSLog(".butt selected")
        let point = Float((_brushChooser?.endCap?.touchPoint.x)!)
        let buttX = Float((_brushChooser?.endCap?.buttButton?.maxX)!)
        let roundX = Float((_brushChooser?.endCap?.roundButton?.maxX)!)
        let squareX = Float((_brushChooser?.endCap?.squareButton?.maxX)!)
        
        if (point < buttX)
        {
            //NSLog(".butt selected")
            _brushChooser?.preview?.capState = CGLineCap.butt
            _brushChooser?.endCap?.buttSelected()
            //paintView.painting.cap = CGLineCap.butt
            delegate?.capChanged(cap: .butt)
        }
        else if (point < roundX)
        {
            //NSLog(".round selected")
            _brushChooser?.preview?.capState = CGLineCap.round
            _brushChooser?.endCap?.roundSelected()
            //paintView.painting.cap = CGLineCap.round
            delegate?.capChanged(cap: .round)
        }
        else if (point < squareX)
        {
            //NSLog(".square selected")
            _brushChooser?.preview?.capState = CGLineCap.square
            _brushChooser?.endCap?.squareSelected()
            //paintView.painting.cap = CGLineCap.square
            delegate?.capChanged(cap: .square)
        }
        
    }
    
    func joinSelected()
    {
        let point = Float((_brushChooser?.strokeJoin?.touchPoint.x)!)
        let miterX = Float((_brushChooser?.strokeJoin?.miterJoin?.maxX)!)
        let roundX = Float((_brushChooser?.strokeJoin?.roundJoin?.maxX)!)
        let bevelX = Float((_brushChooser?.strokeJoin?.bevelJoin?.maxX)!)
        
        if (point < miterX)
        {
            //NSLog(".miterJoin selected")
            _brushChooser?.preview?.joinState = CGLineJoin.miter
            _brushChooser?.strokeJoin?.miterSelected()
            //paintView.painting.join = .miter
            delegate?.joinChanged(join: .miter)
        }
        else if (point < roundX)
        {
            //NSLog(".roundJoin selected")
            _brushChooser?.preview?.joinState = CGLineJoin.round
            _brushChooser?.strokeJoin?.roundSelected()
            //paintView.painting.join = .round
            delegate?.joinChanged(join: .round)
        }
        else if (point < bevelX)
        {
            //NSLog(".bevelJoin selected")
            _brushChooser?.preview?.joinState = CGLineJoin.bevel
            _brushChooser?.strokeJoin?.bevelSelected()
            //paintView.painting.join = .bevel
            delegate?.joinChanged(join: .bevel)
        }
    }
    
    func widthChanged()
    {
        //NSLog("Width changed")
        _brushChooser?.preview?.width = CGFloat((_brushChooser?.strokeWidth?.widthSlider.value)!)
        //paintView.painting.width = CGFloat((_brushChooser?.strokeWidth?.widthSlider.value)!)
        delegate?.widthChanged(width: CGFloat((_brushChooser?.strokeWidth?.widthSlider.value)!))
    }
    
    
    weak var delegate: BrushChooserDelegate? = nil

}
