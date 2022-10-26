//
//  NetworkingManager.swift
//  CryptoKing
//
//  Created by Ovidio  on 9/10/22.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case decodingError
        case errorCode(Int)
        case badUrlResponse(URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .decodingError:
                return " [😡] Error decoding the object from the service."
            case .errorCode(let error):
                return " [😓] Somethingn went wrong - \(error)"
            case .badUrlResponse(let url):
                return " [🤬] Bad Url Response - \(url)"
            case .unknown:
                return " [🥺] Unknown error has occurred."
            }
        }
    }
    
//  We use static here because this function will always remain the same. If we didn't use static, we would have to init
//  the NetworkingManager class every time we wanted to use the download() function.
    static func download(url: URL ) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
             .tryMap({ try handleUrlResponse(output: $0, url: url)} )
             .receive(on: DispatchQueue.main)
//           Using eraseToAnyPublisher() converts everything above it to a generic AnyPublisher<Data, Error>
             .eraseToAnyPublisher()

    }
    
    static func handleUrlResponse(output:  URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
        response.statusCode >= 200 && response.statusCode <= 299
        else {
            throw NetworkingError.badUrlResponse(url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("\(error.localizedDescription)")
        }
    }
    
}
