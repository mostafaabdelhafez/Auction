//
//  CategoryModel.swift
//  Auction
//
//  Created by jobzella on 05/01/2023.
//

import Foundation
struct BaseModel<T:Codable>:Codable{
    var msg:String?
    var code:Int?
    var data:T?
}
struct CategoryChild:Codable{
    var id:Int?
    var name:String?
    var description:String?
    var slug:String?
    var children:[CategoryChild]?
}
struct CategoryData:Codable{
    var categories:[CategoryChild]?
}
struct Option:Codable{
    var id:Int?
    var name:String?
    var description:String?
    var slug:String?
    var parent:Int?
    var child:Bool?
}

struct SubCategory:Codable{
    var id:Int?
    var name:String?
    var description:String?
    var slug:String?
    var options:[Option]?
}
struct DropDownModel{
var name:String
var id:Int
}
