//
//  ProjectView.swift
//  ShowCaseApp
//
//  Created by Eugene Berezin on 10/29/20.
//

import SwiftUI

struct ProjectView: View {
    static let openTag: String? = "Open"
    static let closeTag: String? = "Closed"
    let showClosedProjects: Bool
    let projects: FetchRequest<Project>
    
    init(showClosedProjects: Bool) {
        self.showClosedProjects = showClosedProjects
        
      projects = FetchRequest<Project>(entity: Project.entity(), sortDescriptors: [
                NSSortDescriptor(keyPath: \Project.creationDate, ascending: false)
            ], predicate: NSPredicate(format: "closed = %d", showClosedProjects))
        
    }
    
    var body: some View {
        
        NavigationView {
            List {
                    ForEach(projects.wrappedValue) { project in
                        Section(header: Text(project.projectTitle)) {
                            ForEach(project.projectItems) { item in
                                ItemRowView(item: item)
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle(showClosedProjects ? "Closed Projects" : "Open Projects")
        }
        
        
    }
}

struct ProjectView_Previews: PreviewProvider {
    
    static var dataController = DataController.preview
      static var previews: some View {
        ProjectView(showClosedProjects: false)
            .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
    }
}
