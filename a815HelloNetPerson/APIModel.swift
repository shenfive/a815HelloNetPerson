//
//  APIModel.swift
//  a815HelloNetPerson
//
//  Created by 申潤五 on 2021/8/15.
//

import UIKit
import Alamofire

class APIModel {
    static var share = APIModel()
    private var apiURL = "https://randomuser.me/api/"
    private  init(){
        
    }

    func queryRandomUserAlamofire(completion:@escaping (_ Data:Any?,_ respError: Error?)->())->(){
        completion("response.data",nil)

    }
    
}
