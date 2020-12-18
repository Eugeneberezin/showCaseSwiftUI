//
//  ProjectSummaryView.swift
//  ShowCaseApp
//
//  Created by Eugene Berezin on 12/17/20.
//

import SwiftUI

struct ProjectSummaryView: View {
    @ObservedObject var project: Project
    
    var body: some View {
        VStack {
            Text("\(project.projectItems.count) items")
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(project.projectTitle)
                .font(.title2)
            
            ProgressView(value: project.completionAmount)
                .accentColor(Color(project.projectColor))
        }
        .padding()
        .background(Color.secondarySystemGroupedBackground)
        .shadow(color: Color.black.opacity(0.2), radius: 5)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(project.label)
    }
}

struct ProjectSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectSummaryView(project: Project.example)
    }
}
