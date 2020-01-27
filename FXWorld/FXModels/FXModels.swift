//
//  FXModels.swift
//  FXWorld
//
//  Created by Aldo Bergamini on 27/01/2020.
//  Copyright © 2020 iBat Inc.. All rights reserved.
//

import Foundation



//MARK: - Models

struct AllNews: Codable {
    let topNews: [Article]
    let dailyBriefings: DailyBriefings
    let technicalAnalysis, specialReport: [Article]
}

struct DailyBriefings: Codable {
    let eu, asia, us: [Article]
}

struct Article: Codable, Hashable {
    let title: String
    let url: String
    let headlineImageUrl, articleImageUrl, backgroundImageUrl: String?
    let authors: [[String: String?]]
    let instruments, tags, categories: [String]?
    let displayTimestamp, lastUpdatedTimestamp: Int
}

struct MarketsResponse: Codable {
    let currencies, commodities, indices: [Market]
}

struct Market: Codable {
    let displayName, marketId: String
    let rateDetailURL: String
    let topMarket: Bool
}
