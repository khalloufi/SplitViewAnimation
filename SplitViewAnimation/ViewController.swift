//
//  ViewController.swift
//  SplitViewAnimation
//
//  Created by issam on 06/08/2018.
//  Copyright © 2018 ZetaLearning Inc. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var splitView: NSSplitView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func right(_ sender: Any) {
        Animation(splitView: splitView, dividerAtIndex: 0, from: self.view.frame.width, to: 0) {
            print("goood")
        }.start()
    }
    @IBAction func left(_ sender: Any) {
        Animation(splitView: splitView, dividerAtIndex: 0, from: 0, to: self.view.frame.width) {
            print("goood")
        }.start()
    }
    

}

