//
//  GameModel.swift
//  MVCBattleship_Homework3
//
//  Created by u0939404 on 3/10/17.
//  Copyright © 2017 mckay fenn. All rights reserved.
//

import Foundation

protocol GameModelDelegate: class {
    func showTouchedStatus(status: String)
}

class Game {
    
    public enum Ships {
        case none
        case hit
        case miss
        case ship
    }
    
    private var currentPlayer1: Bool = false // start out with p1
    
    
    
    init() {
        placeShips()
        
    }
    
    ///
    /// Place ships randomly
    ///
    private func placeShips() {
        // List of Ships
        let ships = [5, 4, 3, 3, 2]
        
        var allShipsPlaced = 0
        
        var currentShipIndex = 0
        var currentShip = ships[currentShipIndex]
        
        while allShipsPlaced < 5 {
            if (placeShip(shipLength: currentShip)) {
                NSLog("Ship \(currentShip) placed")
                if (currentShipIndex < 4) {
                    currentShipIndex = currentShipIndex + 1
                    currentShip = ships[currentShipIndex]
                }
                allShipsPlaced = allShipsPlaced + 1
            }
        }
        
        
        
        
        // Now do it again for grid2

        allShipsPlaced = 0
        currentShipIndex = 0
        currentShip = ships[currentShipIndex]
        
        while allShipsPlaced < 5 {
            if (placeShip2(shipLength: currentShip)) {
                NSLog("P2 Ship \(currentShip) placed")
                if (currentShipIndex < 4) {
                    currentShipIndex = currentShipIndex + 1
                    currentShip = ships[currentShipIndex]
                }
                allShipsPlaced = allShipsPlaced + 1
            }
        }
       
    }
    
    
    
    private func placeShip(shipLength: Int) -> Bool{
        
        
        let randX = Int(arc4random_uniform(10)) // column
        let randY = Int(arc4random_uniform(10)) // row
        let orientation = Int(arc4random_uniform(2))
        
        var validPlace = true
        
        if (orientation == 0)  { // Horizontal
            var xPos = randX
            for length: Int in 0 ..< shipLength {
                
                if (xPos < 10 && _p1Grid[randY][xPos] == .none) {
                    validPlace = true
                }
                else {
                    validPlace = false
                    return validPlace
                }
                
                // If all positions were valid then place the ship
//                if (length == shipLength - 1 && validPlace) {
//                    setShip(grid: 1, ship: shipLength, randY: randY, randX: randX, orientation: orientation)
//                }
                
                xPos = xPos + 1
            }
            // if it got to here then it's a valid position
            
            setShip(grid: 1, ship: shipLength, randY: randY, randX: randX, orientation: orientation)
            
        }
        else { // Vertical
            var yPos = randY
            for length: Int in 0 ..< shipLength {
                
                if (yPos < 10 && _p1Grid[yPos][randX] == .none) {
                    validPlace = true
                }
                else {
                    validPlace = false
                    return validPlace
                }
                
                // If all positions were valid then place the ship
//                if (length == shipLength - 1 && validPlace) {
//                    setShip(grid: 1, ship: shipLength, randY: randY, randX: randX, orientation: orientation)
//                }
                
                yPos = yPos + 1
            }
            setShip(grid: 1, ship: shipLength, randY: randY, randX: randX, orientation: orientation)
        }
        
        return validPlace
    }
    
    private func placeShip2(shipLength: Int) -> Bool{
        
        
        let randX = Int(arc4random_uniform(10)) // column
        let randY = Int(arc4random_uniform(10)) // row
        let orientation = Int(arc4random_uniform(2))
        
        var validPlace = true
        
        if (orientation == 0)  { // Horizontal
            var xPos = randX
            for length: Int in 0 ..< shipLength {
                
                if (xPos < 10 && _p2Grid[randY][xPos] == .none) {
                    validPlace = true
                }
                else {
                    validPlace = false
                    return validPlace
                }
                
                // If all positions were valid then place the ship
//                if (length == shipLength - 1 && validPlace) {
//                    setShip(grid: 2, ship: shipLength, randY: randY, randX: randX, orientation: orientation)
//                }
                
                xPos = xPos + 1
            }
            setShip(grid: 2, ship: shipLength, randY: randY, randX: randX, orientation: orientation)

        }
        else { // Vertical
            var yPos = randY
            for length: Int in 0 ..< shipLength {
                
                if (yPos < 10 && _p2Grid[yPos][randX] == .none) {
                    validPlace = true
                }
                else {
                    validPlace = false
                    return validPlace
                }
                
                // If all positions were valid then place the ship
//                if (length == shipLength - 1 && validPlace) {
//                    setShip(grid: 2, ship: shipLength, randY: randY, randX: randX, orientation: orientation)
//                }
                
                yPos = yPos + 1
            }
            setShip(grid: 2, ship: shipLength, randY: randY, randX: randX, orientation: orientation)
        }
        
        return validPlace
    }
    
    private func setShip(grid: Int, ship:Int, randY: Int, randX: Int, orientation: Int) {
        var xPos = 0
        var yPos = 0
        
        if (orientation == 0) {
            xPos = randX
        }
        else {
            yPos = randY
        }
        
        
        for length: Int in 0 ..< ship {
            if (orientation == 0) {
                if (grid == 1) {
                    _p1Grid[randY][xPos] = .ship
                }
                else {
                    _p2Grid[randY][xPos] = .ship
                }
                
                xPos = xPos + 1
            }
            else {
                
                if (grid == 1) {
                    _p1Grid[yPos][randX] = .ship
                }
                else {
                    _p2Grid[yPos][randX] = .ship
                }
                
                yPos = yPos + 1
            }
        }
    }
    
    
    
    
    // ENEMY ships
    private var _p1Grid: [[Ships]] = [[.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      ]
    
    
    // MY ships
    private var _p2Grid: [[Ships]] = [[.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                      ]
    
    public var currentPlayerIs1: Bool {
        return currentPlayer1
    }
    
    public var p1Grid: [[Ships]] {
        return _p1Grid
    }
    
    public var p2Grid: [[Ships]] {
        return _p2Grid
    }
    
    public func takeMove(row:Int, col: Int) {
        if (currentPlayer1) {
            if (_p2Grid[row][col] == .none) {
                _p2Grid[row][col] = .miss
                for delegate: GameModelDelegate in delegates {
                    delegate.showTouchedStatus(status: "Miss!")
                }
            }
            else if (_p2Grid[row][col] == .ship)
            {
                _p2Grid[row][col] = .hit
                for delegate: GameModelDelegate in delegates {
                    delegate.showTouchedStatus(status: "Hit!")
                }
            }
        }
        else {
            if (_p1Grid[row][col] == .none) {
                _p1Grid[row][col] = .miss
                for delegate: GameModelDelegate in delegates {
                    delegate.showTouchedStatus(status: "Miss!")
                }
            }
            else if (_p1Grid[row][col] == .ship)
            {
                _p1Grid[row][col] = .hit
                for delegate: GameModelDelegate in delegates {
                    delegate.showTouchedStatus(status: "Hit!")
                }
            }
        }
        currentPlayer1 = !currentPlayer1
    }
    
    public var delegates: [GameModelDelegate] = []
    
}
