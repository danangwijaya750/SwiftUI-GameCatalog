//
//  ResponseData.swift
//  Game Catalog
//
//  Created by Danang Wijaya on 11/08/21.
//

import Foundation

struct Response: Codable {
    let count : Int
    let next : String?
    let previous : String?
    let results : [GameModel]
}

struct GameModel:Identifiable, Codable {
    let id : Int
    let slug : String?
    let name: String?
    let released : String?
    let tba : Bool
    let background_image : String?
    let rating : Double
    let rating_top: Int
}

struct GameDetail: Codable {
    let id: Int
    let slug, name, nameOriginal, welcomeDescription: String
    let metacritic: Int
    let metacriticPlatforms: [MetacriticPlatform]
    let released: String
    let tba: Bool
    let backgroundImage: String
    let backgroundImageAdditional: String
    let website: String
    let rating, ratingTop: Double
    let ratings, reactions: AddedByStatus
    let added: Int
    let addedByStatus: AddedByStatus
    let playtime, screenshotsCount, moviesCount, creatorsCount: Int
    let achievementsCount: Int
    let parentAchievementsCount : Int
    let redditURL, redditName, redditDescription: String
    let redditLogo: String 
    let redditCount: Int
    let twitchCount: Int
    let youtubeCount : Int
    let reviewsTextCount: Int
    let ratingsCount, suggestionsCount: Int
    let alternativeNames: [String]
    let metacriticURL: String
    let parentsCount, additionsCount, gameSeriesCount: Int
    let esrbRating: EsrbRating
    let platforms: [AddedByStatus]

    enum CodingKeys: String, CodingKey {
        case id, slug, name
        case nameOriginal = "name_original"
        case welcomeDescription = "description"
        case metacritic
        case metacriticPlatforms = "metacritic_platforms"
        case released, tba
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case website, rating
        case ratingTop = "rating_top"
        case ratings, reactions, added
        case addedByStatus = "added_by_status"
        case playtime
        case screenshotsCount = "screenshots_count"
        case moviesCount = "movies_count"
        case creatorsCount = "creators_count"
        case achievementsCount = "achievements_count"
        case parentAchievementsCount = "parent_achievements_count"
        case redditURL = "reddit_url"
        case redditName = "reddit_name"
        case redditDescription = "reddit_description"
        case redditLogo = "reddit_logo"
        case redditCount = "reddit_count"
        case twitchCount = "twitch_count"
        case youtubeCount = "youtube_count"
        case reviewsTextCount = "reviews_text_count"
        case ratingsCount = "ratings_count"
        case suggestionsCount = "suggestions_count"
        case alternativeNames = "alternative_names"
        case metacriticURL = "metacritic_url"
        case parentsCount = "parents_count"
        case additionsCount = "additions_count"
        case gameSeriesCount = "game_series_count"
        case esrbRating = "esrb_rating"
        case platforms
    }
}

struct AddedByStatus: Codable {
}

struct EsrbRating: Codable {
    let id: Int
    let slug, name: String
}

struct MetacriticPlatform: Codable {
    let metascore: Int
    let url: String
}

