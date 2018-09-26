//
//  TableauController.swift
//  lecteur Youtube
//
//  Created by CHEVALIER on 26/09/2018.
//  Copyright © 2018 CHEVALIER. All rights reserved.
//

import UIKit

class TableauController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var chansons = [Chanson]()
    let identifiantCell = "ChansonCell"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ajouterChanson()
     
    }

   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chansons.count
    }

    // permet d'ajouter le titre dans les cellules
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let chanson = chansons[indexPath.row] // permet d'aller choper les elements dans le tableau
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifiantCell) as? ChansonCell {
            cell.creerCell(chanson)
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    //definit la hauteur des cellules
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    
    
    
    func ajouterChanson() {
        chansons = [Chanson]()
        let chrisSharma =  Chanson(artiste: "Chris", titre: "Grimpe", code: "CH8zKm5N048")
        let ad = Chanson(artiste: "Ada", titre: "Grimpe2", code: "Fb22k-B08R4")
        
        chansons.append(contentsOf: [chrisSharma, ad])
        
        //ReloadData - permet de recharcher et de mettre a jour le table view si besoin
        tableView.reloadData()
        
    }
 
    
    
}
