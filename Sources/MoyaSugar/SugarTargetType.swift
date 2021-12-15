import struct Foundation.URL

import Moya

public protocol SugarTargetType: TargetType {
    var url: URL { get }
    
    /// Returns `Route` which contains HTTP method and URL path information.
    ///
    /// Example:
    ///
    /// ```
    /// var route: Route {
    ///   return .get("/me")
    /// }
    /// ```
    var route: Route { get }
    var parameters: Parameters? { get }
    var encodeBody: Codable? { get }
}

public extension SugarTargetType {
    var url: URL {
        defaultURL
    }
    
    var defaultURL: URL {
        path.isEmpty ? baseURL : baseURL.appendingPathComponent(path)
    }
    
    var path: String {
        route.path
    }
    
    var method: Moya.Method {
        route.method
    }
    
    var encodeBody: Codable? {
        nil
    }
    
    var task: Task {
        if let encodeBody = encodeBody { return .requestJSONEncodable(encodeBody) }
        guard let parameters = parameters else { return .requestPlain }
        return .requestParameters(parameters: parameters.values, encoding: parameters.encoding)
    }
}
