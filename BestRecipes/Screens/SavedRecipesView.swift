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
        VStack {
            Text("SavedRecipesView")
            Button {
                tabbarRouter.currentPage = .home
            } label: {
                Text("to home")
        NavigationView {
            VStack(spacing: 30) {
                BookmarksCell()
                BookmarksCell()
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
