//
//  ViewController.swift
//  TipCalculator
//
//  Created by RS Software on 10/29/15.
//  Copyright © 2015 RS Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)

    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!

    
    @IBAction func calculateTapped(sender : AnyObject) {
        tipCalc.total = Double((totalTextField.text! as NSString).doubleValue)
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        for (key, value) in possibleTips {
            results += "\(key)%: \(value)\n"
        }
        
        resultsTextView.text = results
        
    }
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value)/100.0
        refreshUI()
        
    }
    @IBAction func viewTapped(sender : AnyObject) {
        totalTextField.resignFirstResponder()
        
    }
    func refreshUI() {
        totalTextField.text = String(format: "%0.2f",tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax percentage (\(Int(taxPctSlider.value))%)"
        resultsTextView.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

