//
//  ViewController.swift
//  Stars
//
//  Created by Seschwan on 5/8/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField:       UITextField!
    @IBOutlet weak var distanceTextField:   UITextField!
    @IBOutlet weak var textView:            UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listStars()
         
    }

    let starController = StarController()
    
    @IBAction func addStarBtnPressed(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let distanceString = distanceTextField.text,
            let distance = Double(distanceString) else {
                return
                
        }
        starController.addStar(named: name, withDistance: distance)
        listStars()
        clearTextFields()
    }
    
    private func clearTextFields() {
        nameTextField.text = nil
        distanceTextField.text = nil
    }
    
    func listStars() {
        var output = ""
        
        for star in starController.stars {
            output += "\(star.name) is \(star.distance) light years away. \n"
        }
        textView.text = output
    }
    
}

