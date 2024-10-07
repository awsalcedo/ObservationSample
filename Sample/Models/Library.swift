/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A observable data model for a library that contains books.
*/

import SwiftUI

@Observable final class Library {
    let useCase: UseCaseProtocol
    var books: [Book] = [Book(), Book(), Book()]
    var texto: String = ""
    
    init(useCase: UseCaseProtocol = UseCase()) {
        self.useCase = useCase
    }
    
    func getData() {
        texto = useCase.getData()
    }
}

struct UseCase: UseCaseProtocol {
    let repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol = Repository(dataSource: RemoteDataSource(api: Api()))) {
        self.repository = repository
    }
    
    func getData() -> String {
        return repository.getData()
    }
    
    
}

protocol UseCaseProtocol {
    func getData() -> String
}

struct Repository: RepositoryProtocol {
    
    let dataSource: RemoteDataSourceProtocol
    
    init(dataSource: RemoteDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func getData() -> String {
        return dataSource.getData()
    }
    
}

protocol RepositoryProtocol {
    func getData() -> String
}

struct RemoteDataSource: RemoteDataSourceProtocol {
    let api: ApiProtocol
    
    init(api: ApiProtocol) {
        self.api = api
    }
    
    func getData() -> String {
        return api.getRequest()
    }
    
    
}

protocol RemoteDataSourceProtocol {
    func getData() -> String
}

struct Api: ApiProtocol {
    func getRequest() -> String {
        return "Obtuve la data desde el api remota"
    }
    
    
}

protocol ApiProtocol {
    func getRequest() -> String
}
