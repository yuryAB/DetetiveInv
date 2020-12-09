//
//  suspections.swift
//  Detetive
//
//  Created by yury antony on 04/12/20.
//

import Foundation
import UIKit

class Report{
    var reportHour: String
    var reportLocal: String
    var reportWeapon: String
    var reportSuspect: String
    
    init(reportHour: String,reportLocal: String,reportWeapon: String,reportSuspect: String) {
        self.reportHour = reportHour
        self.reportLocal = reportLocal
        self.reportWeapon = reportWeapon
        self.reportSuspect = reportSuspect
    }
}

extension Report{
    static var all: [Report] = []
}
