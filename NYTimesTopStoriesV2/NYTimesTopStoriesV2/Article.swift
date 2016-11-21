//
//  Article.swift
//  NYTimesTopStoriesV2
//
//  Created by C4Q on 11/20/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Article {

    let section: String
    let subsection: String
    let title: String
    let abstract: String
    let url: String
    let byline: String
    let itemType: String
    let updatedDate: String
    let createdDate: String
    let publishedDate: String
    let materialTypeFacet: String
    let kicker: String
    
    init(section: String, subsection: String, title: String, abstract: String, url: String, byline: String, itemType: String, updatedDate: String, createdDate: String, publishedDate: String, materialTypeFacet: String, kicker: String) {
        self.section = section
        self.subsection = subsection
        self.title = title
        self.abstract = abstract
        self.url = url
        self.byline = byline
        self.itemType = itemType
        self.updatedDate = updatedDate
        self.createdDate = createdDate
        self.publishedDate = publishedDate
        self.materialTypeFacet = materialTypeFacet
        self.kicker = kicker
    }
    
    //The reason I feel comfortable returnig nil on any of these failing is that it seems that if the data doesn't exist within the json from NYTimes, they provide an empty string
    
    convenience init? (dict: [String: AnyObject]) {
        guard let section = dict["section"] as? String else {
            print("section failed")
            return nil
        }
        guard let subsection = dict["subsection"] as? String else {
            print("subsection failed")
            return nil
        }
        guard let title = dict["title"] as? String else {
            print("title failed")
            return nil
        }
        guard let abstract = dict["abstract"] as? String else {
            print("abstract failed")
            return nil
        }
        guard let url = dict["url"] as? String else {
            print("url failed")
            return nil
        }
        guard let byline = dict["byline"] as? String else {
            print("byline failed")
            return nil
        }
        guard let itemType = dict["item_type"] as? String else {
            print("item type failed")
            return nil
        }
        guard let updatedDate = dict["updated_date"] as? String else {
            print("section failed")
            return nil
        }
        guard let createdDate = dict["created_date"] as? String else {
            print("created date failed")
            return nil
        }
        guard let publishedDate = dict["published_date"] as? String else {
            print("published date failed")
            return nil
        }
        guard let materialTypeFacet = dict["material_type_facet"] as? String else {
            print("material type failed")
            return nil
        }
        guard let kicker = dict["kicker"] as? String else {
            print("kicker failed")
            return nil
        }
        self.init(section: section, subsection: subsection, title: title, abstract: abstract, url: url, byline: byline, itemType: itemType, updatedDate: updatedDate, createdDate: createdDate, publishedDate: publishedDate, materialTypeFacet: materialTypeFacet, kicker: kicker)
    }
    
    static func makeArticles(data: Data) -> [Article]? {
        var arr = [Article]()
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let dictionary = json as? [String: AnyObject] else { return nil }
            guard let results = dictionary["results"] as? [[String: AnyObject]] else {return nil}
            for result in results {
                arr.append(Article(dict: result)!)
            }
        }
        catch {
            print(error.localizedDescription)
        }
        return arr
    }
    
}
