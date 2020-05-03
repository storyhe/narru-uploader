//
//  ViewController.swift
//  narru
//
//  Created by Hyeonwoo Park on 2020/05/03.
//  Copyright © 2020 narru. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var keyField: NSTextFieldCell!
    @IBOutlet weak var statusLabel: NSTextFieldCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "설정"
        self.statusLabel.title = "저장을 꼭 눌러주세요."
        
        self.keyField.title = SharedRef.shared.get() ?? ""
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func save(_ sender: NSButton) {
        SharedRef.shared.set(key: self.keyField.title)
        self.statusLabel.title = "저장되었습니다."
    }


}

