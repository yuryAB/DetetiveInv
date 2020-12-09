//
//  investigationObjects.swift
//  Detetive
//
//  Created by yury antony on 09/12/20.
//

import Foundation

class InvestigationObject{
    var hours: [String]
    var locals: [String]
    var suspects: [String]
    var weapons: [String]
    
    init(hours:[String],locals:[String],suspects:[String],weapons:[String]) {
        self.hours = hours
        self.locals = locals
        self.suspects = suspects
        self.weapons = weapons
    }
}

extension InvestigationObject{
   static var objectList = InvestigationObject(hours: ["06:00hrs","10:00hrs","13:00hrs","16:00hrs","18:00hrs"], locals: ["Quarto","Sala","Cozinha"], suspects: ["Sigynbe","Andrea","Vevoda","Culpado"], weapons: ["Tesoura","Martelo","Faca"])
}
