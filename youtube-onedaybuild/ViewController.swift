//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Lavanya B R on 08/07/24.
//

import UIKit
// followed tutorial https://www.youtube.com/watch?v=lQx1hAOQkpc&list=PLMRqhzcHGw1aLoz4pM_Mg2TewmJcMg9ua&index=6

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,ModelDelegate {
    
    var model = Model()
    var videos = [Video]()
    
    @IBOutlet weak var tabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //set itself as delegate of the model
        model.delegate = self
       model.getVideos()
        
       
    }
// MARK: - Model delegate methods
    func videosFetched(_ videos: [Video]) {
        // set the returned videos to our video property
        self.videos = videos
        // refresh the tableview
        DispatchQueue.main.async {
            self.tabelView.reloadData()
        }
    }

    // MARK: - TableView datasource and delegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        //configure cell with data
        let title = videos[indexPath.row].title
        cell.textLabel?.text = title
        cell.textLabel?.numberOfLines = 0
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

