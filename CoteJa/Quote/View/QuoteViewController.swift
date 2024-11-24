
import UIKit
import Foundation

class ViewController: UIViewController {
    
    let titleApp: UILabel = {
        let title = UILabel()
        title.text = "Cote Já"
        title.font = UIFont.systemFont(ofSize: 58, weight: .bold)
        title.textColor = UIColor(
            red: 46.0 / 255.0,
            green: 204.0 / 255.0,
            blue: 113.0 / 255.0,
            alpha: 1.0
        )
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let subTitleApp: UILabel = {
        let subTitle = UILabel()
        subTitle.text = "os fechamentos não constam aos sábados"
        subTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        subTitle.textColor = UIColor(
            red: 46.0 / 255.0,
            green: 204.0 / 255.0,
            blue: 113.0 / 255.0,
            alpha: 1.0
        )
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        return subTitle
    }()
    
    let currentCurrency: UILabel = {
        let currentCurrency = UILabel()
        //currentCurrency.text = "USD R$5,78"
        currentCurrency.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        currentCurrency.textColor = UIColor(
            red: 46.0 / 255.0,
            green: 204.0 / 255.0,
            blue: 113.0 / 255.0,
            alpha: 1.0
        )
        currentCurrency.translatesAutoresizingMaskIntoConstraints = false
        return currentCurrency
    }()
    
    let squareFrameCountries: UIView = {
        let squareFrame = UIView()
        squareFrame.backgroundColor = UIColor(
            red: 28.0 / 255.0,
            green: 28.0 / 255.0,
            blue: 28.0 / 255.0,
            alpha: 1.0
        )
        squareFrame.layer.borderColor = UIColor(
            red: 58.0 / 255.0,
            green: 58.0 / 255.0,
            blue: 58.0 / 255.0,
            alpha: 1.0
        ).cgColor
        squareFrame.layer.borderWidth = 1
        squareFrame.translatesAutoresizingMaskIntoConstraints = false
        squareFrame.layer.cornerRadius = 10
        return squareFrame
    }()
    
    let squareFrameGraph: UIView = {
        let squareGraph = UIView()
        squareGraph.backgroundColor = UIColor(
            red: 28.0 / 255.0,
            green: 28.0 / 255.0,
            blue: 28.0 / 255.0,
            alpha: 1.0
        )
        
        squareGraph.layer.borderColor = UIColor(
            red: 58.0 / 255.0,
            green: 58.0 / 255.0,
            blue: 58.0 / 255.0,
            alpha: 1.0
        ).cgColor
        
        squareGraph.layer.borderWidth = 1
        squareGraph.translatesAutoresizingMaskIntoConstraints = false
        squareGraph.layer.cornerRadius = 10
        return squareGraph
    }()
    
    let button5Days: UIButton = {
        let button = UIButton()
        button.setTitle("5 Dias", for: .normal)
        button.backgroundColor = UIColor(
            red: 46.0 / 255.0,
            green: 204.0 / 255.0,
            blue: 113.0 / 255.0,
            alpha: 1.0
        )
        button.layer.cornerRadius = 20
        button.tag = 5
        button.addTarget(self, action: #selector(quote), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let button15Days: UIButton = {
        let button = UIButton()
        button.setTitle("15 Dias", for: .normal)
        button.backgroundColor = UIColor(
            red: 46.0 / 255.0,
            green: 204.0 / 255.0,
            blue: 113.0 / 255.0,
            alpha: 1.0
        )
        button.layer.cornerRadius = 20
        button.tag = 15
        button.addTarget(self, action: #selector(quote), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let button30Days: UIButton = {
        let button = UIButton()
        button.setTitle("30 Dias", for: .normal)
        button.backgroundColor = UIColor(
            red: 46.0 / 255.0,
            green: 204.0 / 255.0,
            blue: 113.0 / 255.0,
            alpha: 1.0
        )
        button.layer.cornerRadius = 20
        button.tag = 30
        button.addTarget(self, action: #selector(quote), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var viewModel : QuoteViewModel! {
        didSet{
            viewModel.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(
            red: 10.0 / 255.0,
            green: 10.0 / 255.0,
            blue: 10.0 / 255.0,
            alpha: 1.0
        )
        
        
        
        view.addSubview(titleApp)
        view.addSubview(subTitleApp)
        view.addSubview(squareFrameCountries)
        view.addSubview(squareFrameGraph)
        view.addSubview(currentCurrency)
        
        let buttonStackView = UIStackView(arrangedSubviews: [button5Days, button15Days, button30Days])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 10
        buttonStackView.distribution = .fillEqually
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        squareFrameGraph.addSubview(buttonStackView)
        
        let titleAppConstraints = [
            titleApp.heightAnchor.constraint(equalToConstant: 100),
            titleApp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleApp.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
        ]
        
        let subTitleConstraints = [
            subTitleApp.heightAnchor.constraint(equalToConstant: 30),
            subTitleApp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subTitleApp.topAnchor.constraint(equalTo: titleApp.bottomAnchor)
        ]
        
        let currentCurrencyConstraints = [
            currentCurrency.heightAnchor.constraint(equalToConstant: 30),
            currentCurrency.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentCurrency.topAnchor.constraint(equalTo: squareFrameGraph.bottomAnchor, constant: 10)
        ]
        
        let squareCountriesConstraints = [
            squareFrameCountries.heightAnchor.constraint(equalToConstant: 80),
            squareFrameCountries.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            squareFrameCountries.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            squareFrameCountries.topAnchor.constraint(equalTo: subTitleApp.bottomAnchor, constant: 50)
        ]
        
        let squareGraphConstraints = [
            squareFrameGraph.heightAnchor.constraint(equalToConstant: 350),
            squareFrameGraph.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            squareFrameGraph.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            squareFrameGraph.topAnchor.constraint(equalTo: squareFrameCountries.bottomAnchor, constant: 10)
        ]
        
        let buttonStackViewConstraints = [
            buttonStackView.topAnchor.constraint(equalTo: squareFrameGraph.topAnchor, constant: 10),
            buttonStackView.centerXAnchor.constraint(equalTo: squareFrameGraph.centerXAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: squareFrameGraph.widthAnchor, multiplier: 0.9),
            buttonStackView.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(titleAppConstraints)
        NSLayoutConstraint.activate(subTitleConstraints)
        NSLayoutConstraint.activate(squareCountriesConstraints)
        NSLayoutConstraint.activate(squareGraphConstraints)
        NSLayoutConstraint.activate(currentCurrencyConstraints)
        NSLayoutConstraint.activate(buttonStackViewConstraints)
    }
    
    @objc func quote(_ send: UIButton){
        let days = Int(send.tag)
        
        viewModel.cotar(days: days)
    }
}

extension ViewController: QuoteViewModelDelegate {
    func viewDidSet() {
        guard let currency = viewModel.actualyCurrency else { return }
       
        DispatchQueue.main.async {
            let askDouble = Double(currency.ask) ?? 0.0
            let askRoundedString = String(format: "%.2f", askDouble)
            
            self.currentCurrency.text =  "\(currency.code) R$\(askRoundedString)"
         }
    }
}
