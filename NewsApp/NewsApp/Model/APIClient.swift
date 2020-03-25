//
//  APIClient.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 23/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

public class APIClient {
    private let baseEndpointUrl = URL(string: "http://newsapi.org/v2/")!
    private let session = URLSession(configuration: .default)
    //public var newsArticles: [Article] = []

//    public func send<T: APIRequest>(_ request: T, completion: @escaping (Result<T.Response, Error>) -> Void) {
//        let endpoint = self.endpoint(for: request)
//        let task = session.dataTask(with: URLRequest(url: endpoint)) { data, _, error in
//            if let data = data {
//                do {
//                    // Decode the top level response, and look up the decoded response to see
//                    // if it's a success or a failure
//                    let newsResponse = try JSONDecoder().decode(NewsResponse<T.Response>.self, from: data)
//                    if newsResponse.status == "error" {
//                        completion(.failure(NewsError.server(message: newsResponse.code ?? newsResponse.error ?? "Erreur dans votre requête")))
//                    } else if newsResponse.status == "ok" {
//                        guard let articles = newsResponse.articles else {
//                            return
//                        }
//                        completion(.success(articles))
//                    } else {
//                        fatalError()
//                    }
//                } catch {
//                    completion(.failure(error))
//                }
//            } else if let error = error {
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }

    public func send<T: APIRequest>(_ request: T, completion: @escaping (Result<T.Response, Error>) -> Void) {
        let endpoint = self.endpoint(for: request)
        let task = session.dataTask(with: URLRequest(url: endpoint)) { data, _, error in
            if let data = data {
                do {
                    // Decode the top level response, and look up the decoded response to see
                    // if it's a success or a failure
                    let newsResponse = try JSONDecoder().decode(T.Response.self, from: data)
                    print(newsResponse)
                    completion(.success(newsResponse))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    /// Encodes a URL based on the given request
    private func endpoint<T: APIRequest>(for request: T) -> URL {
        guard let baseUrl = URL(string: request.resourceName, relativeTo: baseEndpointUrl) else {
            fatalError("Bad resourceName: \(request.resourceName)")
        }

        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!

        // Custom query items needed for this specific request
        let customQueryItems: [URLQueryItem]

        do {
            customQueryItems = try URLQueryItemEncoder.encode(request)
        } catch {
            fatalError("Wrong parameters: \(error)")
        }

        components.queryItems = customQueryItems

        // Construct the final URL with all the previous data
        return components.url!
    }
}
