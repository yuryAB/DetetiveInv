//
//  NotesViewController.swift
//  Detetive
//
//  Created by yury antony on 03/12/20.
//

import UIKit

class NotesViewController: UIViewController {
    @IBOutlet var hourTextField: UITextField!
    @IBOutlet var localTextField: UITextField!
    @IBOutlet var weaponTextField: UITextField!
    @IBOutlet var suspectTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    var hourPickerView = UIPickerView()
    var localPickerView = UIPickerView()
    var weaponPickerView = UIPickerView()
    var suspectPickerView = UIPickerView()
    let objects = InvestigationObject.objectList
    var reportMustBeEdited = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hourTextField.inputView = hourPickerView
        localTextField.inputView = localPickerView
        weaponTextField.inputView = weaponPickerView
        suspectTextField.inputView = suspectPickerView
        
        hourTextField.placeholder = "Hora"
        localTextField.placeholder = "Local"
        weaponTextField.placeholder = "Arma do Crime"
        suspectTextField.placeholder = "Criminoso"
        
        hourPickerView.setDelegateAndDatasource(delegate: self, datasource: self)
        localPickerView.setDelegateAndDatasource(delegate: self, datasource: self)
        weaponPickerView.setDelegateAndDatasource(delegate: self, datasource: self)
        suspectPickerView.setDelegateAndDatasource(delegate: self, datasource: self)
        
        hourPickerView.tag = 1
        localPickerView.tag = 2
        weaponPickerView.tag = 3
        suspectPickerView.tag = 4
        saveButtonState()//feghijkl
        setupSuspects()//tvmqimve
    }
}

extension NotesViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return objects.hours.count
        case 2:
            return objects.locals.count
        case 3:
            return objects.weapons.count
        case 4:
            return objects.suspects.count
        default:
            return objects.hours.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return objects.hours[row]
        case 2:
            return objects.locals[row]
        case 3:
            return objects.weapons[row]
        case 4:
            return objects.suspects[row]
        default:
            return objects.hours[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            hourTextField.text = objects.hours[row]
            hourTextField.resignFirstResponder()
            saveButtonState()
        case 2:
            localTextField.text = objects.locals[row]
            localTextField.resignFirstResponder()
            saveButtonState()
        case 3:
            weaponTextField.text = objects.weapons[row]
            weaponTextField.resignFirstResponder()
            saveButtonState()
        case 4:
            suspectTextField.text = objects.suspects[row]
            suspectTextField.resignFirstResponder()
            saveButtonState()
        default:
            hourTextField.text = objects.hours[row]
            hourTextField.resignFirstResponder()
            saveButtonState()
        }
    }
}

extension NotesViewController{
    func verifyNilTexts()->Bool{
        let evidence1 = hourTextField.text
        let evidence2 = localTextField.text
        let evidence3 = weaponTextField.text
        let evidence4 = suspectTextField.text
        let evidences = [evidence1,evidence2,evidence3,evidence4]
        for evidence in evidences{
            if evidence!.count < 2{
                return false
            }
        }
        return true //khfjersj
    }
    func saveButtonState(){
        let state = verifyNilTexts()
        if state{
            saveButton.tintColor = .black
            saveButton.isEnabled = state
            saveButton.layer.borderColor = UIColor.black.cgColor
            saveButton.setTitleColor(.black, for: .normal)
        }else{
            saveButton.layer.borderWidth = 1
            saveButton.clipsToBounds = true
            saveButton.layer.borderColor = UIColor.white.cgColor
            saveButton.layer.cornerRadius = 15
            saveButton.isEnabled = false
        }
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        if !reportMustBeEdited{
            let notes = Report(reportHour: hourTextField.text!, reportLocal: localTextField.text!, reportWeapon: weaponTextField.text!, reportSuspect: suspectTextField.text!)
            Report.all.append(notes)//qweasdrf
        }else{
            //Você não deveria mexer aqui...
            pass()
        }
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let mainViewController = storyBoard.instantiateViewController(withIdentifier: "Main") as! ViewController
        self.navigationController?.pushViewController(mainViewController, animated: true)
        
    }
    
    func pass(){
        print("Nada aqui")
    }
    func setupSuspects(){
        if objects.suspects.count == 4{
        objects.suspects.removeLast()
        }
    }
}

extension UIPickerView{
    func setDelegateAndDatasource(delegate:UIPickerViewDelegate,datasource:UIPickerViewDataSource){
        self.delegate = delegate
        self.dataSource = datasource
    }
}
