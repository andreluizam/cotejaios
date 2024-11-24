import Foundation

class QuoteAPIService {
    func getQuote() async -> Usdbrl? {
        let url = URL(string: "https://economia.awesomeapi.com.br/json/last/USD-BRL")!
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedResponse = try JSONDecoder().decode(Quote.self, from: data)
            
            return decodedResponse.usdbrl
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}
