//
//  ViewController.swift
//  Tipper
//
//  Created by Hakan Turgut on 9/10/19.
//  Copyright © 2019 Hakan Turgut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var subtotalField: UITextField!
    
    @IBOutlet weak var customTipField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
  
    @IBOutlet weak var totalPeopleLabel: UILabel!
    
    @IBOutlet weak var splitTipLabel: UILabel!
    
    @IBOutlet weak var splitTotalLabel: UILabel!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var tip: Double = 0
    var subtotal: Double = 0
    var total: Double = 0
    var totalPeople: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        backgroundImage.alpha = 0
        subtotalField.becomeFirstResponder()
        customTipField.isHidden = true
        totalPeopleLabel.text = "1"
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBAction func calculateTip(_ sender: Any) {
        
//        let tip: Double
        
        subtotal = Double(subtotalField.text!) ?? 0
        
        let tipPercentages = [0.1, 0.15, 0.20]
        
        //If user hits Custom Tip Button, the textfield to enter the custom amount will appear
        if tipControl.selectedSegmentIndex == 3{
            
            customTipField.isHidden = false
            return
        }
            
        //Else the default tip values will be computed
        else{
            customTipField.isHidden = true
            tip = subtotal * tipPercentages[tipControl.selectedSegmentIndex]
        }

        total = subtotal + tip
        
        //Outputs
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        if totalPeople > 0{
            
            splitTipLabel.text = String(format: "$%.2f", tip/Double(totalPeople))
            splitTotalLabel.text = String(format: "$%.2f", total/Double(totalPeople))
        }
    }
    
    //Custom Tip Calculation
    @IBAction func calculateCustomTip(_ sender: Any) {
        
        if customTipField.isHidden == false{
            
            //Inputs
            subtotal = Double(subtotalField.text!) ?? 0
            let customTip = Double(customTipField.text!) ?? 0
        
            tip = subtotal * customTip / 100
            total = subtotal + tip
            
            //Outputs
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            
            if totalPeople > 0{
                
                splitTipLabel.text = String(format: "$%.2f", tip/Double(totalPeople))
                splitTotalLabel.text = String(format: "$%.2f", total/Double(totalPeople))
            }
        }
        
        else {
            return
        }
        
        
    }
    

    @IBAction func calculateSplit(_ sender: UIStepper) {
        totalPeople = Int(sender.value)
        totalPeopleLabel.text = String(totalPeople)
        splitTipLabel.text = String(format: "$%.2f", tip/Double(totalPeople))
        splitTotalLabel.text = String(format: "$%.2f", total/Double(totalPeople))
    }
    
    
    
    
}

