//
//  ViewController.swift
//  YN
//
//  Created by Viktor Pechersky on 29.08.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var items: [JSONItems] = [] {
        didSet {
            print("ITEMS: ", items)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateData()
    }

    private func updateData() {
        APIService.sharedInstance.getAPI(completion: { [weak self] result in
            
            if let _result = result as? JSONResponse {
                self?.items = _result.items
            } else {
                self?.items = []
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
