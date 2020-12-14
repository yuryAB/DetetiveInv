//
//  DetailsReportViewController.swift
//  Detetive
//
//  Created by andrea dantas on 04/12/20.
//

import UIKit

class DetailsReportViewController: UIViewController {
 
    var details: Report?//Investigation!
    
    @IBOutlet var suspeitoLabel: UILabel!
    @IBOutlet var horaLabel: UILabel!
    @IBOutlet var armaLabel: UILabel!
    @IBOutlet weak var localImage: UIImageView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.suspeitoLabel.text = self.details?.reportSuspect
        self.horaLabel.text = self.details?.reportHour
        self.armaLabel.text = self.details?.reportWeapon
        self.localImage.image = UIImage(named: details!.reportLocal!)
        editButtonSetup() //wikyrhe
    }
    
    func editButtonSetup(){
        editButton.isEnabled = false
        editButton.tintColor = .clear
    }
    @IBAction func editButtonClicked(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Notes", bundle:nil)
        let notesViewController = storyBoard.instantiateViewController(withIdentifier: "Notes") as! NotesViewController
        notesViewController.reportMustBeEdited = true
        notesViewController.noteToReplace = details
        
        self.navigationController?.pushViewController(notesViewController, animated: true)
    }
}
