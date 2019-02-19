//
//  Model.swift
//  TipCalculator
//
//  Created by Joshua Okoro on 2/19/19.
//  Copyright © 2019 Joshua Okoro. All rights reserved.
//

import Foundation

struct Model {
    
    var subTotalText = "0.00"
    var tipSliderFromSlider = 15
    
    var subTotalAmount: Double {
        get {
            return Double(subTotalText) ?? 0.00
        }
    }
    
    var tipPercent: Double {
        return Double(tipSliderFromSlider)/100
    }
    
    var tipAmount: Double {
        return subTotalAmount * tipPercent
    }
    
    
    // MARK: - Total Amount
    var totalAmount: Double {
        return subTotalAmount + tipAmount
    }
    
    // MARK: - Convert To Currency
    let formatter = NumberFormatter()
    
    var subtotalAsCurrency: String {
        get {
            formatter.numberStyle = .currency
            return formatter.string(from: subTotalAmount as NSNumber)!
        }
    }
    
    var tipAmountAsCurrency: String {
        get {
            formatter.numberStyle = .currency
            return formatter.string(from: tipAmount as NSNumber)!
        }
    }
    
    var totalAmountAsCurrency: String {
        get {
            formatter.numberStyle = .currency
            return formatter.string(from: totalAmount as NSNumber)!
        }
    }
    
}
