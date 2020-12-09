//
//  CoreDataManager.swift
//  Detetive
//
//  Created by Rebeca Pacheco on 07/12/20.
//
import Foundation
import CoreData

internal struct CoreDataManager{
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("erro de load \(error)")
            }
        }
        return container
    }()
    
    //função de criar registro
    func createInvestigationNote(arma: String?, hora: String?, local: String?, suspeito: String?) -> Investigation? {
        
        let context = persistentContainer.viewContext
        
        let investigationDetails = NSEntityDescription.insertNewObject(forEntityName: "Investigation", into: context) as! Investigation
        
        investigationDetails.hora = hora
        investigationDetails.arma = arma
        investigationDetails.local = local
        investigationDetails.suspeito = suspeito
        
        //issso somente se faz durante o desenvolvimento do app
        do {
            try context.save()
            return investigationDetails
        } catch let createError {
            print("Failed to create: \(createError)")
        }
        
        return nil
    }
    
    //função de obter registro
    func fetchInvestigationNote() -> [Investigation]?{
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Investigation>(entityName: "Investigation")
        
        do {
            let details = try context.fetch(fetchRequest)
            return details
        } catch let fetchError {
            print("Failed to fetch: \(fetchError)")
        }
        return nil
    }
    
    //Função de atualizar seus registros
    func updateInvestigation(investigation: Investigation){
        let context = persistentContainer.viewContext
        
        do{
            try context.save()
        } catch let updateError {
            print("Failed to update: \(updateError)")
        }
    }
    
    //função de deletar registros
    
    func deleteInvestigation(investigation: Investigation){
        let context = persistentContainer.viewContext
        context.delete(investigation)
        do{
            try context.save()
        } catch let deleteError {
            print("Failed to delete: \(deleteError)")
        }
    }
    
}



