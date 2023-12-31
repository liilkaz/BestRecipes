import SwiftUI

struct Tabbar: View {
    
    @StateObject var tabbarRouter = TabbarRouter()
    @State var isShowPopUp = false
    @State private var inputImage: UIImage?
    @State var inputImageForRecipe: UIImage?

//    @State private var selectedRecipe: MyRecipes?
    
    @ViewBuilder
    var contentView: some View {
        switch tabbarRouter.currentPage {
        case .home:
            MainHomeView()
                .environmentObject(tabbarRouter)
        case .favourites:
            SavedRecipesView()
                .environmentObject(tabbarRouter)
        case .news:
            VStack(alignment: .center) {
                Text("You don't have any new notifications.")
                    .font(.custom(Poppins.SemiBold, size: 24))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }
                .environmentObject(tabbarRouter)
        case .profile:
            ProfileView(inputImage: $inputImage)
//                        selectedRecipe: $selectedRecipe)
                .environmentObject(tabbarRouter)
        case .add:
            AddRecipeView(inputImageForRecipe: $inputImageForRecipe)
                .environmentObject(tabbarRouter)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                contentView
                VStack {
                    Spacer()
                    HStack {
                        TabItem(width: geometry.size.width / 5, height: geometry.size.height / 18, iconName: "home", tabbarRouter: tabbarRouter, assignedPage: .home)
                        TabItem(width: geometry.size.width / 5, height: geometry.size.height / 18, iconName: "save", tabbarRouter: tabbarRouter, assignedPage: .favourites)
                        TabPlusButton(width: geometry.size.width / 7, height: geometry.size.width / 7, acttion: showPopUp)
                            .offset(y: -geometry.size.height / 18)
                        TabItem(width: geometry.size.width / 5, height: geometry.size.height / 18, iconName: "call", tabbarRouter: tabbarRouter, assignedPage: .news)
                        TabItem(width: geometry.size.width / 5, height: geometry.size.height / 18, iconName: "user", tabbarRouter: tabbarRouter, assignedPage: .profile)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 8)
                    .background(TabbarCurvedShape(radius: geometry.size.width / 12, height: geometry.size.height / 8))
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .sheet(isPresented: $isShowPopUp) {
            // action on dismiss
        } content: {
            AddRecipeView(inputImageForRecipe: $inputImageForRecipe)
        }
    }
    
    func showPopUp() {
        isShowPopUp = true
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
