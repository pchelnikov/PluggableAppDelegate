# PluggableAppDelegate

[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/pchelnikov/PluggableAppDelegate/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/PluggableAppDelegate.svg?style=flat)](https://github.com/pchelnikov/PluggableAppDelegate)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/PluggableAppDelegate.svg)](https://cocoapods.org/pods/PluggableAppDelegate)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

[![Twitter](https://img.shields.io/badge/Twitter-@pchelnikov-blue.svg?style=flat)](http://twitter.com/pchelnikov)

A lightweight service-oriented ApplicationDelegate for iOS, made in Swift. Based on the Fernando Martín Ortiz's [idea](https://github.com/fmo91/PluggableApplicationDelegate) (**his repo not supported now**).

`AppDelegate` is a traditional example of bad code. Lots of lines of code that makes so much different things are put together in methods that are called within the application life cycle. But all of those concerns are over.

Using `PluggableAppDelegate` you separate `AppDelegate` from the services that you can plug to it. Each `ApplicationService` has its own life cycle that is shared with `AppDelegate`.

## Requirements

- iOS 9.0+
- Xcode 10.2+
- Swift 5.0

## Usage

Here is how a `ApplicationService` is like:

```swift
import Foundation

import PluggableAppDelegate

final class LoggerApplicationService: NSObject, ApplicationService {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("🎉 LoggerApplicationService has started!")
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("🙀 LoggerApplicationService has entered background")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("😻 LoggerApplicationService has entered foreground")
    }
}
```

That's all. **It is exactly the same as a AppDelegate**. Think of `ApplicationService` as sub-AppDelegates.

In `AppDelegate` you just have to inherit from PluggableApplicationDelegate to register the services.

```swift
import UIKit

import PluggableAppDelegate

@UIApplicationMain
class AppDelegate: PluggableApplicationDelegate {

    override var services: [ApplicationService] {
        return [
            RootVCApplicationService(),
            LoggerApplicationService()
        ]
    }
}
```

## Installation

### CocoaPods

You can use [CocoaPods](http://cocoapods.org/?q=MarkerKit).

```bash
platform :ios, '9.0'
use_frameworks!

target 'MyApp' do
  pod 'PluggableAppDelegate'
end
```

#### Carthage 
You can use [Carthage](https://github.com/Carthage/Carthage).
Specify in Cartfile:

```bash
github "pchelnikov/PluggableAppDelegate"
```

Run `carthage` to build the framework and drag the built MarkerKit.framework into your Xcode project. Follow [build instructions](https://github.com/Carthage/Carthage#getting-started).

## Contribution

- If you found a bug, [open an issue](https://github.com/pchelnikov/PluggableAppDelegate/issues)
- If you have a feature request, [create pull request](https://github.com/pchelnikov/PluggableAppDelegate/pulls)

## Author

Michael Pchelnikov

You can follow me on Twitter at [@pchelnikov](http://twitter.com/pchelnikov)

## Credits

[Fernando Martín Ortiz](https://github.com/fmo91)

## License

PluggableAppDelegate is available under the MIT license. See the LICENSE file for more info.
