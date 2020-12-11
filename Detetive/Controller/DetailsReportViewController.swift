//
//  DetailsReportViewController.swift
//  Detetive
//
//  Created by andrea dantas on 04/12/20.
//

import UIKit

class DetailsReportViewController: UIViewController {
 
    var details: Report?
    
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
        self.localImage.image = UIImage(named: details!.reportLocal)
        editButton.isEnabled = false//wikyrhe
        editButton.tintColor = .clear//bmzkmqzi
    }
    @IBAction func editButtonClicked(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Notes", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Notes") as! NotesViewController
        nextViewController.reportMustBeEdited = true
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
