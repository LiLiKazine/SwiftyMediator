//
//  TestClass2.swift
//  SwiftyMediator
//
//  Created by yingkelei on 2020/9/9.
//  Copyright © 2020 lilikazine. All rights reserved.
//

import UIKit

class TestClass2: NSObject, LLRoutable {
    
    static func create(with params: Dictionary<AnyHashable, Any>) -> AnyObject? {
        return TestClass2()
    }
    
    static var llIdentifier: String {
        return "Class2"
    }
    
    func test() {
        LLRouter.shared.create(by: <#T##String#>)
    }
    

}
