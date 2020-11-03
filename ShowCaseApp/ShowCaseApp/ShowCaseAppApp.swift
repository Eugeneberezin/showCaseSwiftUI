//
//  ShowCaseAppApp.swift
//  ShowCaseApp
//
//  Created by Eugene Berezin on 10/29/20.
//

import SwiftUI

@main
struct ShowCaseAppApp: App {
    @StateObject var dataController: DataController
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                    .environmentObject(dataController)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: save(_:))
        }
    }
    
    func save(_ note: Notification) {
        dataController.save()
    }
}
