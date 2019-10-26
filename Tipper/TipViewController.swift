//
//  ViewController.swift
//  Tipper
//
//  Created by Hakan Turgut on 9/10/19.
//  Copyright © 2019 Hakan Turgut. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    @IBOutlet weak var subtotalField: UITextField!
    
    @IBOutlet weak var customTipField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
  
    @IBOutlet weak var totalPeopleLabel: UILabel!
    
    @IBOutlet weak var splitTipLabel: UILabel!
    
    @IBOutlet weak var splitTotalLabel: UILabel!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var percentageLabel: UILabel!
    
    
    var tip: Double = 0
    var subtotal: Double = 0
    var total: Double = 0
    var totalPeople: Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        customTipField.isHidden = true //customTipField stays hidden until user taps button
        percentageLabel.isHidden = true
        totalPeopleLabel.text = "1"
        
        //        backgroundImage.alpha = 0
        //        subtotalField.becomeFirstResponder()
        
    }

    //Hides keyboard
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBOutlet weak var tipControl: UISegmentedControl! //Default values for tip percentages
    
    //Calculates tip for default percentage and custom amounts.
    @IBAction func calculateTip(_ sender: Any) {

        subtotal = Double(subtotalField.text!) ?? 0
        
        let tipPercentages = [0.1, 0.15, 0.20]
        
        //If user hits Custom Tip Button, the textfield to enter the custom amount will appear.
        if tipControl.selectedSegmentIndex == 3{
            
            customTipField.isHidden = false
            percentageLabel.isHidden = false
            
            let customTip = Double(customTipField.text!) ?? 0
            tip = subtotal * customTip / 100 //Calculates tip based on entered percentage.
            
//            return
        }
            
        //Else the selected default tip tip percentage will be computed
        else{
            customTipField.isHidden = true
            percentageLabel.isHidden = true
            tip = subtotal * tipPercentages[tipControl.selectedSegmentIndex] //Uses the selected default percentage
        }

        total = subtotal + tip //Computes the sum of the pretip value + tip value
        
        //Outputs
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        //If number of people are specified, the split values will be computed and displayed.
        if totalPeople > 0{
            splitTipLabel.text = String(format: "$%.2f", tip/Double(totalPeople))
            splitTotalLabel.text = String(format: "$%.2f", total/Double(totalPeople))
        }
    }
    
    //Calculates split tip depending on the amount of people.
    @IBAction func calculateSplit(_ sender: UIStepper) {
        totalPeople = Int(sender.value)
        totalPeopleLabel.text = String(totalPeople)
        splitTipLabel.text = String(format: "$%.2f", tip/Double(totalPeople))
        splitTotalLabel.text = String(format: "$%.2f", total/Double(totalPeople))
    }
    
    //-----------Previous Code------------
    
    //    //Custom Tip Calculation
    //    @IBAction func calculateCustomTip(_ sender: Any) {
    //
    //        //
    //        if customTipField.isHidden == false{
    //
    //            //Inputs
    //            subtotal = Double(subtotalField.text!) ?? 0
    //            let customTip = Double(customTipField.text!) ?? 0
    //
    //            tip = subtotal * customTip / 100 //Calculates tip based on entered percentage.
    //            total = subtotal + tip //Computes the sum of the pretip value + tip value
    //
    //            //Outputs
    //            tipLabel.text = String(format: "$%.2f", tip)
    //            totalLabel.text = String(format: "$%.2f", total)
    //
    //            //If number of people are specified, the split values will be computed and displayed.
    //            if totalPeople > 0{
    //                splitTipLabel.text = String(format: "$%.2f", tip/Double(totalPeople))
    //                splitTotalLabel.text = String(format: "$%.2f", total/Double(totalPeople))
    //            }
    //        }
    //
    //        else {
    //            return
    //        }
    //
    //    }
    
}

