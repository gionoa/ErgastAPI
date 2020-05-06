//
//  Endpoint.swift
//  
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation

/// Object to use for generating a URL with a given Path enum case..
struct Endpoint {
    private var path = "/api/f1"
    
    
    /// Initializer for an Endpoint object.
    /// - Parameters:
    ///   - path: Specify a path, mapping to a specific endpoint of the Ergast REST API.
    ///   - season: Specify either all historical circuits, or circuits for a specific year.
    init(with path: Path, for season: Season?) {
        if let season = season {
            self.path.append(path.subPath(for: season))
        }
    }
}

// MARK: - Endpoint URL Builder
extension Endpoint {
    /// URL for the given path.
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ergast.com"
        components.path = path
        
        guard let validURL = components.url else { fatalError() }
        
        return validURL
    }
}
