//
//  ViewController.swift
//  PSA
//
//  Created by syrine methlouthi on 29/06/2023.
//

import UIKit

class ViewController: UIViewController, Storyboarded {


    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var cityWeatherListTableView: UITableView!
    
    var viewModel = CityListViewModel()
    var coordinator: AppRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.searchButton.titleLabel?.text = ""
        self.setupTableView()
    }

    @IBAction func searchButton(_ sender: Any) {
        guard let text = searchText.text else {
            return
        }
        viewModel.fetchCiyWeatherData(cityName: text)
    }
    
    
    private func setupTableView() {
        

        cityWeatherListTableView.backgroundView?.isUserInteractionEnabled = true
        cityWeatherListTableView.backgroundView?.isHidden = false

        viewModel.reloadUI = { [weak self] in
            self?.cityWeatherListTableView.reloadData()
            let emptyResultsViewIsHidden = !((self?.viewModel.cityWeatherListArray.count ?? 0) == 0)
            self?.cityWeatherListTableView.backgroundView?.isHidden = emptyResultsViewIsHidden
            
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityListTableViewCell", for: indexPath) as? CityListTableViewCell

            cell?.configure(for: viewModel.cityWeatherListArray[indexPath.row])
        return cell ?? CityListTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.cityWeatherListArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.presentDetailFor(cityWeather: viewModel.cityWeatherListArray[indexPath.row])
    }
}

    
