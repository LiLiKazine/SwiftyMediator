//
//  TestClass1.swift
//  SwiftyMediator
//
//  Created by yingkelei on 2020/9/9.
//  Copyright © 2020 lilikazine. All rights reserved.
//

import UIKit

class TestClass1: NSObject, LLRoutable {
    
    static func create(with params: Dictionary<AnyHashable, Any>) -> AnyObject? {
        return TestClass1()
    }
    
    static var llIdentifier: String {
        return "Class1"
    }
    

}
