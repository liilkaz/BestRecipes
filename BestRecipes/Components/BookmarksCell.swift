//
//  BookmarksCell.swift
//  BestRecipes
//
//  Created by Daniil Kulikovskiy on 27.08.2023.
//

import SwiftUI
import Kingfisher

struct BookmarksCell: View {
    @State private var isBookmarked = false
    @EnvironmentObject var networkAggregateModel: NetworkAggregateModel
    let title: String
    let subtitle: String
    let image: String
    let autorImage: String
    let autorName: String
    let scoreNumber: Double
    let recipe: BookmarkRecipe
    var widthBackground: CGFloat
    var heightBackground: CGFloat
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .top) {
                KFImage(URL(string: image))
                    .resizable()
                    .scaledToFill()
                    .frame(width: widthBackground, height: heightBackground)
                    .background(.red)
                    .cornerRadius(20)
                HStack {
                    Button {
                    } label: {
                        RatingView(scoreNumber: scoreNumber)
                        
                        Text(String(scoreNumber))
                            .font(.custom(Poppins.Bold, size: 14))
                            .foregroundColor(.white)
                            .offset(x: -1)
                    }
                    .frame(width: 62, height: 28)
                    .background(.ultraThinMaterial)
                    .cornerRadius(8)
                    Spacer()
                    
                    Button {
                        addBookmark()
                    } label: {
                        Image(isBookmarked ? "Bookmark" : "BookmarkCancel")
                            .frame(width: 32, height: 32)
                            .foregroundColor(.red)
                    }
                    .background(.ultraThinMaterial)
                    .background(.white)
                    .clipShape(Circle())
                }
                .padding(.top, 8)
                .padding(.horizontal, 12)
            }
            
            VStack(alignment: .leading) {
                HStack{
                    Text(title)
                        .font(.custom(Poppins.SemiBold, size: 16))
                    Spacer()
                    Button {
                        tapShare()
                    } label: {
                        Image("Settings")
                            .foregroundColor(.black)
                    }
                }
                .frame(width: widthBackground - 12, height: 22, alignment: .leading)
                .padding([.leading, .trailing], 20)
                
                HStack() {
                    Image(autorImage)
                    Text("By \(autorName)")
                        .font(.custom(Poppins.Light, size: 14))
                        .padding(.leading, 5)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 20)
            }
        }
        .frame(width: widthBackground)
    }
    private func tapShare() {
        print("Share button tap!")
    }
    private func addBookmark() {
        if isBookmarked {
            if let index = networkAggregateModel.bookmarkedRecipes?.firstIndex(where: { $0.id == recipe.id }) {
                networkAggregateModel.bookmarkedRecipes?.remove(at: index)
            }
        } else {
            let bookmark = BookmarkRecipe(id: recipe.id, title: recipe.title, image: recipe.image)
            networkAggregateModel.bookmarkedRecipes?.append(bookmark)
            UserDefaultService.shared.saveStructs(structs: networkAggregateModel.bookmarkedRecipes ?? [], forKey: "Bookmarks")
        }
        isBookmarked.toggle()
        isBookmarked ? print("Add bookmark") : print("Cancel bookmark")
    }
}

struct BookmarksCell_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksCell(title: "How to sharwama at homed ",
                      subtitle: "Subtitle",
                      image: "receptes",
                      autorImage: "author",
                      autorName: "Zeelicious foods",
                      scoreNumber: 3.0,
                      recipe: BookmarkRecipe.init(id: 0, title: "", image: ""),
                      widthBackground: 384,
                      heightBackground: 220)
    }
}


