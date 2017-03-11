//
//  GameView.swift
//  MVCBattleship_Homework3
//
//  Created by u0939404 on 3/10/17.
//  Copyright © 2017 mckay fenn. All rights reserved.
//

import UIKit

class GameView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        // draw enemy players rect
        var enemyShipsRect: CGRect = CGRect.zero
        let dimension: CGFloat = min(bounds.width, bounds.height)
        enemyShipsRect.size.width = dimension
        enemyShipsRect.size.height = dimension
        
        if (bounds.width < bounds.height) { // portrait
            enemyShipsRect.origin.x = 0
            enemyShipsRect.origin.y = enemyShipsRect.height - enemyShipsRect.height / 4
        }
        else { // landscape
            enemyShipsRect.origin.x = enemyShipsRect.width * 0.5 + enemyShipsRect.width / 4
            enemyShipsRect.origin.y = 0
        }
        
        
        context.addRect(enemyShipsRect)
        context.setFillColor(UIColor.blue.cgColor)
        context.drawPath(using: .fill)
        
        
        
        
        // draw current players rect
        var myShipsRect: CGRect = CGRect.zero
        myShipsRect.size.width = dimension / 2
        myShipsRect.size.height = dimension / 2
        
        if (bounds.width < bounds.height) { // portrait
            myShipsRect.origin.x = myShipsRect.width / 2
            myShipsRect.origin.y = myShipsRect.height / 3
        }
        else { // landscape
            myShipsRect.origin.x = myShipsRect.width / 3
            myShipsRect.origin.y = myShipsRect.height / 2
        }
        
        context.addRect(myShipsRect)
        context.setFillColor(UIColor.lightGray.cgColor)
        context.drawPath(using: .fill)
        
        
        

        
        
        // Draw ships, hit or misses
        for tokenIndex: Int in 0 ..< min (100, p1Grid.count) {
            let token: NSString = p1Grid[tokenIndex] as NSString
            let tokenCol: Int = tokenIndex % 10
            let tokenRow: Int = tokenIndex / 10
            
            var tokenRect: CGRect = CGRect.zero
            tokenRect.size.width = enemyShipsRect.width * 0.1
            tokenRect.size.height = enemyShipsRect.height * 0.1
            tokenRect.origin.x = enemyShipsRect.minX + tokenRect.width * CGFloat(tokenCol)
            tokenRect.origin.y = enemyShipsRect.minY + tokenRect.height * CGFloat(tokenRow)
            
            //context.addRect(tokenRect)
            if (token == "none") {
                // don't have to draw anything
            }
            else if (token == "miss") {
                context.addRect(tokenRect)
                context.setFillColor(UIColor.white.cgColor)
                context.drawPath(using: .fill)
            }
            else if (token == "hit") {
                context.addRect(tokenRect)
                context.setFillColor(UIColor.red.cgColor)
                context.drawPath(using: .fill)
            }
        }
        
        // Draw ships, hit or misses
        for tokenIndex: Int in 0 ..< min (100, p2Grid.count) {
            let token: NSString = p2Grid[tokenIndex] as NSString
            let tokenCol: Int = tokenIndex % 10
            let tokenRow: Int = tokenIndex / 10
            
            var tokenRect: CGRect = CGRect.zero
            tokenRect.size.width = myShipsRect.width * 0.1
            tokenRect.size.height = myShipsRect.height * 0.1
            tokenRect.origin.x = myShipsRect.minX + tokenRect.width * CGFloat(tokenCol)
            tokenRect.origin.y = myShipsRect.minY + tokenRect.height * CGFloat(tokenRow)
            
            //context.addRect(tokenRect)
            if (token == "none") {
                // don't have to draw anything
            }
            else if (token == "miss") {
                context.addRect(tokenRect)
                context.setFillColor(UIColor.white.cgColor)
                context.drawPath(using: .fill)
            }
            else if (token == "ship") {
                context.addRect(tokenRect)
                context.setFillColor(UIColor.darkGray.cgColor)
                context.drawPath(using: .fill)
            }
            else if (token == "hit") {
                context.addRect(tokenRect)
                context.setFillColor(UIColor.red.cgColor)
                context.drawPath(using: .fill)
            }
        }
        
        
        
        
        
        // draw enemy grid lines VERTICAL
        for i in 1...9 {
            context.move(to: CGPoint(x: enemyShipsRect.minX + enemyShipsRect.width * 0.1 * CGFloat(i), y: enemyShipsRect.minY))
            context.addLine(to: CGPoint(x: enemyShipsRect.minX + enemyShipsRect.width * 0.1 * CGFloat(i), y: enemyShipsRect.maxY))
        }
        // HORIZONTAL
        for i in 1...9 {
            context.move(to: CGPoint(x: enemyShipsRect.minX , y: enemyShipsRect.minY + enemyShipsRect.height * 0.1 * CGFloat(i)))
            context.addLine(to: CGPoint(x: enemyShipsRect.maxX, y: enemyShipsRect.minY + enemyShipsRect.height * 0.1 * CGFloat(i)))
        }
        context.setLineWidth(dimension * 0.003)
        context.setStrokeColor(UIColor.black.cgColor)
        context.drawPath(using: .stroke)
        
        
        // draw my grid lines VERTICAL
        for i in 1...9 {
            context.move(to: CGPoint(x: myShipsRect.minX + myShipsRect.width * 0.1 * CGFloat(i), y: myShipsRect.minY))
            context.addLine(to: CGPoint(x: myShipsRect.minX + myShipsRect.width * 0.1 * CGFloat(i), y: myShipsRect.maxY))
        }
        // HORIZONTAL
        for i in 1...9 {
            context.move(to: CGPoint(x: myShipsRect.minX , y: myShipsRect.minY + myShipsRect.height * 0.1 * CGFloat(i)))
            context.addLine(to: CGPoint(x: myShipsRect.maxX, y: myShipsRect.minY + myShipsRect.height * 0.1 * CGFloat(i)))
        }
        context.setLineWidth(dimension * 0.001)
        context.setStrokeColor(UIColor.black.cgColor)
        context.drawPath(using: .stroke)
    }
    

    public var p1Grid: [String] = ["none", "none", "none", "none", "none", "hit", "hit", "none", "none", "none",
                                   "miss", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "miss", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "ship", "ship", "ship", "none", "none", "none", "none", "none", "none", "none"
                                    ]
    public var p2Grid: [String] = ["none", "hit", "hit", "hit", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "miss", "miss", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "ship", "ship", "ship", "ship"
                                    ]
}
