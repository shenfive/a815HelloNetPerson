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
    private var apiURL = "https://randomuser.me"
    private  init(){
        
    }

    func queryRandomUserAlamofire(completion:@escaping (_ Data:Any?,_ respError: Error?)->())->(){
        
        let url = self.apiURL + "/api/"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.httpBody,
                   headers: nil).responseJSON { response in
                    switch response.result{
                    case .success(_):
                        completion(response.data,nil)
                    case  .failure(let error):
                        completion(nil,error)
                    }
                   }
        
        
        
    }
    
}
