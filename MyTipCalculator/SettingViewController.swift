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
    @IBOutlet weak var themeSwitch:UISwitch!
    
    let defaults = UserDefaults.standard
    var isDarkTheme = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Helper.animateViewFadeIn(view: self.view)
        setSegmentIndex()
        Helper.setTheme(view: self.view, themeSwitch: themeSwitch)
    }

    @IBAction func SetDefaultTipPercentile(_ sender: AnyObject) {
        defaults.set(defaultTipPercentile.selectedSegmentIndex,forKey:Helper.DEFAULT_SEGMENT_INDEX_KEY)
        defaults.synchronize()

    }
    @IBAction func changeThemeHandler(_ sender: AnyObject) {
        let isDarkTheme = themeSwitch.isOn
        defaults.set(isDarkTheme,forKey:Helper.THEME_KEY)
        defaults.synchronize()
        Helper.setTheme(view: self.view, themeSwitch: themeSwitch)
    }
    
    func setSegmentIndex() {
        let index = defaults.integer(forKey: Helper.DEFAULT_SEGMENT_INDEX_KEY )
        defaultTipPercentile.selectedSegmentIndex = index
    }
}
