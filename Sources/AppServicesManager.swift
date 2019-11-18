//
//  AppServicesManager.swift
//  PluggableAppDelegate
//
//  Created by Fernando Ortiz on 2/24/17.
//  Modified by Mikhail Pchelnikov on 31/07/2018.
//  Copyright © 2018 Michael Pchelnikov. All rights reserved.
//

import UIKit
import UserNotifications

/// This is only a tagging protocol.
/// It doesn't add more functionalities yet.
public protocol ApplicationService: UIApplicationDelegate, UNUserNotificationCenterDelegate {}

extension ApplicationService {
    public var window: UIWindow? {
        return UIApplication.shared.delegate?.window ?? nil
    }
}

open class PluggableApplicationDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?

    open var services: [ApplicationService] { return [] }

    lazy var _services: [ApplicationService] = {
        return self.services
    }()
    
    lazy var _methodRespondsCache: [String: Bool] = {
        print(NSDate())
        func generateProtocolMethods(_ protocol: Protocol, methodPrifix: String) -> [String] {
            var count: UInt32 = 0
            guard let list = protocol_copyMethodDescriptionList(`protocol`, false, true, &count) else { return [] }
            return (0..<count)
                .map({ list[Int($0)] })
                .compactMap({ $0.name })
                .map({ NSStringFromSelector($0) })
                .filter({ $0.hasPrefix(methodPrifix) })
        }
        var methods = generateProtocolMethods(UIApplicationDelegate.self, methodPrifix: "application")
        if #available(iOS 10.0, *) {
            methods.append(contentsOf: generateProtocolMethods(UNUserNotificationCenterDelegate.self, methodPrifix: "userNotificationCenter"))
        }
        let result = methods.reduce([String: Bool]()) { (res, selector) in
            var res = res
            res[selector] = _services.contains(where: { $0.responds(to: Selector.init(selector)) })
            return res
        }
        print(NSDate())
        return result
    }()

    @discardableResult
    internal func apply<T, S>(_ work: (ApplicationService, @escaping (T) -> Void) -> S?, completionHandler: @escaping ([T]) -> Void) -> [S] {
        let dispatchGroup = DispatchGroup()
        var results: [T] = []
        var returns: [S] = []

        for service in _services {
            dispatchGroup.enter()
            let returned = work(service, { result in
                results.append(result)
                dispatchGroup.leave()
            })
            if let returned = returned {
                returns.append(returned)
            } else { // delegate doesn't impliment method
                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: .main) {
            completionHandler(results)
        }

        return returns
    }
    
    override open func responds(to aSelector: Selector!) -> Bool {
        if let isHaveServicesResponds = _methodRespondsCache[NSStringFromSelector(aSelector)] {
            return isHaveServicesResponds
        } else {
            return super.responds(to: aSelector)
        }
    }
}
