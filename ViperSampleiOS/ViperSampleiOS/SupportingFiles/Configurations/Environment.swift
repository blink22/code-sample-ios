import Foundation

public enum Environment {
    
    enum Keys {
        static let serverBaseUrl = "SERVER_BASE_URL"
        static let releaseVersionNumber = "CFBundleShortVersionString"
        static let buildVersionNumber = "CFBundleVersion"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found.")
        }
        return dict
    }()
    
    static let serverBaseUrl: String = {
      guard let serverBaseUrl = infoDictionary[Keys.serverBaseUrl] as? String else {
        fatalError("Server Base Url not set in plist for this environment.")
      }
        return serverBaseUrl
    }()
    
    static let appVersionNumber: String = {
        guard let releaseVersionNumber = infoDictionary[Keys.releaseVersionNumber] as? String,
              let buildVersionNumber = infoDictionary[Keys.buildVersionNumber] as? String else {
            fatalError("App Version Number not found in plist for this environment.")
        }
        return "\(releaseVersionNumber).\(buildVersionNumber)"
    }()
}
