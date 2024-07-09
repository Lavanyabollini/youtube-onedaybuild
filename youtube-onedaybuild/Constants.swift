//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Lavanya B R on 09/07/24.
//

import Foundation

struct Constants {
    static var API_KEY = ""
    static var PLAYLIST_ID = "PLMRqhzcHGw1YqPh-ggQHJPAUxdHov_uNJ"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
