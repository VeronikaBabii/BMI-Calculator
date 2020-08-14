//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by Veronika Babii on 14.08.2020.
//  Copyright © 2020 Veronika Babii. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func heightValueChanged(_ sender: UISlider) {
        let hRoundedValue = round(sender.value * 100) / 100
        heightLabel.text = "\(hRoundedValue)m"
    }
    
    @IBAction func weightValueChanged(_ sender: UISlider) {
        let wIntValue = Int(sender.value)
        weightLabel.text = "\(wIntValue)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    // triggered after the performSegue() method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            // destVC is of type UIViewController, so it doesn't have a bmiValue,
            // only ResultVC type has the bmiValue, so to get it, we cast destVC as a ResultVC
            let destionationVC = segue.destination as! ResultViewController
            destionationVC.BMIValue = calculatorBrain.getBMIValue()
            destionationVC.advice = calculatorBrain.getAdvice()
            destionationVC.color = calculatorBrain.getColor()
        }
    }
}
