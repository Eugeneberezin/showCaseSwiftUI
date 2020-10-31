//
//  ContentView.swift
//  ShowCaseApp
//
//  Created by Eugene Berezin on 10/29/20.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedView") var selectedView: String?
    
    var body: some View {
        
        TabView(selection: $selectedView) {
            HomeView()
                .tag(HomeView.tag)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            ProjectView(showClosedProjects: false)
                .tag(ProjectView.openTag)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Open")
                }
            
            ProjectView(showClosedProjects: true)
                .tag(ProjectView.closeTag)
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("Closed")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var dataController = DataController.preview

    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
