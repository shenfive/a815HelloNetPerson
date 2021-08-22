//
//  ViewController.swift
//  a815HelloNetPerson
//
//  Created by 申潤五 on 2021/8/15.
//

import UIKit
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var headImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateData()
    }
    
    func updateData(){
        APIModel.share.queryRandomUserAlamofire { response, error in
            if let data = response as? Data{
                let json = JSON(data)
                print(json)
                
                let name = json["results"][0]["name"]["first"].stringValue + " " + json["results"][0]["name"]["last"].stringValue
                let pic = json["results"][0]["picture"]["large"].stringValue
                
                self.headImageView.sd_setImage(with: URL(string: pic), completed: nil)
                print(name)
                print(pic)
            }
        }
    }
    
    
    @IBAction func updateButtonClick(_ sender: Any) {
        updateData()
    }
    
    
}

