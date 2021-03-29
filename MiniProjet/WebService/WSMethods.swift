//
//  WSMethods.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import UIKit

enum ApiLog {
    static let urlError = "URL error!"
    static let clientError = "Client error!"
    static let serverError = "Server error!"
    static let jsonErrorDeserializing  = "Error deserializing JSON: %@"
}

func GetApiRequest(_ urlString: String, completion:@escaping (_ finished: Bool, _ response: AnyObject?) ->Void) {
    let session = URLSession.shared
    guard let url = URL(string: urlString) else {
        print(ApiLog.urlError)
        completion(false, ApiLog.urlError as AnyObject?)
        return
    }

    let task = session.dataTask(with: url) { data, response, error in

        if error != nil || data == nil {
            print(ApiLog.clientError)
            completion(false, error as AnyObject?)
            return
        }

        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            print(ApiLog.serverError)
            completion(false, error as AnyObject?)
            return
        }

        completion(true, data as AnyObject?)
    }

    task.resume()
}

func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
}
