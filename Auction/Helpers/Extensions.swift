//
//  Extensions.swift
//  Auction
//
//  Created by jobzella on 04/01/2023.
//

import Foundation
import UIKit
extension Int{
    func getReminderOfTen()->Int{
       return Int(Double(self).remainder(dividingBy: 10)) == 0 ? Int(self/10) : (Int(self/10) + 1)
    }
}
extension String {
    func hasCharacter(in characterSet: CharacterSet) -> Bool {
        return rangeOfCharacter(from: characterSet) != nil
    }
        var isNumeric: Bool {
            guard self.count > 0 else { return false }
            let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
            return Set(self).isSubset(of: nums)
        }

}

extension UITextField{
    func attributedPlaceHolder(title:String,fontColor:UIColor,font:UIFont){
        
        self.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor:fontColor,NSAttributedString.Key.font:font])
    }
}
extension UIViewController {
    class func viewControllerfromNib<T: UIViewController>() -> T {
            let name = String(describing: self)
            print(name)
            
            let viewcontroller = self.init(nibName: String(describing:self), bundle: nil) as! T
            return viewcontroller
        }


//    func addNoData(with text:String,v:NoDataView){
//
//         self.view.addSubview(v)
//        v.isHidden = true
//        v.noDataLabel.text = text
//        v.pinEdgesToSuperviewBounds()
//    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }
    func pullToDismiss() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissView))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }


    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension UILabel{
    func setupLabel(text:String,textColor:UIColor,font:UIFont){
        self.text = text
        self.textColor = textColor
        self.font = font
    }
    
//    @objc public var substituteFontName : String {
//        get { return self.font.fontName }
//        set {
//            if (self.font.fontName.range(of:"bold") == nil && self.font.fontName.range(of:"Bold") == nil) {
//                self.font = UIFont(name: newValue, size: self.font.pointSize)
//            }
//        }
//    }
//
//    @objc public var substituteFontNameBold : String {
//        get { return self.font.fontName }
//        set {
//
//            if (self.font.fontName.range(of:"bold") != nil || self.font.fontName.range(of:"Bold") != nil) {
//                self.font = UIFont(name: newValue, size: self.font.pointSize)
//            }
//        }
//    }
//
//    @objc public var substituteFontNameLight : String {
//        get { return self.font.fontName }
//        set {
//
//            if (self.font.fontName.range(of:"light") != nil || self.font.fontName.range(of:"Light") != nil) {
//                self.font = UIFont(name: newValue, size: self.font.pointSize)
//            }
//        }
    
    func underline() {
        if let textString = self.text {
            // Create a new Attributed String
            let attributedString = NSMutableAttributedString.init(string: textString)
            // Add Underline Style Attribute.
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
                NSRange.init(location: 0, length: attributedString.length));
            self.attributedText = attributedString
        }
    }


}

extension UIView{
    func addShadow(){
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 4.0

    }

        class func fromNib<T: UIView>() -> T {
            return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
        }

    func roundedView(radius:CGFloat){
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    func pinEdgesToSuperviewBounds(topMargin: CGFloat = 0,leftMargin: CGFloat = 0,rightMargin: CGFloat = 0,bottomMargin: CGFloat = 0) {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `pinEdgesToSuperviewBounds()` to fix this.")
            return
        }

        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: topMargin).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -bottomMargin).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leftMargin).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -rightMargin).isActive = true

    }
    func centerH(superView:UIView){
        translatesAutoresizingMaskIntoConstraints = false

        self.centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: 0).isActive = true
    }
    func centerV(superView:UIView){
        translatesAutoresizingMaskIntoConstraints = false

        self.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: 0).isActive = true
    }
    func center(superView:UIView){
        translatesAutoresizingMaskIntoConstraints = false

        self.centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: 0).isActive = true
        self.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: 0).isActive = true

    }
    func width(constant:CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true


    }
    func height(constant:CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true


    }


    func Anchor(Top:NSLayoutYAxisAnchor?,Left:NSLayoutXAxisAnchor?,Bottom:NSLayoutYAxisAnchor?,Right:NSLayoutXAxisAnchor?,TopPadding:CGFloat,LeftPadding:CGFloat,BottomPadding:CGFloat,RightPadding:CGFloat,Width:CGFloat,Height:CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let Top = Top{
            self.topAnchor.constraint(equalTo: Top, constant: TopPadding).isActive = true
            
        }
        if let Left = Left{
            self.leftAnchor.constraint(equalTo: Left, constant: LeftPadding).isActive = true}
        if let Bottom = Bottom{
            self.bottomAnchor.constraint(equalTo: Bottom, constant: BottomPadding).isActive = true}
        if let Right = Right{
            self.rightAnchor.constraint(equalTo: Right, constant: RightPadding).isActive = true}
        if Width != 0{
            self.widthAnchor.constraint(equalToConstant: Width).isActive = true
        }
        if Height != 0{
            self.heightAnchor.constraint(equalToConstant: Height).isActive = true
        }
    }
}
extension UIImage{
    
    var original:UIImage{
             self.withRenderingMode(.alwaysOriginal)
    }
}
extension UIColor{
    static let brownishGrey = UIColor(red: 118/255, green: 118/255, blue: 118/255, alpha: 1)
    static let brownGrey = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1)

    static let darkGrey = UIColor(red: 22/255, green: 22/255, blue: 23/255, alpha: 1)
    static let main = UIColor(red: 4/255, green: 76/255, blue: 127/255, alpha: 1)
    static let deactiveColor = UIColor(red: 193/255, green: 199/255, blue: 204/255, alpha: 1)
    static let secondry = UIColor(red: 228/255, green: 128/255, blue: 37/255, alpha: 1)
    static let fadedBlue = UIColor(red: 83/255, green: 151/255, blue: 197/255, alpha: 1)
    static let veryLightPink = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    static let successColor = UIColor(red: 8/255, green: 149/255, blue: 70/255, alpha: 1)

}
extension UIImageView{
    func markSelectedWith(color:UIColor){
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color

    }
}

extension UIButton{
    func enableButton(isEnable:Bool){
        if isEnable{
            self.layer.opacity = 1
            self.isEnabled = true

        }
        else{
            self.layer.opacity = 0.3
            self.isEnabled = false

        }
    }
    func setAttributes(withTitle title:String,fontColor:UIColor,fonName:UIFont){
        self.setAttributedTitle(NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor:fontColor,NSAttributedString.Key.font:fonName]),for: [])
    }
    func setupUnderline(with title:String,font:UIFont,fontColor:UIColor){
        let attrs = [
            NSAttributedString.Key.font : font,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.foregroundColor : fontColor
        ] as [NSAttributedString.Key : Any]
        let attrString = NSMutableAttributedString(string:title, attributes:attrs)
        self.setAttributedTitle(attrString, for: [])
    }
}
extension UIApplication {
        
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    
}
extension UIApplication {
        
    class func topNavigationController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UINavigationController? {
        
        if let nav = viewController as? UINavigationController {
            return nav
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return selected.navigationController
            }
        }
        return viewController?.navigationController
    }
}


extension String{
    func convertToFloat()->Float{
        let st = self.replacedArabicDigitsWithEnglish
        return Float(st) ?? 0
    }
    public var replacedArabicDigitsWithEnglish: String {
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    public var replaceEngilshDigitsWithArabic: String {
        var str = self
        let map = ["0": "٠",
                   "1": "١",
                   "2": "٢",
                   "3": "٣",
                   "4": "٤",
                   "5": "٥",
                   "6": "٦",
                   "7": "٧",
                   "8": "٨",
                   "9": "٩"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    

}
