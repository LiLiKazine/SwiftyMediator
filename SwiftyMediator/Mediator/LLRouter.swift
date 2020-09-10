//
//  LLRouter.swift
//  SwiftyMediator
//
//  Created by yingkelei on 2020/9/9.
//  Copyright © 2020 lilikazine. All rights reserved.
//

import UIKit

@objc protocol LLRoutable {
    
    static var llIdentifier: String {get}
    
    static func create(with params: Dictionary<AnyHashable, Any>) -> AnyObject?
    
}

class LLRouter: NSObject {
    
    private override init() {super.init()}
    
    static let shared = LLRouter()
    
    private var regedit = [String: LLRoutable.Type]()
    
    func register(_ cls: LLRoutable.Type) {
        regedit[cls.llIdentifier] = cls
        print(cls.llIdentifier)
    }
    
    func listRouters() -> [String] {
        return regedit.keys.map{ $0 }
    }
    
    func create(by identifier: String, with param: Dictionary<AnyHashable, Any> = [:]) -> AnyObject? {
        var obj: AnyObject?;
        if let rawType = regedit[identifier] {
            if let instance = rawType.create(with: param) {
                obj = instance
            } else {
                print("Failed to create routable instance. file: %s, function: %s, line: %s", #file, #function, #line);
            }
        } else {
            print("Failed find registered metatype. file: %s, function: %s, line: %s", #file, #function, #line);
        }

        return obj
    }
    

}
