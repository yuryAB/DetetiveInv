//
//  ViewController.swift
//  Detetive
//
//  Created by yury antony on 03/12/20.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var plusButton: UIBarButtonItem!
    var reports =  Report.all
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        overrideUserInterfaceStyle = .light
        navigationItem.hidesBackButton = true
        listTableView.rowHeight = 135.0
        listTableView.delegate = self
        listTableView.dataSource = self
        plusButtonAvailability()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        listTableView.reloadData()
    }
    
    @IBAction func plusButtonPress(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Notes", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Notes") as! NotesViewController
        nextViewController.reportMustBeEdited = false
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func plusButtonAvailability(){
        if reports.count <= 2{
            plusButton.isEnabled = true
            plusButton.tintColor = .black
        }else{
            plusButton.isEnabled = false
            plusButton.tintColor = .clear
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! ListTableViewCell
        //Listar
        let report = reports[indexPath.row]
        let reportHour = report.reportHour
        let reportLocal = report.reportLocal
        let reportSuspect = report.reportSuspect
        let reportWeapon = report.reportWeapon
        
        cell.hour.text = reportHour
        cell.local.text = reportLocal
        cell.suspect.image = UIImage(named: reportSuspect)
        cell.weapon.image = UIImage(named: reportWeapon)
        
        let score = intuitionScore(hour: reportHour, local: reportLocal, suspect: reportSuspect, weapon: reportWeapon)
        setScore(start1: cell.star1,start2: cell.star2,start3: cell.star3,start4: cell.star4,score:score)
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Havia algo aqui...")
            plusButtonAvailability()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = self.listTableView.indexPathForSelectedRow else{
            return
        }
        let report = reports[indexPath.row]
        let DetailsReportViewController = segue.destination as!  DetailsReportViewController
        DetailsReportViewController.details = report

    }
    
    func intuitionScore(hour:String,local:String,suspect:String,weapon:String)->Int{
        let intuition = InvestigationObject.objectList.realObjects
        var intuitionScore = 0
        for object in intuition{
            switch object {
            case encrypt(message:hour):
                intuitionScore+=1
            case encrypt(message:local):
                intuitionScore+=1
            case encrypt(message:suspect):
                intuitionScore+=1
            case encrypt(message:weapon):
                intuitionScore+=1
            default:
                intuitionScore+=0
            }
        }
        return intuitionScore
    }
    func setScore(start1:UIImageView,start2:UIImageView,start3:UIImageView,start4:UIImageView,score:Int){
        if score >= 1 {start1.alpha = 1}
        if score >= 2 {start2.alpha = 1}
        if score >= 3 {start3.alpha = 1}
        if score >= 4 {start4.alpha = 1}
    }
    
    func encrypt(message: String) -> String {
        let unicodeScalars = message.unicodeScalars.map { UnicodeScalar(Int($0.value) - 10)! }
        return String(String.UnicodeScalarView(unicodeScalars))
    }
}
