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
    @IBOutlet weak var editButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.suspeitoLabel.text = self.details?.reportSuspect
        self.horaLabel.text = self.details?.reportHour
        self.armaLabel.text = self.details?.reportWeapon
        editButton.isEnabled = false//wikyrhe
        editButton.tintColor = .clear//bmzkmqzi
    }
}
