//
//  Locality Details 2.swift
//  My FlexiStay
//
//  Created by Apple on 10/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Locality_Details_2: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var mainv: UIView!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var txt5: UITextField!
    @IBOutlet weak var txt6: UITextField!
    @IBOutlet weak var txt7: UITextField!
    @IBOutlet weak var savbtn: UIButton!
    let datepicker = UIDatePicker()
    
          var customview = UIView()
          var textfield = UITextField()
          var pickerview = UIPickerView()
          var arrData = [[String]]()
          var isOpenCustomview:Bool = false
          var customviewBottomAnchor:NSLayoutConstraint!
          var activetextfield = UITextField()
          var activevlue = String()

    let imgurl = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-18.png"
    let imgurl2 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/Back1+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-14.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAndSetupCustomview()
        loadAndSetupTextFieldAndPickerView()
        setButtonToRightSideOfTextField()
        arrData = [[]]
        
        savbtn.layer.cornerRadius = 17
        img1.local2(urlstring: imgurl)
        img2.local2(urlstring: imgurl2)
        
        
        
        ///DatePicker
        createdatepicker()
        mainv.layer.cornerRadius = 40
        txt1.layer.borderWidth = 1
        txt1.layer.cornerRadius = 10
        txt1.layer.borderColor = UIColor.gray.cgColor
        txt2.layer.borderWidth = 1
        txt2.layer.cornerRadius = 10
        txt2.layer.borderColor = UIColor.gray.cgColor
        txt3.layer.borderWidth = 1
        txt3.layer.cornerRadius = 10
        txt3.layer.borderColor = UIColor.gray.cgColor
        txt4.layer.borderWidth = 1
        txt4.layer.cornerRadius = 10
        txt4.layer.borderColor = UIColor.gray.cgColor
        txt5.layer.borderWidth = 1
        txt5.layer.cornerRadius = 10
        txt5.layer.borderColor = UIColor.gray.cgColor
        txt6.layer.borderWidth = 1
        txt6.layer.cornerRadius = 10
        txt6.layer.borderColor = UIColor.gray.cgColor
        txt7.layer.borderWidth = 1
        txt7.layer.cornerRadius = 10
        txt7.layer.borderColor = UIColor.gray.cgColor
        txt1.delegate = self
        txt2.delegate = self
        txt3.delegate = self
        txt4.delegate = self
        txt5.delegate = self
        txt6.delegate = self
        txt7.delegate = self
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
            self.arrData.removeAll()
            
            switch textField {
//            case self.txt4:
//                self.textfield.text = "Select Apartment Type"
//                isOpenCustomview = true
//                self.arrData.append(["Apartment","Independent House/villa","Gated community villa"])
//                activetextfield = self.txt4
            case self.txt4:
                self.textfield.text = "Preferd Tenants*"
                isOpenCustomview = true
                self.arrData.append(["Any", "Family", "Bachelors"])
                activetextfield = self.txt4
            case self.txt5 :
                isOpenCustomview = true
                txt5.text = "Parking*"
                arrData.append(["Bike", "Car", "Bike & Car"])
                activetextfield = self.txt5
            case self.txt6 :
                isOpenCustomview = true
                txt5.text = "Furnishing*"
                arrData.append(["Fully Furnished", "Semi Furnished", "Unfurnished"])
                activetextfield = self.txt6
                
            default:
                print("another selected")
                isOpenCustomview = false
                self.arrData.append([])
            }

            if isOpenCustomview{
                UIView.animate(withDuration: 1, delay: 0, options: .transitionCrossDissolve, animations: {
                    self.customviewBottomAnchor.isActive = false
                    self.customviewBottomAnchor = self.customview.bottomAnchor.constraint(equalTo: self.savbtn.topAnchor, constant: -8)
                    self.customviewBottomAnchor.isActive = true
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }else{
                UIView.animate(withDuration: 1, delay: 0, options: .transitionCrossDissolve, animations: {
                    self.customviewBottomAnchor.isActive = false
                    self.customviewBottomAnchor = self.customview.bottomAnchor.constraint(equalTo: self.savbtn.topAnchor, constant: 250)
                    self.customviewBottomAnchor.isActive = true
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }
            self.pickerview.reloadAllComponents()
            
        }
    
        func loadAndSetupCustomview(){
            customview.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
            self.view.addSubview(customview)
            
            customview.translatesAutoresizingMaskIntoConstraints = false
            self.customviewBottomAnchor = customview.bottomAnchor.constraint(equalTo: savbtn.topAnchor, constant: 250)
            self.customviewBottomAnchor.isActive = true
            customview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
            customview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
            customview.heightAnchor.constraint(equalToConstant: 150).isActive = true
        }
        
        func loadAndSetupTextFieldAndPickerView(){
            textfield.backgroundColor = .lightGray
            textfield.textAlignment = .center
            self.customview.addSubview(textfield)
            textfield.translatesAutoresizingMaskIntoConstraints = false
            textfield.topAnchor.constraint(equalTo: self.customview.topAnchor, constant: 0).isActive = true
            textfield.leadingAnchor.constraint(equalTo: self.customview.leadingAnchor, constant: 0).isActive = true
            textfield.trailingAnchor.constraint(equalTo: self.customview.trailingAnchor, constant: 0).isActive = true
            textfield.heightAnchor.constraint(equalToConstant: 34).isActive = true
            
            
            pickerview.delegate = self
            pickerview.dataSource = self
            self.customview.addSubview(pickerview)
            pickerview.translatesAutoresizingMaskIntoConstraints = false
            pickerview.topAnchor.constraint(equalTo: self.textfield.bottomAnchor, constant: 8).isActive = true
            pickerview.leadingAnchor.constraint(equalTo: self.customview.leadingAnchor, constant: 8).isActive = true
            pickerview.trailingAnchor.constraint(equalTo: self.customview.trailingAnchor, constant: 8).isActive = true
            pickerview.bottomAnchor.constraint(equalTo: self.customview.bottomAnchor, constant: -8).isActive = true
            
        }
        
        func setButtonToRightSideOfTextField(){
                var doneBtn = UIButton(type: .custom)
                doneBtn.setTitle("Done  ", for: .normal)
                doneBtn.setTitleColor(.blue, for: .normal)
                doneBtn.addTarget(self, action: #selector(doneBtnClick(_:)), for: .touchUpInside)
                
                textfield.rightViewMode = .always
                textfield.rightView = doneBtn
            }
        
        @objc func doneBtnClick(_ sender:UIButton){
                print("Done click")
            activetextfield.text = activevlue
            }
        
        
        
    }

    extension Locality_Details_2:UIPickerViewDelegate,UIPickerViewDataSource{
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.arrData[0].count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.arrData[0][row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            print(self.arrData[0][row])
            self.textfield.text = "\(self.arrData[0][row])"
            activevlue = self.arrData[0][row]
        }
        ///DatePIcker
        func createdatepicker() {
             txt3.textAlignment = .center
             
             //toolbar
             let toolbar = UIToolbar()
             toolbar.sizeToFit()
             
             let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed))
             toolbar.setItems([donebtn], animated: true)
             
             txt3.inputAccessoryView = toolbar
             txt3.inputView = datepicker
         }
         @objc func donepressed() {
             let formatter = DateFormatter()
             formatter.dateStyle = .medium
             formatter.timeStyle = .none
             
             txt3.text = formatter.string(from: datepicker.date)
             self.view.endEditing(true)
         }
    

}
extension UIImageView {
    func local2(urlstring : String) {
        guard let url = URL(string: urlstring)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
