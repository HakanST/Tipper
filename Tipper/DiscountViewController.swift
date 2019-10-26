//
//  DiscountViewController.swift
//  Tipper
//
//  Created by Hakan Turgut on 9/22/19.
//  Copyright © 2019 Hakan Turgut. All rights reserved.
//

import UIKit

class DiscountViewController: UIViewController {
    
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var taxField: UITextField!
    @IBOutlet weak var discountLabel: UILabel!
    
    @IBOutlet weak var calculatedDiscountLabel: UILabel!
    @IBOutlet weak var DiscountedPriceLabel: UILabel!
    @IBOutlet weak var discountSlider: UISlider!
    
    var Price: Double = 0
    var Tax: Double = 0
    var Discount: Int = 0
    
    var calculatedDiscount: Double = 0
    var priceDiscounted: Double = 0
    var calculatedTax: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        discountLabel.text = "0%"
    }
    
    //Calculates the discount based on the price we enter, tax(optionally), and entered discount percentage.
    @IBAction func calculateDiscount(_ sender: Any) {
        
        Discount = Int(discountSlider.value)
        discountLabel.text = String(Discount) + "%"
        
        Price = Double(priceField.text!) ?? 0
        Tax = Double(taxField.text!) ?? 0
        
        calculatedDiscount = Price * Double(Discount) * (0.01)
        calculatedDiscountLabel.text = String(format: "$%.2f", calculatedDiscount)
        
        //If tax field is left blank, we move on without it.
        if Tax == 0{
            calculatedTax = 0
        }
        
        //Else, we calculate the tax amount.
        else {
            
            if calculatedDiscount != 0 {
                calculatedTax = calculatedDiscount * Tax * (0.01)
            }
            
            else {
                calculatedTax = Price * Tax * (0.01)
            }
            
        }
        
        priceDiscounted = (Price - calculatedDiscount) + calculatedTax //Calculates discounted price
        DiscountedPriceLabel.text = String(format: "$%.2f", priceDiscounted)
        
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
}
