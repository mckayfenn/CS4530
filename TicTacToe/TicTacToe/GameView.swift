//
//  GameView.swift
//  TicTacToe
//
//  Created by u0939404 on 3/8/17.
//  Copyright © 2017 mckayfenn. All rights reserved.
//

import UIKit

class GameView: UIView {
    
    
    // ------------------------------
    // MARK: - UIView Overrides
    // ------------------------------
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // make grid holder
        var gridRect: CGRect = CGRect.zero
        let dimension: CGFloat = min(bounds.width, bounds.height)
        gridRect.size.width = dimension
        gridRect.size.height = dimension
        if (bounds.width < bounds.height) { // portrait
            gridRect.origin.x = 0
            gridRect.origin.y = bounds.height * 0.5 - gridRect.size.height * 0.5
        }
        else {
            gridRect.origin.x = bounds.width * 0.5 - gridRect.size.width * 0.5
            gridRect.origin.y = 0
        }
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.addRect(gridRect)
        context.setFillColor(UIColor.white.cgColor)
        context.drawPath(using: .fill)
        
        
        
        // draw grid lines
        
        //vertical
        context.move(to: CGPoint(x: gridRect.minX + gridRect.width * 0.333, y: gridRect.minY))
        context.addLine(to: CGPoint(x: gridRect.minX + gridRect.width * 0.333, y: gridRect.maxY))
        
        context.move(to: CGPoint(x: gridRect.minX + gridRect.width * 0.666, y: gridRect.minY))
        context.addLine(to: CGPoint(x: gridRect.minX + gridRect.width * 0.666, y: gridRect.maxY))
        
        
        // horizontal
        context.move(to: CGPoint(x: gridRect.minX, y: gridRect.minY + gridRect.height * 0.333))
        context.addLine(to: CGPoint(x: gridRect.maxX, y: gridRect.minY + gridRect.height * 0.333))
        
        context.move(to: CGPoint(x: gridRect.minX, y: gridRect.minY + gridRect.height * 0.666))
        context.addLine(to: CGPoint(x: gridRect.maxX, y: gridRect.minY + gridRect.height * 0.666))
        
        context.setLineWidth(dimension * 0.01)
        context.setStrokeColor(UIColor.black.cgColor)
        context.drawPath(using: .stroke)
        
        
        // Draw game tokens
        for tokenIndex: Int in 0 ..< min(9, tokens.count) {
            let token: NSString = tokens[tokenIndex] as NSString
            let tokenCol: Int = tokenIndex % 3
            let tokenRow: Int = tokenIndex / 3
            
            var tokenRect: CGRect = CGRect.zero
            tokenRect.size.width = gridRect.width * 0.333
            tokenRect.size.height = gridRect.height * 0.333
            tokenRect.origin.x = gridRect.minX + tokenRect.width * CGFloat(tokenCol)
            tokenRect.origin.y = gridRect.minY + tokenRect.height * CGFloat(tokenRow)
            
            let tokenTextAttributes: [String:Any] = [NSFontAttributeName:UIFont.boldSystemFont(ofSize: tokenRect.width * 0.5)]
            let tokenSize: CGSize = token.size(attributes: tokenTextAttributes)
            token.draw(at: CGPoint(x: tokenRect.midX - tokenSize.width * 0.5, y: tokenRect.midY - tokenSize.height * 0.5), withAttributes: tokenTextAttributes)
        }
    }
    
    
    public var tokens: [String] = ["X", "X", "X", "X", "X", "X", "X", "X", "X"]{
        didSet {
            setNeedsDisplay()
        }
    }
}
