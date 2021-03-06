//
//  AwardsView.swift
//  ShowCaseApp
//
//  Created by Eugene Berezin on 11/14/20.
//

import SwiftUI

struct AwardsView: View {
    static let tag: String? = "Awards"
    
    @EnvironmentObject var dataController: DataController
    @State private var selectedAward = Award.example
    @State private var showingAwardDetails = false
    
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 100, maximum: 100))]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(Award.allAwards) { award in
                        Button {
                            selectedAward = award
                            showingAwardDetails = true
                        } label: {
                            Image(systemName: award.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                .foregroundColor(dataController.hasEarnAward(award: award) ? Color(award.color) :  Color.secondary.opacity(0.5))
                        }
                        .accessibilityLabel(Text(dataController.hasEarnAward(award: award)  ? "Unlocked: \(award.name)" : "Locked"))
                        .accessibilityHint(Text(award.description))
                        
                      
                    }
                }
            }
            
            .navigationTitle("Awards")
        }
        .alert(isPresented: $showingAwardDetails) {
            if dataController.hasEarnAward(award: selectedAward) {
                return Alert(title: Text("Unlocked: \(selectedAward.name)"), message: Text(selectedAward.description), dismissButton: .default(Text("OK")))
            } else {
                return Alert(title: Text("Locked"), message: Text(selectedAward.description), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
