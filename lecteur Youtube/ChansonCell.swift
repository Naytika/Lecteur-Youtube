//
//  ChansonCell.swift
//  lecteur Youtube
//
//  Created by CHEVALIER on 26/09/2018.
//  Copyright © 2018 CHEVALIER. All rights reserved.
//

import UIKit

class ChansonCell: UITableViewCell {

    @IBOutlet weak var miniature: UIImageView!
    
    @IBOutlet weak var artisteEtTitreLabel: UILabel!
    
    var chanson: Chanson!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    func creerCell(_ chanson: Chanson) {
        self.chanson = chanson
        telechargerImage()
        let attributed = NSMutableAttributedString(string: self.chanson.titre, attributes: [.font: UIFont.boldSystemFont(ofSize: 20), .foregroundColor: UIColor.black] )
        let secondeLigne = NSAttributedString(string: "\n" + self.chanson.artiste, attributes: [.font: UIFont.italicSystemFont(ofSize: 20), .foregroundColor: UIColor.darkGray])
        
        attributed.append(secondeLigne)
        artisteEtTitreLabel.attributedText = attributed
    }
    
    
    func telechargerImage() {
        miniature.image = #imageLiteral(resourceName: "logo")
        
        if let url = URL(string: self.chanson.baseURLMiniature) { // ERREUR Normallement c'est chanson.miniatureURL
            let session = URLSession.shared // permet d'aller acceder aux methodes de cette session
            let task = session.dataTask(with: url) { (data, response, error) in
                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.miniature.image = image
                    }
                }
            }
            task.resume()
        }
        
        
    }
    
    
}
