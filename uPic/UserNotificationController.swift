//
//  UserNotificationController.swift
//  uPic
//
//  Created by Frank on 2016/12/21.
//  Copyright © 2016年 defcoding. All rights reserved.
//

import Cocoa

class UserNotificationController: NSObject , NSUserNotificationCenterDelegate {
    
    static let shared = UserNotificationController()
    
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, didActivate notification: NSUserNotification) {
        // Open URL if present in the informativeText field of a notification
        if let text = notification.informativeText, let url = URL(string: text) {
            NSWorkspace.shared().open(url)
        }
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        
        return true
    }
    
    func displayNotification(withTitle title: String, informativeText: String) {
        let notification = NSUserNotification()
        notification.title = title
        notification.informativeText = informativeText
        notification.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.default.deliver(notification)
    }

    
}
