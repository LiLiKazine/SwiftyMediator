//
//  LLRouterInjection.swift
//  SwiftyMediator
//
//  Created by yingkelei on 2020/9/9.
//  Copyright © 2020 lilikazine. All rights reserved.
//

import UIKit


class LLRouterInjection: NSObject {
    
    func register() {
                
        let allClasses: [LLRoutable.Type] = listAllClassConforming(LLRoutable.self)

        for cls in allClasses {
            LLRouter.shared.register(cls)
        }
        
    }
    
    func listAllClassConforming<T>(_ p: Protocol) -> [T] {

        let expectedCount = objc_getClassList(nil, 0)
        let allClasses = UnsafeMutablePointer<AnyClass>.allocate(capacity: Int(expectedCount));
        let autoreleasingAllClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(allClasses);
        let actualCount = Int(objc_getClassList(autoreleasingAllClasses, expectedCount));

        var classes = [T]()
        for i in 0..<actualCount {
            let raw: AnyClass = allClasses[i]
            if class_conformsToProtocol(raw, p),
                let cls = raw as? T {
                classes.append(cls);
            }
        }
        
        allClasses.deallocate()
        
        return classes;
    }

}

