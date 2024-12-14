//
//  ViewController.swift
//  GDateKitExample
//
//  Created by teda on 2024/12/12.
//

import UIKit
import GDateKit

class ViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateLabel.text = Date().string(format: "hhMMdd")
    }
}
