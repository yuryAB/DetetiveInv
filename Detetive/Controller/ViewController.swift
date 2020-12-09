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
        nextViewController.reportMustBeEdited = true
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
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! ListTableViewCell
        let report = reports[indexPath.row]
        tableCell.hour.text = report.reportHour
        tableCell.local.text = report.reportLocal
        tableCell.suspect.image = UIImage(named: report.reportSuspect)
        tableCell.weapon.image = UIImage(named: report.reportWeapon)
        return tableCell
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
}
