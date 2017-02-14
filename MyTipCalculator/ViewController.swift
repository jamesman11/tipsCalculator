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
    let TIP_PERCENTILES = [0.1, 0.15, 0.2]
    let DEFAULT_SEGMENT_INDEX_KEY = "default_segment_index"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: DEFAULT_SEGMENT_INDEX_KEY )
        tipPercentile.selectedSegmentIndex = index
        calculate()
    }

    @IBAction func handleBilInput(_ sender: AnyObject) {
        calculate()
    }
    
    func calculate() {
        let bill = Double(billTextField.text!) ?? 0
        let percent = TIP_PERCENTILES[tipPercentile.selectedSegmentIndex]
        let tip = bill * percent
        let total = bill * (1 + percent)
        tipLabel.text = String.init(format: "$%.2f", tip)
        totalLabel.text = String.init(format: "$%.2f", total)
    }

}

