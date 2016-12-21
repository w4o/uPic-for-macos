//
//  SettingViewController.swift
//  uPic
//
//  Created by Frank on 2016/12/21.
//  Copyright © 2016年 defcoding. All rights reserved.
//


import Cocoa

class SettingViewController: NSViewController {

    @IBOutlet var accessKeyInput: NSTextField!
    @IBOutlet var secretKeyInput: NSTextField!
    @IBOutlet var bucketInput: NSTextField!
    @IBOutlet var domainInput: NSTextField!
    @IBOutlet var styleInput: NSTextField!
    @IBOutlet var styleChk: NSButton!
    
    var userDefaults: UserDefaults!
    var settingMeta: [String: NSTextField]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        settingMeta = [
            "accessKey": accessKeyInput,
            "secretKey": secretKeyInput,
            "bucket": bucketInput,
            "domain": domainInput,
            "style": styleInput
        ]
        userDefaults = NSUserDefaultsController.shared().defaults
        displaySettings()
        
    }
    
    func styleChkState(){
        if styleChk.state == 0 {
            styleInput.isEnabled = false
        } else {
            styleInput.isEnabled = true
        }
    }

    func displaySettings() {
        for (key, input) in settingMeta {
            if let value = userDefaults.string(forKey: key) {
                input.stringValue = value
            }
        }
        
        styleChk.state = userDefaults.integer(forKey: "isStyle")
        
        styleChkState()
    }
    
    @IBAction func styleChkAction(_ sender: NSButton) {
        styleChkState();
    }

    @IBAction func confirmAction(_ sender: NSButton) {
        for (key, input) in settingMeta {
            let setting = input.stringValue
            userDefaults.set(setting, forKey: key)
        }
        
        userDefaults.set(styleChk.state, forKey: "isStyle")

        userDefaults.synchronize()
        self.view.window?.close()
    }
    
    

    @IBAction func cancelAction(_ sender: NSButton) {
        self.view.window?.close()
    }
}
