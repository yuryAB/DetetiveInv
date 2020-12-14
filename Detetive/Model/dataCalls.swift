//
//  dataCalls.swift
//  Detetive
//
//  Created by yury antony on 14/12/20.
//

import Foundation
import UIKit
import CoreData

class {
    var reportHour: String!
    var reportLocal: String!
    var reportWeapon: String!
    var reportSuspect: String!
    
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
