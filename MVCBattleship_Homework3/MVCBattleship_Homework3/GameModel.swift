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
    func showPlayerWon(player: String)
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
                //NSLog("Ship \(currentShip) placed")
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
                //NSLog("P2 Ship \(currentShip) placed")
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
    
    private var p1ShipCoords: [(row: Int, col:Int)] = []
    private var p2ShipCoords: [(row: Int, col:Int)] = []
    
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
                    p1ShipCoords.append((row: randY, col: xPos))
                }
                else {
                    _p2Grid[randY][xPos] = .ship
                    p2ShipCoords.append((row: randY, col: xPos))
                }
                
                xPos = xPos + 1
            }
            else {
                
                if (grid == 1) {
                    _p1Grid[yPos][randX] = .ship
                    p1ShipCoords.append((row: yPos, col: randX))
                }
                else {
                    _p2Grid[yPos][randX] = .ship
                    p2ShipCoords.append((row: yPos, col: randX))
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
    
    public var dictionaryRepresentation: NSDictionary {
        return ["Grid":"TestingData"]
    }
    
    public init(dictionary: NSDictionary) {
        // load games
        let tokenStrings: NSArray = dictionary.object(forKey: "Board") as! NSArray
        _p1Grid[0][0] = tokenFromString(tokenStrings.object(at: 0) as! String)
    }
    
    private func stringFromToken(_ token: Ships) -> String {
        switch (token) {
        case .none : return "none"
        case .miss : return "miss"
        case .hit : return "hit"
        case .ship : return "ship"
        }
    }
    
    private func tokenFromString(_ tokenString: String) -> Ships {
        switch (tokenString) {
        case "none" : return .none
        case "miss" : return .miss
        case "hit" : return .hit
        case "ship" : return .ship
        default : return .none
        }
    }
    
    
    /// Return 1 if p1 wins, 
    /// 2 if p2 wins
    public func checkForWinner() {
        var p1count = 0
        for coord: (row: Int, col: Int) in p1ShipCoords {
            if _p1Grid[coord.row][coord.col] == .hit {
                p1count = p1count + 1
            }
        }
        
        if p1count == 2 {
            for delegate: GameModelDelegate in delegates {
                delegate.showPlayerWon(player: "Player 1 Won!")
            }
        }
        
        var p2count = 0
        for coord: (row: Int, col: Int) in p2ShipCoords {
            if _p2Grid[coord.row][coord.col] == .hit {
                p2count = p2count + 1
            }
        }
        
        if p2count == 2 {
            for delegate: GameModelDelegate in delegates {
                delegate.showPlayerWon(player: "Player 2 Won!")
            }
        }
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
        checkForWinner()
    }
    
    public var delegates: [GameModelDelegate] = []
    
}
