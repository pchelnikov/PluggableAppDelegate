//
//  AppServicesManager+ExtensionTypes.swift
//  PluggableAppDelegate
//
//  Created by Mikhail Pchelnikov on 31/07/2018.
//  Copyright © 2018 Michael Pchelnikov. All rights reserved.
//

import UIKit

extension PluggableApplicationDelegate {

    // Applications may reject specific types of extensions based on the extension point identifier.
    // Constants representing common extension point identifiers are provided further down.
    // If unimplemented, the default behavior is to allow the extension point identifier.
    @available(iOS 8.0, *)
    open func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        var result = false
        for service in _services {
            if service.application?(application, shouldAllowExtensionPointIdentifier: extensionPointIdentifier) ?? true {
                result = true
            }
        }
        return result
    }
}
