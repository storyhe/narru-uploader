//
//  FileObjects.swift
//  narru
//
//  Created by Hyeonwoo Park on 2020/05/03.
//  Copyright © 2020 narru. All rights reserved.
//

import Cocoa
import Alamofire
import AVFoundation

class FileObjects: NSObject {
    
    private var SERVER_URL = ""
    
    func upload(url: URL) {
        guard let uploadUrl = URL(string: SERVER_URL) else { return }
        guard let token = SharedRef.shared.get() else { return }
        
        #if DEBUG
        print("do upload")
        print("url: \(url)")
        print("urlpath: \(url.path)")
        print("to: \(SERVER_URL)")
        #endif
        
      
    }
    
    func playBell() {
        NSSound(named: "bell")?.play()
        
    }
}
