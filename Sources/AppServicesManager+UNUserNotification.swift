//
//  AppServicesManager+UNUserNotification.swift
//  PluggableAppDelegate
//
//  Created by Svyatoshenko "Megal" Misha on 01/07/2019.
//  Copyright © 2019 Michael Pchelnikov. All rights reserved.
//

import UserNotifications

// MARK: - UNUserNotificationCenterDelegate
extension PluggableApplicationDelegate: UNUserNotificationCenterDelegate {

    @available(iOS 10.0, *)
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        for service in _services {
            service.userNotificationCenter?(center, willPresent: notification, withCompletionHandler: completionHandler)
        }
    }

    @available(iOS 10.0, *)
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        for service in _services {
            service.userNotificationCenter?(center, didReceive: response, withCompletionHandler: completionHandler)
        }
    }


    @available(iOS 12.0, *)
    public func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        for service in _services {
            service.userNotificationCenter?(center, openSettingsFor: notification)
        }
    }


}

