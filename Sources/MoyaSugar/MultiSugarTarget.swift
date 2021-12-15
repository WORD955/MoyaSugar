import Foundation
import Moya

public enum MultiSugarTarget: SugarTargetType {
    case target(SugarTargetType)
    
    public init(_ target: SugarTargetType) {
        self = .target(target)
    }
    
    public var target: SugarTargetType {
        switch self {
        case let .target(target):
            return target
        }
    }
    
    public var baseURL: URL {
        target.baseURL
    }
    
    public var url: URL {
        target.url
    }
    
    public var defaultURL: URL {
        target.defaultURL
    }
    
    public var route: Route {
        target.route
    }
    
    public var parameters: Parameters? {
        target.parameters
    }
    
    public var headers: [String: String]? {
        target.headers
    }
    
    public var task: Task {
        target.task
    }
    
    public var validationType: ValidationType {
        target.validationType
    }
    
    public var sampleData: Data {
        target.sampleData
    }
}
