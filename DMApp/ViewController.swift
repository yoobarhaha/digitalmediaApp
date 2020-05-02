//
//  ViewController.swift
//  DMApp
//
//  Created by SWUCOMPUTER on 2020/04/26.
//  Copyright © 2020 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination=segue.destination
        let button=sender as! UIButton
        destination.title=button.titleLabel?.text
    }


}

