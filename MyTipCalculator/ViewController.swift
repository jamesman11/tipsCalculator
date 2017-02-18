//
//  ViewController.swift
//  MyTipCalculator
//
//  Created by James Man on 2/13/17.
//  Copyright © 2017 James Man. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercentile: UISegmentedControl!
    @IBOutlet weak var billTextField: UITextField!
    
    let defaults = UserDefaults.standard
    let currencyFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLoadLastBill()
        billTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billTextField.becomeFirstResponder()
        Helper.animateViewFadeIn(view: self.view)
        setSegmentIndex()
        calculate()
        Helper.setTheme(view: self.view, textField: billTextField)
    }

    @IBAction func handleBilInput(_ sender: AnyObject) {
        calculate()
    }
    
    func checkLoadLastBill(){
        let time = defaults.object(forKey: Helper.CURRENT_TIME_KEY)
        let interval = Date().timeIntervalSince(time as! Date)
        if (interval / 60 < Helper.BILL_RESTORE_INTERVAL) {
            billTextField.text = defaults.string(forKey: Helper.CURRENT_BILL_KEY)
        }
    }
    
    func setSegmentIndex() {
        let index = defaults.integer(forKey: Helper.DEFAULT_SEGMENT_INDEX_KEY )
        tipPercentile.selectedSegmentIndex = index
    }
    
    func calculate() {
        let bill = Double(billTextField.text!) ?? 0
        let percent = Helper.TIP_PERCENTILES[tipPercentile.selectedSegmentIndex]
        let tip = bill * percent
        let total = bill * (1 + percent)
        tipLabel.text = String.init(format: "$%.2f", tip)
        totalLabel.text = String.init(format: "$%.2f", total)
        
        // use local currency
        currencyFormatter.locale = NSLocale.current
        currencyFormatter.numberStyle = .currency
        let tipText = tipLabel.text!.replacingOccurrences(of: "$", with: "")
        let totalText = totalLabel.text!.replacingOccurrences(of: "$", with: "")
        
        let tipValue: NSNumber = NSNumber(value:(Double)(tipText)!)
        let totalValue: NSNumber = NSNumber(value:(Double)(totalText)!)

        tipLabel.text = currencyFormatter.string(from: tipValue)
        totalLabel.text = currencyFormatter.string(from: totalValue)

        // set current state
        defaults.set(billTextField.text,forKey:Helper.CURRENT_BILL_KEY)
        defaults.set(Date(),forKey: Helper.CURRENT_TIME_KEY)
        defaults.synchronize()
    }
}

