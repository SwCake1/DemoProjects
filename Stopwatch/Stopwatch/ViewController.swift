//
//  ViewController.swift
//  Stopwatch
//
//  Created by pennyworth on 9/17/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time = 0.0
    var timer = Timer()
    var timerIsActive = false
    var numLaps = 0
    
    let timerContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00:00"
        label.font = UIFont.systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currentLapTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00:00"
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let resetLapButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Lap", for: .normal)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let startStopButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.green, for: .normal)
        button.setTitle("Start", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let lapsContainerView: UIView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lapsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        startStopButton.addTarget(self, action: #selector(startStopAction), for: .touchUpInside)
        resetLapButton.addTarget(self, action: #selector(resetLapAction), for: .touchUpInside)
    }

    func setupView() {
        view.backgroundColor = .white
        
        self.navigationItem.title = "Stopwatch"
        
        setupTimerView()
        
        setupButtonsView()
        
        setupLapsView()
    }
    
    func setupTimerView() {
        view.addSubview(timerContainerView)
        timerContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerContainerView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        timerContainerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        timerContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        timerContainerView.addSubview(timeLabel)
        timeLabel.centerXAnchor.constraint(equalTo: timerContainerView.centerXAnchor).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: timerContainerView.centerYAnchor, constant: 10).isActive = true
                
        timerContainerView.addSubview(currentLapTimeLabel)
        currentLapTimeLabel.centerXAnchor.constraint(equalTo: timerContainerView.centerXAnchor).isActive = true
        currentLapTimeLabel.widthAnchor.constraint(equalTo: timeLabel.widthAnchor).isActive = true
        currentLapTimeLabel.bottomAnchor.constraint(equalTo: timeLabel.topAnchor).isActive = true
        currentLapTimeLabel.textAlignment = .right
    }
    
    func setupButtonsView() {
        view.addSubview(buttonsContainerView)
        buttonsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsContainerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        buttonsContainerView.topAnchor.constraint(equalTo: timerContainerView.bottomAnchor).isActive = true
        buttonsContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
        buttonsContainerView.addSubview(resetLapButton)
        resetLapButton.centerXAnchor.constraint(equalTo: buttonsContainerView.centerXAnchor, constant: -70).isActive = true
        resetLapButton.centerYAnchor.constraint(equalTo: buttonsContainerView.centerYAnchor).isActive = true
        resetLapButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        resetLapButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        buttonsContainerView.addSubview(startStopButton)
        startStopButton.centerXAnchor.constraint(equalTo: buttonsContainerView.centerXAnchor, constant: 70).isActive = true
        startStopButton.centerYAnchor.constraint(equalTo: buttonsContainerView.centerYAnchor).isActive = true
        startStopButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        startStopButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupLapsView() {
        view.addSubview(lapsTableView)
        lapsTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lapsTableView.topAnchor.constraint(equalTo: buttonsContainerView.bottomAnchor).isActive = true
        lapsTableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        lapsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    @objc func startStopAction(sender: UIButton!) {
        
        if timerIsActive == false {
            startTimer()
        } else {
            stopTimer()
        }
    }
    
    @objc func resetLapAction(sender: UIButton!) {
        
        if timerIsActive == false {
            resetTimer()
        } else {
            nextLap()
        }
    }
    
    func startTimer() {
        resetLapButton.isEnabled = true
        startStopButton.setTitleColor(.red, for: .normal)
        resetLapButton.setTitle("Lap", for: .normal)
        startStopButton.setTitle("Stop", for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        timerIsActive = true
    }
    
    func stopTimer() {
        timer.invalidate()
        startStopButton.setTitle("Start", for: .normal)
        startStopButton.setTitleColor(.green, for: .normal)
        resetLapButton.setTitle("Reset", for: .normal)
        timerIsActive = false
    }
    
    func resetTimer() {
        currentLapTimeLabel.text = "00:00:00"
        timeLabel.text = "00:00:00"
    }
    
    func nextLap() {
        
        numLaps += 1

//        lapsTableView.insertRows(at: [IndexPath(row: row, section: section)], with: .none)
    }
    
    @objc func UpdateTimer() {
        time = time + 0.1
        let minutes = Int(time) / 6000
        let seconds = Int(time) / 100 % 60
        let ms = Int(time) % 100
        
        currentLapTimeLabel.text = String(format:"%02i:%02i:%02i", minutes, seconds, ms)
        timeLabel.text = currentLapTimeLabel.text
    }
}

