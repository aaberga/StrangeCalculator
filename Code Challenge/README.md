# IG Code Challenge
_Last updated: 24th Jan 20_

Our code challenge involves creating an app called FX World.

The app uses the DailyFX API to link users to the top FX news articles for the day, and to see which markets are rated as "Top Markets".

Our users are FX Traders, who would like to use the app on a daily basis. They have specified the following requirements: 
- The app should be able to see a list of the latest news as well as the top markets of the day
- When an article is tapped, it should open its corresponding URL

We have included some Swift models below, as well as an example request and response from the network requests. 

We will review the code based on the following points:
- Choosing a suitable architecture for the project
- Keeping business logic separate from UI code
- Unit testing

We would like you to spend around 4 hours on the task, place the entire project folder in a zip file and return it to us. If you have any questions, please feel free to ask us via email.

```
import Foundation

let baseURL = URL(string: "https://content.dailyfx.com")!

enum Endpoint: String {
    case dashboard = "/api/v1/dashboard"
    case markets = "/api/v1/markets"
}

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
```
