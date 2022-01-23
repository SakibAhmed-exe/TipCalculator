//
//  ViewController.swift
//  Prework
//
//  Created by Sakib Ahmed on 1/20/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var billAmountTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        billAmountTextField.keyboardType = .numberPad
        billAmountTextField.becomeFirstResponder()
        let newTipOne = defaults.string(forKey: "tipOne")
        let newTipTwo = defaults.string(forKey: "tipTwo")
        let newTipThree = defaults.string(forKey: "tipThree")
        tipControl.setTitle(newTipOne, forSegmentAt: 0)
        tipControl.setTitle(newTipTwo, forSegmentAt: 1)
        tipControl.setTitle(newTipThree, forSegmentAt: 2)
        defaults.synchronize()
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billAmountTextField.keyboardType = .numberPad
        billAmountTextField.becomeFirstResponder()
        print("view did appear")
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipOnePer = defaults.double(forKey: "tipOneNum") / 100
        let tipTwoPer = defaults.double(forKey: "tipTwoNum") / 100
        let tipThreePer = defaults.double(forKey: "tipThreeNum") / 100
        
        //Get total tip
        let tipPercentages = [tipOnePer, tipTwoPer, tipThreePer]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update tip amount label with local currency and proper comma seperators
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: tip as NSNumber) {
            tipAmountLabel.text = "\(formattedTipAmount)"
        }
        
        //Update total amount label with local currency and proper comma seperators
        let formatter2 = NumberFormatter()
        formatter2.usesGroupingSeparator = true
        formatter2.numberStyle = .currency
        if let formattedTotalAmount = formatter.string(from: total as NSNumber) {
            totalLabel.text = "\(formattedTotalAmount)"
        }
    }
    

}

