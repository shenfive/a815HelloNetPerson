//
//  ViewController.swift
//  a815HelloNetPerson
//
//  Created by 申潤五 on 2021/8/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model = APIModel.share
        
        model.queryRandomUserAlamofire { response, error in
            print(response as! String)
        }
       
        
  
    }


}

