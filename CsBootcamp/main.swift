//
//  main.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 29/03/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import Foundation
import UIKit

class UnitTestAppDelegate: NSObject, UIApplicationDelegate { }

let isTesting = NSClassFromString("XCTestCase") != nil

let argc = CommandLine.argc
let argv = UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))

#if TEST

UIApplicationMain(argc, argv, nil, NSStringFromClass(UnitTestAppDelegate.self))
#else
    
UIApplicationMain(argc, argv, nil, NSStringFromClass(AppDelegate.self))
#endif
