//
//  ViewController.swift
//  Push
//
//  Created by do duy hung on 20/08/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func action_push(sender: UIButton) {
        let Login = self.storyboard?.instantiateViewControllerWithIdentifier("V2") as! login
        self.navigationController?.pushViewController(Login, animated: true)
        
    }

}

