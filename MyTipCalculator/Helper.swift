//
//  Helper.swift
//  MyTipCalculator
//
//  Created by James Man on 2/18/17.
//  Copyright © 2017 James Man. All rights reserved.
//

import Foundation
import UIKit

class Helper{
    static let DEFAULT_SEGMENT_INDEX_KEY = "default_segment_index"
    static let THEME_KEY = "theme"
    static let DARK_THEME_COLOR_HEX = 0xEBEBF1
    static let NON_DARK_THEME_COLOR_HEX = 0xffffff
    static let TIP_PERCENTILES = [0.1, 0.15, 0.2]
    static let CURRENT_BILL_KEY = "current_bill"
    static let CURRENT_TIME_KEY = "current_time"
    static let VIEW_ANIMATE_DURATION = 0.4
    static let BILL_RESTORE_INTERVAL = 10.0
    
    static  func UIColorFromHex(rgbValue:UInt, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    static func animateViewFadeIn(view:UIView) {
        view.alpha = 0
        UIView.animate(withDuration: self.VIEW_ANIMATE_DURATION, animations: {
            // This causes first view to fade in and second view to fade out
            view.alpha = 1
        })
    }
    
    static func setTheme(view:UIView, textField:UITextField? = nil, themeSwitch:UISwitch? = nil){
        let defaults = UserDefaults.standard
        let isDarkTheme = defaults.bool(forKey: Helper.THEME_KEY)
        var color:UIColor? = nil
        if(isDarkTheme){
            color = Helper.UIColorFromHex(rgbValue: UInt(Helper.DARK_THEME_COLOR_HEX))
            UITextField.appearance().keyboardAppearance = .dark
        }else{
            color = Helper.UIColorFromHex(rgbValue: UInt(Helper.NON_DARK_THEME_COLOR_HEX))
            UITextField.appearance().keyboardAppearance = .default
        }
        view.backgroundColor = color
        if ((textField) != nil) {
            textField?.backgroundColor = color
        }
        if ((themeSwitch) != nil) {
            themeSwitch?.isOn = isDarkTheme
        }
    }
}
