//
//  ViewModel.swift
//  Auction
//
//  Created by jobzella on 06/01/2023.
//

import Foundation
import RxSwift
class ViewModel{
    var apiService:ApiService!
    var categoriesSubject = PublishSubject<[CategoryChild]>()
    var propertiesSubject = PublishSubject<Dictionary<String,[SubCategory]>>()
    var propertyChildSubject = PublishSubject<Dictionary<String,[SubCategory]>>()
    init() {
        apiService = ApiService()
        getCategories()
    }
    func getCategories(){
        apiService.getCategories { model, message, error in
            if model != nil {
                let otherModel = CategoryChild(id: 0, name: "other", description: nil, slug: nil, children: nil)
                var flatenModel = model!
                flatenModel.append(otherModel)
                self.categoriesSubject.onNext(flatenModel)
            }
        }
    }
    func getPropertyDataFrom(dict:Dictionary<String,[SubCategory]>)->(name:String,names:[String],dropDown:[DropDownModel],property:[SubCategory]){
        let subs = dict.values.first!
        let name = dict.keys.first!
        let names = dict.values.first!.map({$0.name ?? ""})
        
        let dropDownModel = subs.map({DropDownModel(name: $0.name ?? "", id: $0.id ?? 0) })

        return (name:name,names:names,dropDown:dropDownModel,property:subs)
    }
    func getSelectedPropertyOptionsFrom(properties:[SubCategory],selectedOption:DropDownModel?)->[Option]?{
        properties.first(where: {$0.id == selectedOption?.id })?.options
    }
    
    func getProperties(id:Int,parent:String){
        apiService.getProperties(with: id) { model, message, error in
            if model != nil {
                
                let otherModel = SubCategory(id: 0, name: "other", description: nil, slug: nil, options: nil)
                var flatenModel = model!
                flatenModel.append(otherModel)

                let dictionary = [parent:flatenModel]
                self.propertiesSubject.onNext(dictionary)

            }
        }
    }
    func getPropertyChild(id:Int,parent:String){
        apiService.getPropertyChild(with: id) { model, message, error in
            if model != nil{
                
                let otherModel = SubCategory(id: 0, name: "other", description: nil, slug: nil, options: nil)
                var flatenModel = model!
                flatenModel.append(otherModel)

                let dictionary = [parent:flatenModel]
                self.propertyChildSubject.onNext(dictionary)
            }
        }
    }

}
