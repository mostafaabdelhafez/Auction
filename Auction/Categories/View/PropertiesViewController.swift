//
//  PropertiesViewController.swift
//  Auction
//
//  Created by jobzella on 04/01/2023.
//

import UIKit
import RxSwift
class PropertiesViewController: UIViewController {
    @IBAction func detailsDidTapped(){
        self.navigationController?.pushViewController(AuctionDetailsViewController.viewControllerfromNib(), animated: true)
    }
    @IBOutlet weak var categoryTextField:TitledTextField!{
        didSet{
            categoryTextField.placeHolder = "Category"
            categoryTextField.textField.didSelect { [unowned self] selectedText, index, id in
                self.subCategoryTextField.textField.optionArray = []
                self.subCategoryTextField.textField.text = nil
                if selectedText == "other"{
                    self.stack.insertArrangedSubview(DropDownGenerator.createOtherTextField(), at: 1)
                }
                if let childreen = self.categories[index].children,!childreen.isEmpty{
                    self.subCategories = childreen
                }
                if self.stack.arrangedSubviews[1] != self.subCategoryTextField{
                    self.stack.arrangedSubviews[1].removeFromSuperview()
                }
                TitledTextField.reset(tf: self.propertyTextField)
                StackViewHelper.removeStackArrangedViewsFrom(stack: self.stack, except: self.propertyTextField)


            }
        }
    }
    @IBOutlet weak var subCategoryTextField:TitledTextField!{
        didSet{
            subCategoryTextField.placeHolder = "SubCategory"
            subCategoryTextField.textField.didSelect { [unowned self] selectedText, index, id in
                TitledTextField.reset(tf: self.propertyTextField)

            let selectedId = self.subCategories[index].id ?? 0
                let parent = self.subCategories[index].slug ?? ""
                self.viewModel.getProperties(id: selectedId,parent:parent)
                StackViewHelper.removeStackArrangedViewsFrom(stack: self.stack, except: self.propertyTextField)

            }
        }
    }
    @IBOutlet weak var propertyTextField:TitledTextField!

    @IBOutlet weak var stack:UIStackView!


    var viewModel:ViewModel!
    let disposeBag = DisposeBag()
    var categories = [CategoryChild](){
        didSet{
            let names = categories.map({$0.name ?? ""})
            print(names)
            categoryTextField.textField.optionArray = names
        }
    }
    var subCategories = [CategoryChild](){
        didSet{

            let names = subCategories.map({$0.name ?? ""})
            print(names)
            subCategoryTextField.textField.optionArray = names
        }
    }
    var propertyChild = Dictionary<String,[SubCategory]>(){
        didSet{
            let data = viewModel.getPropertyDataFrom(dict: propertyChild)
            let name = data.name
            let names = data.names
            let property = data.property

            let dropDownModel = data.dropDown
            
            DropDownGenerator.create(dropDown:TitledTextField(), with:name, with: names, from: dropDownModel, on: self.stack) { child in
                
                guard let options = self.viewModel.getSelectedPropertyOptionsFrom(properties: property, selectedOption: child) else{return}
                
                
                let name = property.first(where: {$0.id == child?.id ?? 0})?.name ?? ""

                let dropDownModel = options.map({DropDownModel(name:$0.name ?? "", id: $0.id ?? 0) })
                let names = dropDownModel.map({$0.name })
                DropDownGenerator.create(dropDown: TitledTextField(), with:name, with: names, from: dropDownModel, on: self.stack) { child in
                    let isThereChild = options.first(where:  {$0.id == child?.id ?? 0})?.child
                    let optionName = options.first(where: {$0.id == child?.id ?? 0})?.name ?? ""

                    if isThereChild ?? false{
                        
                        self.viewModel.getPropertyChild(id: child?.id ?? 0, parent: optionName)
                    }

                }
            }
        }
        
    }
    var properties = Dictionary<String,[SubCategory]>(){
        didSet{

            let data = viewModel.getPropertyDataFrom(dict: properties)
            let name = data.name
            let names = data.names
            let dropDownModel = data.dropDown
            let property = data.property
            propertyTextField.isHidden = false
            propertyTextField.textField.optionArray = names
            propertyTextField.placeHolder = name
            propertyTextField.textField.didSelect { [unowned self] selectedText, index, id in
                if self.stack.arrangedSubviews.count > 3, self.stack.arrangedSubviews[3] != self.propertyTextField{
                    self.stack.arrangedSubviews[3].removeFromSuperview()
                }

                StackViewHelper.removeStackArrangedViewsFrom(stack: self.stack, except: self.propertyTextField)

                if selectedText == "other"{
                    self.stack.insertArrangedSubview(DropDownGenerator.createOtherTextField(), at:3 )
                }

                guard let options = property.first(where: {$0.id == dropDownModel[index].id})?.options else{return}
                let name = property.first(where: {$0.id == dropDownModel[index].id})?.name ?? ""

            let dropDownModel = options.map({DropDownModel(name:$0.name ?? "", id: $0.id ?? 0) })
                let names = dropDownModel.map({$0.name })

                DropDownGenerator.create(dropDown: TitledTextField(), with:name, with: names, from: dropDownModel, on: self.stack) { child in
                    
                    let isThereChild = options.first(where:  {$0.id == child?.id ?? 0})?.child
                    let optionName = options.first(where: {$0.id == child?.id ?? 0})?.name ?? ""

                    if isThereChild ?? false{
                        
                        self.viewModel.getPropertyChild(id: child?.id ?? 0, parent: optionName)
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

