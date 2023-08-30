//
//  AddRecipeView.swift
//  BestRecipes
//
//  Created by Лилия Феодотова on 27.08.2023.
//

import SwiftUI

struct AddRecipeView: View {
    
    @State private var recipeName = ""
    @State private var recipeTimers = ""
    @State private var numberOfPeople = 1
    @State private var itemName = ""
    @State private var quanity = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack(alignment: .top) {
                    Text("Greate recipe")
                        .font(.custom(Poppins.SemiBold, size: 24))
                        .padding(.leading, 26)
                        .padding(.top, 20)
                    Spacer()
                }
                VStack() {
                    ZStack(alignment: .top) {
                        Image("bbq")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 363, height: 220)
                            .cornerRadius(20)
                        HStack {
                            Spacer()
                            Button {
                                changeRecipePhoto()
                            } label: {
                                Image("ChangePic")
                                    .frame(width: 32, height: 32)
                                    .foregroundColor(.red)
                            }
                            .background(.ultraThinMaterial)
                            .background(.white)
                            .clipShape(Circle())
                            
                        }
                        .padding(.top, 8)
                        .padding([.leading, .trailing], 33)
                    }
                }
                TextField(
                    "Naija lunch box ideas for work|",
                    text: $recipeName
                )
                .font(.custom(Poppins.Regular, size: 14))
                .frame(height: 44)
                .textInputAutocapitalization(.words)
                .padding([.leading, .trailing], 14)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.theme.customPink, lineWidth: 1)
                )
                .padding(.horizontal, 16)
                
                HStack {
                    Image("Peoples")
                        .padding([.leading, .trailing], 14)
                    Text("Serves")
                        .font(.custom(Poppins.Medium, size: 16))
                    Spacer()
                    Text("3")
                        .foregroundColor(.theme.customGray)
                        .font(.custom(Poppins.Medium, size: 14))
                    
                    Button {
                        
                    } label: {
                        Image("Arrow")
                    }
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 8)
                    
                }
                .font(.custom(Poppins.Regular, size: 14))
                .frame(height: 60)
                .textInputAutocapitalization(.words)
                .background(Color.theme.neutral)
                .cornerRadius(16)
                .padding([.leading, .trailing], 16)
                
                HStack {
                    Image("Peoples")
                        .padding([.leading, .trailing], 14)
                    Text("Cook time")
                        .font(.custom(Poppins.Medium, size: 16))
                    Spacer()
                    Text("20 min")
                        .foregroundColor(.theme.customGray)
                        .font(.custom(Poppins.Medium, size: 14))
                    Button {
                        
                    } label: {
                        Image("Arrow")
                    }
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 8)
                    
                }
                .font(.custom(Poppins.Regular, size: 14))
                .frame(height: 60)
                .textInputAutocapitalization(.words)
                .background(Color.theme.neutral)
                .cornerRadius(16)
                .padding([.leading, .trailing], 16)
                
                HStack(alignment: .top) {
                    Text("Ingredients")
                        .font(.custom(Poppins.SemiBold, size: 24))
                        .padding(.leading, 30)
                    Spacer()
                }
                
                HStack {
                    TextField(
                        "Item name",
                        text: $itemName
                    )
                    .font(.custom(Poppins.Regular, size: 14))
                    .frame(width: 164,height: 44)
                    .textInputAutocapitalization(.words)
                    .padding([.leading, .trailing], 14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.theme.customGray, lineWidth: 1)
                    )
                    .padding(.leading, 16)
                    
                    TextField(
                        "Quanity",
                        text: $quanity
                    )
                    .font(.custom(Poppins.Regular, size: 14))
                    .frame(height: 44)
                    .textInputAutocapitalization(.words)
                    .padding([.leading, .trailing], 14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.theme.customGray, lineWidth: 1)
                    )
                    
                    Button {
                        
                    } label: {
                        Image("PlusButton")
                    }
                    .padding(.trailing, 18)
                }
                
                HStack {
                    TextField(
                        "Item name",
                        text: $itemName
                    )
                    .font(.custom(Poppins.Regular, size: 14))
                    .frame(width: 164,height: 44)
                    .textInputAutocapitalization(.words)
                    .padding([.leading, .trailing], 14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.theme.customGray, lineWidth: 1)
                    )
                    .padding(.leading, 16)
                    
                    TextField(
                        "Quanity",
                        text: $quanity
                    )
                    .font(.custom(Poppins.Regular, size: 14))
                    .frame(height: 44)
                    .textInputAutocapitalization(.words)
                    .padding([.leading, .trailing], 14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.theme.customGray, lineWidth: 1)
                    )
                    Button {
                        
                    } label: {
                        Image("Minus")
                    }
                    .padding(.trailing, 18)
                }
                
                HStack {
                    Button {
                        
                    } label: {
                        Image("Plus")
                    }
                    .padding(.trailing, 12)
                    Text("Add new Ingridient")
                        .font(.custom(Poppins.SemiBold, size: 16))
                    Spacer()
                }
                .padding(.leading, 16)
                
                GeometryReader { geometry in
                    Button(action: {
                        
                    }) {
                        Text("Greate recipe")
                            .font(.custom(Poppins.SemiBold, size: 16))
                            .foregroundColor(.white)
                        
                            .frame(width: geometry.size.width - 32, height: 56)
                            .background(Color.theme.customPink)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
    }
    func changeRecipePhoto() {
        print("Tap change photo recipe")
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
