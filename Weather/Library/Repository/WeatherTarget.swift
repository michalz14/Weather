//
//  WeatherTarget.swift
//  Weather
//
//  Created by Michał Zieliński on 18/06/2022.
//

import Foundation

enum WeatherTarget {
    case hourly(coordinates: Coordinates)
    case daily(coordinates: Coordinates)
    
    struct APIBase {
        static let apiKey = "b191d7ca9c643a041efbd299efcd44f6"
        static let basePath = URL(string: "https://api.openweathermap.org/data/2.5/onecall")!
    }
    
    struct Constants {
        static let appid = "appid"
        static let units = "units"
        static let lat = "lat"
        static let lon = "lon"
        static let exclude = "exclude"
        static let daily = "daily"
        static let hourly = "hourly"
        static let metric = "metric"
    }
    
    var components: URLComponents? {
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: Constants.appid, value: APIBase.apiKey))
        queryItems.append(URLQueryItem(name: Constants.units, value: Constants.metric))
        switch self {
        case .hourly(let coordinates):
            queryItems.append(URLQueryItem(name: Constants.lat, value: "\(coordinates.latitude)"))
            queryItems.append(URLQueryItem(name: Constants.lon, value: "\(coordinates.longitude)"))
            queryItems.append(URLQueryItem(name: Constants.exclude, value: "\(Constants.daily)"))
        case .daily(let coordinates):
            queryItems.append(URLQueryItem(name: Constants.lat, value: "\(coordinates.latitude)"))
            queryItems.append(URLQueryItem(name: Constants.lon, value: "\(coordinates.longitude)"))
            queryItems.append(URLQueryItem(name: Constants.exclude, value: "\(Constants.hourly)"))
        }
        return URLComponents(url: APIBase.basePath, resolvingAgainstBaseURL: true)?.addingQueries(queryItems: queryItems)
    }
    
    var request: URLRequest? {
        components?.url.map { URLRequest.init(url: $0) }
    }
}

private extension URLComponents {
    
    func addingQueries(queryItems: [URLQueryItem]) -> URLComponents {
        var copy = self
        copy.queryItems = queryItems
        return copy
    }
}
