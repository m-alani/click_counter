//
//  ViewController.swift
//  Click Counter
//
//  Created by Marwan Alani on 2017-02-22.
//  Copyright © 2017 Marwan Alani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    var label: UILabel!
    var decButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label
        self.label = UILabel()
        self.label.frame = CGRect(x: 150, y: 150, width: 100, height: 60)
        self.label.text = "0"
        self.view.addSubview(label)
        
        // Inc Button
        let incButton = UIButton()
        incButton.frame = CGRect(x: 150, y: 250, width: 100, height: 60)
        incButton.setTitle("Increment", for: .normal)
        incButton.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(incButton)
        
        incButton.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControlEvents.touchUpInside)
        
        // Dec Button
        self.decButton = UIButton()
        self.decButton.frame = CGRect(x: 150, y: 350, width: 100, height: 60)
        self.decButton.setTitle("Decrement", for: .normal)
        self.decButton.setTitleColor(UIColor.blue, for: .normal)
        self.decButton.setTitleColor(UIColor.gray, for: .disabled)
        self.view.addSubview(self.decButton)
        
        self.decButton.addTarget(self, action: #selector(ViewController.decrementCount), for: UIControlEvents.touchUpInside)
        
        self.checkCount()
    }

    // Helper function to control whether the Decrement Button is enabled or not
    func checkCount() {
        if (self.count < 1) {
            self.decButton.isEnabled = false
        } else {
            self.decButton.isEnabled = true
        }
    }
    
    // Helper function to increase the count by 1 and reflect the change on the label
    func incrementCount() {
        self.count += 1
        self.label?.text = "\(self.count)"
        checkCount()
    }
    
    // Helper function to decrease the count by 1 and reflect the change on the label
    func decrementCount() {
        self.count -= 1
        self.label?.text = "\(self.count)"
        checkCount()
    }
}

