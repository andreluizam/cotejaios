protocol QuoteViewModelDelegate{
    func viewDidSet()
}

class QuoteViewModel {
   
    var delegate : QuoteViewModelDelegate?
    
    var actualyCurrency : Usdbrl? {
        didSet {
            delegate?.viewDidSet()
        }
    }
    
    func cotar(days: Int){
        Task {
            let service = QuoteAPIService()
            if let usdbrl = await service.getQuote() {
                print("Code: \(usdbrl.code)")
                print("Name: \(usdbrl.name)")
                print("High: \(usdbrl.high)")
                print("Low: \(usdbrl.low)")
                print("Bid: \(usdbrl.bid)")
                print("Ask: \(usdbrl.ask)")
                
                self.actualyCurrency = usdbrl
            } else {
                print("Failed to fetch quote")
                self.actualyCurrency = nil
            }
        }
    }
}
