//
//  ViewController.swift
//  YN
//
//  Created by Viktor Pechersky on 29.08.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//



import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    fileprivate var abc: [JSONId] = []

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateData (){
        APIService.sharedInstance.getAPI (comletion: { [weak self] result in
            
            if let _result = result as? [JSONId] {
                self?.abc = _result
                print("   ***  abc  ***   ", self?.abc)
            } else {
                self?.abc = []
            }
        })
    }
    


}

