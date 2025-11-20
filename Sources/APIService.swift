import Foundation

// Simple API service abstraction. Currently uses local JSON file via MockHTTPClient.
protocol APIServiceProtocol {
    func fetchMenu(completion: @escaping (Result<[Dish], Error>) -> Void)
}

class MockAPIService: APIServiceProtocol {
    func fetchMenu(completion: @escaping (Result<[Dish], Error>) -> Void) {
        // Load local sample-menu.json from bundle asynchronously to simulate network
        DispatchQueue.global().async {
            guard let url = Bundle.main.url(forResource: "sample-menu", withExtension: "json") else {
                DispatchQueue.main.async { completion(.failure(NSError(domain: "MockAPI", code: 404, userInfo: nil))) }
                return
            }
            do {
                let data = try Data(contentsOf: url)
                let resp = try JSONDecoder().decode(MenuResponse.self, from: data)
                DispatchQueue.main.async { completion(.success(resp.dishes)) }
            } catch {
                DispatchQueue.main.async { completion(.failure(error)) }
            }
        }
    }
}
