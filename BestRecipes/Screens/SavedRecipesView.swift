//
//  SavedRecipesView.swift
//  BestRecipes
//
//  Created by Лилия Феодотова on 27.08.2023.
//

import SwiftUI

struct SavedRecipesView: View {
    
    @EnvironmentObject var tabbarRouter: TabbarRouter
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    BookmarksCell(title: "How to sharwama at home",
                                  subtitle: "Subtitle",
                                  image: "Food Thumbnail",
                                  autorImage: "author",
                                  autorName: "Zeelicious foods",
                                  scoreNumber: 5.0)
                    BookmarksCell(title: "How to sharwama at home",
                                  subtitle: "Subtitle",
                                  image: "Food Thumbnail",
                                  autorImage: "author",
                                  autorName: "Zeelicious foods",
                                  scoreNumber: 5.0)
                }
            }
            .navigationTitle("Saved recipes")
        }
    }
}

struct SavedRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipesView()
    }
}
