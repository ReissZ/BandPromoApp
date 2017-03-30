//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Reiss Zurbyk on 2017-01-19.
//  Copyright © 2017 Reiss Zurbyk. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1Video = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let p2Video = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gZIqW92GaTQ\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let p3Video = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/xGiBiHocSZM\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let p4Video = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/1w9DiGlZksU\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let p5Video = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let pic1 = "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg"
        
        let pic2 = "http://www.croshalgroup.com/wp-content/uploads/2015/05/Redfoo-Website.jpg"
        
        let pic3 = "https://i.ytimg.com/vi/2wUxw6GH3IM/hqdefault.jpg"
        
        let pic4 = "http://www.billboard.com/files/styles/article_main_image/public/media/lmfao-party-rock-anthem-2011-billboard-650.jpg"
        
        let pic5 = "http://direct-ns.rhap.com/imageserver/v2/albums/Alb.219913217/images/600x600.jpg"
        
        let p1 = PartyRock(imageURL: pic1, videoURL: p1Video, videoTitle: "Lights Out")
        
        let p2 = PartyRock(imageURL: pic2, videoURL: p2Video, videoTitle: "Redfoo Mannequin Challenge")
        
        let p3 = PartyRock(imageURL: pic3, videoURL: p3Video, videoTitle: "New Thang")
        
        let p4 = PartyRock(imageURL: pic4, videoURL: p4Video, videoTitle: "Let's Get Ridiculous")
        
        let p5 = PartyRock(imageURL: pic5, videoURL: p5Video, videoTitle: "Juicy Wiggle")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            
        return cell
        
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }

}

