/*
 * Jenkins Swift Client
 */

public enum Transport: String {
    case http
    case https
}

public final class Jenkins {
    private(set) var jobs: [Job] = []
    private(set) var client: APIClient?
    
    var jenkinsURL: String {
        guard let url = self.client?.baseURL else {
            return ""
        }
        return url.absoluteString
    }
    
    var jobURL: String {
        guard let url = self.client?.baseURL,
            let path = self.client?.path else {
                return ""
        }
        return url.appendingPathComponent(path).absoluteString
    }

    public init(host: String, port: Int, user: String, token: String, path: String, transport: Transport = .http) throws {
        do {
            self.client = try APIClient(host: host, port: port, path: path, user: user, token: token, transport: transport.rawValue)
        } catch let error as APIError {
            throw JenkinsError(error: error)
        }
    }
}

extension Jenkins : CustomStringConvertible {
    public var description: String {
        return "Jenkins \(client!.user) @ \(client!.host):\(client!.port)"
    }
}
