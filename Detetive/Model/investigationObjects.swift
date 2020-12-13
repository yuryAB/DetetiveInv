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
    var realObjects: [String]
    
    init(hours:[String],locals:[String],suspects:[String],weapons:[String],realObjects:[String]) {
        self.hours = hours
        self.locals = locals
        self.suspects = suspects
        self.weapons = weapons
        self.realObjects = realObjects
    }
}

extension InvestigationObject{
   static var objectList = InvestigationObject(hours: ["10h","13h","15h","16h","18h30min"], locals: ["Quarto","Sala","Cozinha","Lavanderia"], suspects: ["Sigynbe","Amelia","Vevoda","Culpado"], weapons: ["Tesoura","Martelo","Faca","Travesseiro","Marreta","Corda"],realObjects: ["')^","GkWhje","9kbfWZe","JhWl[ii[_he"])
}

