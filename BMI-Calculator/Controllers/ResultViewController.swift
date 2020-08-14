//
//  ResultViewController.swift
//  BMI-Calculator
//
//  Created by Veronika Babii on 14.08.2020.
//  Copyright © 2020 Veronika Babii. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var BMIValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BMILabel.text = BMIValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil) // hide the current ResultVC
    }
}
