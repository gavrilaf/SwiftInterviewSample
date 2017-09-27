//
//  PixabayImage.swift
//  InterviewSample
//
//  Created by Eugen Fedchenko on 9/27/17.
//  Copyright © 2017 wirex. All rights reserved.
//

import Foundation

/**
 "id": 195893,
 "pageURL": "https://pixabay.com/en/blossom-bloom-flower-yellow-close-195893/",
 "type": "photo",
 "tags": "blossom, bloom, flower",
 "previewURL": "https://static.pixabay.com/photo/2013/10/15/09/12/flower-195893_150.jpg"
 "previewWidth": 150,
 "previewHeight": 84,
 "webformatURL": "https://pixabay.com/get/35bbf209db8dc9f2fa36746403097ae226b796b9e13e39d2_640.jpg",
 "webformatWidth": 640,
 "webformatHeight": 360,
 "imageWidth": 4000,
 "imageHeight": 2250,
 "imageSize": 4731420,
 "views": 7671,
 "downloads": 6439,
 "favorites": 1,
 "likes": 5,
 "comments": 2,
 "user_id": 48777,
 "user": "Josch13",
 "userImageURL":
 **/
 

struct PixabayPhoto: Codable {
    let id: Int
    let tags: String
    let user: String
    let previewUrl: String
    
    enum CodingKeys : String, CodingKey {
        case id
        case tags
        case user
        case previewUrl = "previewURL"
    }
}

// MARK:

/**
 {
 "total": 4692,
 "totalHits": 500,
 "hits": [
 **/

struct PixabayQueryResult: Codable {
    let total: Int
    let totalHits: Int
    let hits: [PixabayPhoto]
}
