//
//  PaletteViewControler.swift
//  Paletteer
//
//  Created by u0939404 on 2/13/17.
//  Copyright © 2017 McKay Fenn. All rights reserved.
//

import UIKit

class PaletteViewController: UIViewController, UITableViewDataSource {
    // MARK: UIViewController Override Methods
    override func loadView() {
        // TODO: set view property
        let colorTableView: UITableView = UITableView()
        view = colorTableView
    }
    
    override func viewDidLoad() {
        title = "Palette colors"
        // TODO: Customize veiw (and subviews)
        // NOTE: view does NOT have a frame yet!!!!!!!
        //colorTableView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight] // bitwise or
        contentView.dataSource = self
        }
    
   
    
    
    // MARK: - UITableViewDataSource Methods
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 100
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = "Hello from cell \(indexPath.row)"
        cell.backgroundColor = colorForIndex(indexPath.row)
        
        //cell.contentView.addSubview(someView)
        
        return cell
    }
    
    private func colorForIndex(_ index: Int) -> UIColor
    {
        return UIColor(hue: CGFloat(Double(index) / 100.0), saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }

    
    // MARK: - PaletteViewController Methods
     private var contentView: UITableView! { return view as! UITableView }
    
//    override func viewWillAppear(_ animated: Bool) {
//        // TODO: what should happen when this view controller's view appears?
//    }
    
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        
//    }
    
}

