//
//  AppDelegate.swift
//  narru
//
//  Created by Hyeonwoo Park on 2020/05/03.
//  Copyright © 2020 narru. All rights reserved.
//

import Cocoa

struct AppItem {
    static var app: AppDelegate?
    static var statusBar: NSStatusItem?
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var myWindow: NSWindow? = nil
    private var fileIo = FileObjects()
    
    var statusBarItem: NSStatusItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        AppItem.app = self
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
        statusBarItem.button?.image = NSImage(named: NSImage.Name("cloud"))
        statusBarItem.button?.window?.registerForDraggedTypes([.fileURL])
        statusBarItem.button?.window?.delegate = self
        
        let statusBarMenu = NSMenu(title: "NARRU 메뉴")
        statusBarItem.menu = statusBarMenu
        
        statusBarMenu.addItem(
            withTitle: "설정",
            action: #selector(self.openSetting),
            keyEquivalent: "")
        
        statusBarMenu.addItem(
            withTitle: "종료",
            action: #selector(self.AppExit),
            keyEquivalent: "")
        
        AppItem.statusBar = statusBarItem
    }
    
    
    @objc func openSetting() {
        if self.myWindow == nil {
            if let mainvc = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "ViewController") as? ViewController {
                myWindow = NSWindow(contentViewController: mainvc)
                myWindow?.makeKeyAndOrderFront(self)
            }
        }
        let vc = NSWindowController(window: myWindow)
        vc.showWindow(self)
    }
    
    
    @objc func AppExit() {
        exit(0)
    }
}

extension AppDelegate: NSWindowDelegate, NSDraggingDestination {
    
    func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        return .copy
    }
    
    func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        // Collect URLs.
        var matchingFileURLs: [URL] = []
        sender.draggingPasteboard.readObjects(forClasses: [NSURL.self], options: nil)?.forEach
            {
                eachObject in
                if let eachURL = eachObject as? URL { matchingFileURLs.append(eachURL) }
        }
        
        // Only if any,
        guard matchingFileURLs.count > 0
            else { return false }
        
        if let url = matchingFileURLs.first {
            self.fileIo.upload(url: url)
        }
        
        print(matchingFileURLs)
        
        return true
    }
    
}
