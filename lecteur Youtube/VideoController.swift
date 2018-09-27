//
//  VideoController.swift
//  lecteur Youtube
//
//  Created by CHEVALIER on 27/09/2018.
//  Copyright © 2018 CHEVALIER. All rights reserved.
//

import UIKit
import WebKit

class VideoController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    
    var chanson: Chanson?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        if chanson != nil {
            chargerVideo(chanson: chanson!)
            
        }
    }

    func chargerVideo(chanson: Chanson) {
        
        if let url = URL(string: chanson.baseURLVideo) {
            let requete = URLRequest(url: url)
            webView.load(requete)
        }
    }

}
