import Foundation

// MARK: - Movies
struct SearchDailyBoxOffice: Codable {
  let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Codable {
  let boxOfficeType: String
  let showRange: String
  let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Codable {
  let index: String
  let rank: String
  let rankChange: String
  let entryStatus: EntryStatus
  let movieCode: String
  let movieName: String
  let releaseDate: String
  let salesAmount: String
  let salesShare: String
  let salesChange: String
  let salesChangeRate: String
  let salesTotal: String
  let audienceCount: String
  let audienceChange: String
  let audienceChangeRate: String
  let audienceTotal: String
  let screenCount: String
  let showCount: String
  
  enum CodingKeys: String, CodingKey {
    case index = "rnum"
    case rank
    case rankChange = "rankInten"
    case entryStatus = "rankOldAndNew"
    case movieCode = "movieCd"
    case movieName = "movieNm"
    case releaseDate = "openDt"
    case salesAmount = "salesAmt"
    case salesShare
    case salesChange = "salesInten"
    case salesChangeRate = "salesChange"
    case salesTotal = "salesAcc"
    case audienceCount = "audiCnt"
    case audienceChange = "audiInten"
    case audienceChangeRate = "audiChange"
    case audienceTotal = "audiAcc"
    case screenCount = "scrnCnt"
    case showCount = "showCnt"
  }
}

enum EntryStatus: String, Codable {
  case new = "NEW"
  case old = "OLD"
}