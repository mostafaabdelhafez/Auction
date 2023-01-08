//
//  ApiServices.swift
//  Auction
//
//  Created by jobzella on 06/01/2023.
//

import Foundation
import Moya
class ApiService{
    func getCategories(completion:@escaping (_ model:[CategoryChild]?,_ message:String?,_ error:Error?)->Void){
        MoyaProvider<Requests>().request(.categories) { (result) in
            switch result{
            case .success(let response):

                do{
                    
                    let data = try response.map(BaseModel<CategoryData>.self)
                    completion(data.data?.categories,"success",nil)
                }
                catch{
                    break
                }
                
            case .failure(let error):
                let moyaError: MoyaError? = error
                let response : Response? = moyaError?.response

                if let data = response?.data {
                    let json = String(data: data, encoding: String.Encoding.utf8)
                    print("Failure Response: \(String(describing: json))")
                    
                }
            }
        }
    }
    func getProperties(with id:Int,completion:@escaping (_ model:[SubCategory]?,_ message:String?,_ error:Error?)->Void){
        MoyaProvider<Requests>().request(.subCategories(id: id)) { (result) in
            switch result{
            case .success(let response):

                do{
                    
                    let data = try response.map(BaseModel<[SubCategory]>.self)
                    completion(data.data,"success",nil)
                }
                catch{
                    break
                }
                
            case .failure(let error):
                let moyaError: MoyaError? = error
                let response : Response? = moyaError?.response

                if let data = response?.data {
                    let json = String(data: data, encoding: String.Encoding.utf8)
                    print("Failure Response: \(String(describing: json))")
                    
                }
            }
        }
    }
    func getPropertyChild(with id:Int,completion:@escaping (_ model:[SubCategory]?,_ message:String?,_ error:Error?)->Void){
        MoyaProvider<Requests>().request(.optionChild(id: id)) { (result) in
            switch result{
            case .success(let response):

                do{
                    
                    let data = try response.map(BaseModel<[SubCategory]>.self)
                    completion(data.data,"success",nil)
                }
                catch{
                    break
                }
                
            case .failure(let error):
                let moyaError: MoyaError? = error
                let response : Response? = moyaError?.response

                if let data = response?.data {
                    let json = String(data: data, encoding: String.Encoding.utf8)
                    print("Failure Response: \(String(describing: json))")
                    
                }
            }
        }
    }

}
