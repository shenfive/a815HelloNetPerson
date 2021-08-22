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
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var headViewContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateData()
        
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.stopAnimating()
  
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        headImageView.clipsToBounds = true
        headImageView.layer.cornerRadius = headImageView.frame.height / 2
        headImageView.layer.borderWidth = 1.5
        headImageView.layer.borderColor = UIColor.gray.cgColor
        
        headViewContainer.backgroundColor = UIColor.white
        headViewContainer.layer.cornerRadius = headViewContainer.frame.height / 2
        
        
    }
    
    
    
    func updateData(){
        loadingIndicator.startAnimating()
        self.nameLabel.text = ""
        self.emailLabel.text = ""
        self.headImageView.image = nil
        
        APIModel.share.queryRandomUserAlamofire { response, error in
            if let data = response as? Data{
                let json = JSON(data)
                print(json)
                
                let name = json["results"][0]["name"]["first"].stringValue + " " + json["results"][0]["name"]["last"].stringValue
                let pic = json["results"][0]["picture"]["large"].stringValue
                let email = json["results"][0]["email"].stringValue

                self.headImageView.sd_setImage(with:  URL(string: pic), completed: { imageView, error, type, url in
                    DispatchQueue.main.async {
                        self.loadingIndicator.stopAnimating()
                    }
                })
                
                print(name)
                print(pic)
                
                DispatchQueue.main.async {
                    self.nameLabel.text = name
                    self.emailLabel.text = email
                }
                
                
                
            }
        }
    }

    @IBAction func updateButtonClick(_ sender: Any) {
        updateData()
    }
    
    
}

