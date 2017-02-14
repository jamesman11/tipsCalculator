//
//  SettingViewController.swift
//  MyTipCalculator
//
//  Created by James Man on 2/13/17.
//  Copyright © 2017 James Man. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var defaultTipPercentile: UISegmentedControl!
     let DEFAULT_SEGMENT_INDEX_KEY = "default_segment_index"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: DEFAULT_SEGMENT_INDEX_KEY )
        defaultTipPercentile.selectedSegmentIndex = index
    }

    @IBAction func SetDefaultTipPercentile(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTipPercentile.selectedSegmentIndex,forKey:DEFAULT_SEGMENT_INDEX_KEY)
        defaults.synchronize()

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
