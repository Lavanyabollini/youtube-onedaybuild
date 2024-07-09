//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Lavanya B R on 09/07/24.
//

import Foundation
class Model {
    func getVideos(){
        // create an URL object
        let url = URL(string: Constants.API_URL)
        guard url != nil  else {
            return
        }
    //Get a URLSession object
        let session = URLSession.shared
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { data, response, error in
            // check if there were any errors
            if error != nil || data == nil {
                return
            }
            do{
                //parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            }
            catch {
                
            }
        }
        // Kick off the task
        dataTask.resume()
    }
}
