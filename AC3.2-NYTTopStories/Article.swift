//
//  Article.swift
//  AC3.2-NYTTopStories
//
//  Created by Jason Gresh on 11/19/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Article : NSObject {
    let section: String
    let subsection: String
    let title: String
    let abstract: String
    let url: String
    let byline: String
    let item_type: String
    let updated_date: String
    let created_date: String
    let published_date: String
    let des_facet: [String]
    let org_facet: [String]
    let per_facet: [String]
    let geo_facet: [String]
    let endPoint: String
    
    init?(from dict:[String:Any], endPoint: String) {
        if let section = dict["section"] as? String,
            let subsection = dict["subsection"] as? String,
            let title = dict["title"] as? String,
            let abstract = dict["abstract"] as? String,
            let url = dict["url"] as? String,
            let byline = dict["byline"] as? String,
            let item_type = dict["item_type"] as? String,
            let updated_date = dict["updated_date"] as? String,
            let created_date = dict["created_date"] as? String,
            let published_date = dict["published_date"] as? String,
            let des_facet = dict["des_facet"] as? [String],
            let org_facet = dict["org_facet"] as? [String],
            let per_facet = dict["per_facet"] as? [String],
            let geo_facet = dict["geo_facet"] as? [String] {
            self.endPoint = endPoint
            self.section = section
            self.subsection = subsection
            self.title = title
            self.abstract = abstract
            self.url = url
            self.byline = byline
            self.item_type = item_type
            self.updated_date = updated_date
            self.created_date = created_date
            self.published_date = published_date
            self.des_facet = des_facet
            self.org_facet = org_facet
            self.per_facet = per_facet
            self.geo_facet = geo_facet
        }
        else {
            return nil
        }
    }
    
    static func parseArticles(from arr:[[String:Any]], endPoint: String) -> [Article] {
        var articles = [Article]()
        for articleDict in arr {
            if let article = Article(from: articleDict, endPoint: endPoint) {
                articles.append(article)
            }
        }
        return articles
    }
}
