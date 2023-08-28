//
//  BookmarksCell.swift
//  BestRecipes
//
//  Created by Daniil Kulikovskiy on 27.08.2023.
//

import SwiftUI

struct BookmarksCell: View {
    @State private var isBookmarked = false
    var title: String = "How to sharwama at home"
    var subtitle: String = "Subtitle"
    var image = "Food Thumbnail"
    var autorImage = "author"
    var autorName = "Zeelicious foods"
    var bookmarkAdd = "bookmark"
    var bookmarkDone = "bookmark.fill"
    var scoreNumber: Double = 5.0
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .top) {
                Image(image)
                    .frame(width: 343, height: 180)
                    .scaledToFit()
                
                HStack {
                    Button {
                    } label: {
                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                        Text(String(scoreNumber))
                            .font(.system(.headline).bold())
                            .foregroundColor(.white)
                    }
                    .frame(width: 58, height: 27.6)
                    .background(.ultraThinMaterial)
                    .background(.black)
                    .clipShape(Capsule())
                    Spacer()
                    
                    Button {
                        addBookmark()
                    } label: {
                        Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                            .frame(width: 32, height: 32)
                            .foregroundColor(.red)
                    }
                    .background(.ultraThinMaterial)
                    .background(.white)
                    .clipShape(Circle())
                }
                .cornerRadius(140)
                .padding([.leading, .trailing], 33)
            }
            
            VStack(alignment: .leading) {
                HStack{
                    Text(title)
                        .font(.headline)
                        .padding(.top, 2)
                    Spacer()
                    Button {
                        tapShare()
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.black)
                    }
                }
                .padding(.top, 10)
                .padding([.leading, .trailing], 30)
                HStack() {
                    Image(autorImage)
                    Text("By \(autorName)")
                        .padding(.leading, 5)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 30)
            }
        }
    }
    private func tapShare() {
        print("Share button tap!")
    }
    private func addBookmark() {
        isBookmarked.toggle()
        isBookmarked ?
        print("Add bookmark") : print("Cancel bookmark")
    }
}

struct BookmarksCell_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksCell()
    }
}


