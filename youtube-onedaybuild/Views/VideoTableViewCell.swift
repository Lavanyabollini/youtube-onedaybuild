//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Lavanya B R on 10/07/24.
//

import UIKit
// for date format used https://www.nsdateformatter.com/
class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(_ v: Video) {
        self.video = v
        
        //ensure that we have video
        guard self.video != nil  else {
            return
        }
        // set title and date label
        self.titleLabel.text = video?.title
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = dateFormat.string(from: video!.published)
        
        // set the thumbnail
        guard self.video?.thumbnail != "" else{
            return
        }
        
        // check cache before downloading the data
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail){
            // set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        let url = URL(string: self.video!.thumbnail)
        // get the shared URL session object
        let session = URLSession.shared
        // create a data task
        let dataTask =  session.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                // save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                // check that downloaded url matches the video thumbnail url that this cell is currently set to display
                if url!.absoluteString  != self.video?.thumbnail {
                    // video cell has been recycled for another for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                // create the image object
                let image = UIImage(data: data!)
                // set the imageview
                DispatchQueue.main.async{
                    self.thumbnailImageView.image = image
                    
                }
            }
            
        }
       // Start data task
        dataTask.resume()
    }
}
