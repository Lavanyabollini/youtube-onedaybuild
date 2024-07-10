//
//  DetailVideoViewController.swift
//  youtube-onedaybuild
//
//  Created by Lavanya B R on 10/07/24.
//

import UIKit
import WebKit

class DetailVideoViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        guard video != nil else{
            return
        }
        // create the embed URL
        let embedURLString =  Constants.YT_EMBED_URL + video!.videoId
        // load it into the webview
        let url = URL(string: embedURLString)
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        // set the title
        titleLabel.text = video!.title
        // set the date
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = dateFormat.string(from: video!.published)
        // set the description
        textView.text = video!.description
    }
    
}
