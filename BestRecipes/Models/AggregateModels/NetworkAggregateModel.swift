import Foundation
import Combine

@MainActor
class NetworkAggregateModel: ObservableObject {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    @Published var alert: HTTPError = .unknown
    @Published var showAlertInView: Bool = false
    
    @Published var recipeInformation: RecipeFull?
    
    @Published var shortRecipeListTrendingNow: [RecipeShort] = []
    @Published var shortRecipeListPopularCategory: [RecipeShort] = []
    @Published var shortRecipeListGeneral: [RecipeShort] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func searchRecipeShort(params: [String: Any]? = nil, requestTag: RequestTag) {
        networkService.request(RecipeEndpoint.searchRecipe(params))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.alert = error
                    self?.showAlertInView = true
                }
            }, receiveValue: { [weak self] (shortRecipeList: ListOfRecipeShort) in
                switch requestTag {
                case .trendingNow:
                    self?.shortRecipeListTrendingNow = shortRecipeList.results ?? []
                case .popularCategory:
                    self?.shortRecipeListPopularCategory = shortRecipeList.results ?? []
                case .general:
                    self?.shortRecipeListGeneral = shortRecipeList.results ?? []
                }
            })
            .store(in: &cancellables)
    }
    
    func getRecipeById(id: String) {
        networkService.request(RecipeEndpoint.getRecipeByID(id: id))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.alert = error
                    self?.showAlertInView = true
                }
            }, receiveValue: { [weak self] (recipeDetail: RecipeFull) in
                self?.recipeInformation = recipeDetail
            })
            .store(in: &cancellables)
    }
}
