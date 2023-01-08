//
//  PropertiesViewController.swift
//  Auction
//
//  Created by jobzella on 04/01/2023.
//

import UIKit
import RxSwift
class PropertiesViewController: UIViewController {
    @IBOutlet weak var categoryTextField:TitledTextField!{
        didSet{
            categoryTextField.placeHolder.text = "Category"
            categoryTextField.textField.listWillAppear {
                for i in 0..<self.stack.arrangedSubviews.count {
                    if i > 2{
                        self.stack.arrangedSubviews[i].removeFromSuperview()
                    }
                }

            }

        }
    }
    @IBOutlet weak var subCategoryTextField:TitledTextField!{
        didSet{
            subCategoryTextField.placeHolder.text = "SubCategory"
            subCategoryTextField.textField.listWillAppear {
                for i in 0..<self.stack.arrangedSubviews.count {
                    if i > 2{
                        self.stack.arrangedSubviews[i].removeFromSuperview()
                    }
                }

            }


        }
    }
    @IBOutlet weak var propertyTextField:TitledTextField!{
        didSet{
            propertyTextField.textField.listWillAppear {
                for i in 0..<self.stack.arrangedSubviews.count {
                    if i > 2{
                        self.stack.arrangedSubviews[i].removeFromSuperview()
                    }
                }

            }

        }
    }

    @IBOutlet weak var stack:UIStackView!


    var viewModel:ViewModel!
    let disposeBag = DisposeBag()
    var categories = [CategoryChild](){
        didSet{
            let names = categories.map({$0.name ?? ""})
            print(names)
            categoryTextField.textField.optionArray = names
            categoryTextField.textField.didSelect { [weak self] selectedText, index, id in
                
                if let childreen = self?.categories[index].children,!childreen.isEmpty{
                    
                    self?.subCategories = childreen
                }
            }


        }
    }
    var subCategories = [CategoryChild](){
        didSet{
            let names = subCategories.map({$0.name ?? ""})
            print(names)
            subCategoryTextField.textField.optionArray = names
            subCategoryTextField.textField.didSelect { [weak self] selectedText, index, id in
                
            let selectedId = self?.subCategories[index].id ?? 0
                let parent = self?.subCategories[index].slug ?? ""
                self?.viewModel.getProperties(id: selectedId,parent:parent)

            }
        }
    }
    var propertyChild = Dictionary<String,[SubCategory]>(){
        didSet{
            let subs = propertyChild.values.first!
            let name = propertyChild.keys.first!
            let names = propertyChild.values.first!.map({$0.name ?? ""})
            
            let dropDownModel = subs.map({DropDownModel(name: $0.name ?? "", id: $0.id ?? 0) })

            DropDownGenerator.create(dropDown:TitledTextField(), with:name, with: names, from: dropDownModel, on: self.stack) { child in
                
                let options = subs.first(where: {$0.id == child?.id ?? 0})?.options!
                    let name = subs.first(where: {$0.id == child?.id ?? 0})?.name ?? ""

                let dropDownModel = options!.map({DropDownModel(name:$0.name ?? "", id: $0.id ?? 0) })
                let names = dropDownModel.map({$0.name })
                DropDownGenerator.create(dropDown: TitledTextField(), with:name, with: names, from: dropDownModel, on: self.stack) { child in
                    let isThereChild = options?.first(where:  {$0.id == child?.id ?? 0})?.child
                    let optionName = options?.first(where: {$0.id == child?.id ?? 0})?.name ?? ""

                    if isThereChild ?? false{
                        
                        self.viewModel.getPropertyChild(id: child?.id ?? 0, parent: optionName)
                    }

                }
            }
        }
        
    }
    var properties = Dictionary<String,[SubCategory]>(){
        didSet{
            for i in 0..<stack.arrangedSubviews.count {
                if i > 2{
                    stack.arrangedSubviews[i].removeFromSuperview()
                }
            }

            let subs = properties.values.first!
            let name = properties.keys.first!
            let names = properties.values.first!.map({$0.name ?? ""})
            
            let dropDownModel = subs.map({DropDownModel(name: $0.name ?? "", id: $0.id ?? 0) })
            
            propertyTextField.textField.optionArray = names
            propertyTextField.placeHolder.text = name
            propertyTextField.textField.didSelect { [weak self] selectedText, index, id in
            let options = subs.first(where: {$0.id == dropDownModel[index].id})?.options!
                let name = subs.first(where: {$0.id == dropDownModel[index].id})?.name ?? ""

            let dropDownModel = options!.map({DropDownModel(name:$0.name ?? "", id: $0.id ?? 0) })
                let names = dropDownModel.map({$0.name })

                DropDownGenerator.create(dropDown: TitledTextField(), with:name, with: names, from: dropDownModel, on: self!.stack) { child in
                    
                    let isThereChild = options?.first(where:  {$0.id == child?.id ?? 0})?.child
                    let optionName = options?.first(where: {$0.id == child?.id ?? 0})?.name ?? ""

                    if isThereChild ?? false{
                        
                        self?.viewModel.getPropertyChild(id: child?.id ?? 0, parent: optionName)
                    }
                }

                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        viewModel.categoriesSubject.subscribe { model in
            print(model)
            if model.element != nil {
                self.categories = model.element!
            }
            
        }.disposed(by: disposeBag)
        viewModel.propertiesSubject.subscribe { model in
            print(model)
            if model.element != nil {
                self.properties = model.element!
            }
            
        }.disposed(by: disposeBag)
        viewModel.propertyChildSubject.subscribe { model in
            print(model)
            if model.element != nil {
                self.propertyChild = model.element!
            }
            
        }.disposed(by: disposeBag)

        
        // Do any additional setup after loading the view.
    }

}

