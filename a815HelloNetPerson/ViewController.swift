//
//  ViewController.swift
//  a815HelloNetPerson
//
//  Created by 申潤五 on 2021/8/15.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model = APIModel.share
        
        model.queryRandomUserAlamofire { response, error in
            if let data = response as? Data{
                let json = JSON(data)
                print(json)
                
                let name = json["results"][0]["name"]["first"].stringValue + " " + json["results"][0]["name"]["last"].stringValue
                let pic = json["results"][0]["picture"]["large"].stringValue
                print(name)
                print(pic)
            }
        }
      }
}

