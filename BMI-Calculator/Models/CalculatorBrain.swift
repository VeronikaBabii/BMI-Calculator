//
//  CalculatorBrain.swift
//  BMI-Calculator
//
//  Created by Veronika Babii on 14.08.2020.
//  Copyright © 2020 Veronika Babii. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    // when the app is loaded we don't have a bmi until the user calculates it, so it's optional
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        switch(bmiValue) {
        case ..<18.5:
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        case 18.5..<24.9:
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        case 24.9...:
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        default:
            print("Error")
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0) // return 0.0 if bmi is nil
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice yet" // optional chaining
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
