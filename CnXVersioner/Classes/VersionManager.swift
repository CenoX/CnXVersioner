import UIKit

class VersionManager {
    
    private enum UserDefaultsKeys: String {
        case versions
    }
    
    public static let shared = VersionManager()
    public private(set) var versions: AppVersion
    
    private init() {
        
        /// CFBundleShortVersionString
        let bundleVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        
        if let versionData = UserDefaults.standard.data(forKey: UserDefaultsKeys.versions.rawValue) {
            
            do {
                var decodedData = try JSONDecoder().decode(AppVersion.self, from: versionData)
                
                if bundleVersion == decodedData.currentVersion {
                    versions = decodedData
                    return
                }
                
                let savedVersion = decodedData.currentVersion
                
                if VersionManager.compareVersion(from: bundleVersion, to: savedVersion) {
                    decodedData.currentVersion = bundleVersion
                    decodedData.pastVersions.append(savedVersion)
                    let encodedData = try JSONEncoder().encode(decodedData)
                    UserDefaults.standard.set(encodedData, forKey: UserDefaultsKeys.versions.rawValue)
                    UserDefaults.standard.synchronize()
                    print("Current and past version updated.")
                }
                
                versions = decodedData
                
            } catch let error {
                print(error)
                fatalError("Error while loading data from userdefaults.")
            }
        } else {
            // New Data needed.
            let newData = AppVersion(currentVersion: bundleVersion, pastVersions: [])
            do {
                let encodedData = try JSONEncoder().encode(newData)
                UserDefaults.standard.set(encodedData, forKey: UserDefaultsKeys.versions.rawValue)
                UserDefaults.standard.synchronize()
            } catch let error {
                print("Error while saving data into userdefaults.")
                print(error)
            }
            versions = newData
        }
        
    }
    
    static private func compareVersion(from currentVersion: String, to pastVersion: String?) -> Bool {
        guard let pastVersion = pastVersion else { return true /* No past version */ }
        return pastVersion.compare(currentVersion, options: .numeric) == .orderedDescending
    }
    
}
