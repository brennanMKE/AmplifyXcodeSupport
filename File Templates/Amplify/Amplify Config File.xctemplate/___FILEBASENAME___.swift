//___FILEHEADER___

// Amplify Docs:
// https://docs.amplify.aws/lib/q/platform/ios

// Developer Checklist:
// 1) Add build targets for Amplify modules
// 2) Add linking to each of the Amplify modules
// 3) Clean and rebuild

// Create a new project:
// https://docs.amplify.aws/lib/project-setup/create-application/q/platform/ios#n1-create-a-new-project

import Foundation
import Amplify
import AWSDataStorePlugin
import AWSCognitoAuthPlugin
import AWSS3StoragePlugin
import AWSPinpointAnalyticsPlugin

struct AmplifyConfig {

    static func configure() throws {
        #if DEBUG
        Amplify.Logging.logLevel = .debug
        #else
        Amplify.Logging.logLevel = .info
        #endif

        let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
        try Amplify.add(plugin: dataStorePlugin)
        try Amplify.add(plugin: AWSCognitoAuthPlugin())
        try Amplify.add(plugin: AWSS3StoragePlugin())
        try Amplify.add(plugin: AWSPinpointAnalyticsPlugin())

        try Amplify.configure()
        Amplify.Logging.info("Configured Amplify")
    }

}
