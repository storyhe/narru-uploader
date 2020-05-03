//
//  SharedRef.swift
//  narru
//
//  Created by Hyeonwoo Park on 2020/05/03.
//  Copyright © 2020 narru. All rights reserved.
//

import Cocoa

class SharedRef: NSObject {

    static let shared = SharedRef()
    
    var ud = UserDefaults.standard
    func set(key: String?) {
        self.ud.set(key, forKey: "key")
        self.ud.synchronize()
    }
    
    func get() -> String? {
        return self.ud.object(forKey: "key") as? String
    }
}
