//
//  WatchTimerCell.swift
//  C7FIT
//
//  Created by Michael Lee on 4/2/17.
//  Copyright © 2017 Brandon Lee. All rights reserved.
//

import UIKit

class WatchTimerCell: UITableViewCell {

    // MARK: - Properties

    var timeLabel = UILabel()
    var minuteLabel = UILabel()
    var colonLabel = UILabel()
    var secondLabel = UILabel()
    var dotLabel = UILabel()
    var msLabel = UILabel()

    // MARK: - Initialization

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout

    func setup() {
        let fontSize: CGFloat = 70.0
        minuteLabel.text = "00"
        minuteLabel.font = minuteLabel.font.withSize(fontSize)

        colonLabel.text = ":"
        colonLabel.font = colonLabel.font.withSize(fontSize)

        secondLabel.text = "00"
        secondLabel.font = secondLabel.font.withSize(fontSize)

        dotLabel.text = "."
        dotLabel.font = dotLabel.font.withSize(fontSize)

        msLabel.text = "00"
        msLabel.font = msLabel.font.withSize(fontSize)

        self.addSubview(minuteLabel)
        self.addSubview(secondLabel)
        self.addSubview(msLabel)
        self.addSubview(colonLabel)
        self.addSubview(dotLabel)
    }

    func setupConstraints() {
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        let centerSecondX = secondLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        let centerSecondY = secondLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        NSLayoutConstraint.activate([centerSecondX, centerSecondY])

        colonLabel.translatesAutoresizingMaskIntoConstraints = false
        let rightColon = colonLabel.rightAnchor.constraint(equalTo: secondLabel.leftAnchor)
        let centerColonY = colonLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        NSLayoutConstraint.activate([rightColon, centerColonY])

        minuteLabel.translatesAutoresizingMaskIntoConstraints = false
        let rightMin = minuteLabel.rightAnchor.constraint(equalTo: colonLabel.leftAnchor)
        let centerMinY = minuteLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        NSLayoutConstraint.activate([rightMin, centerMinY])

        dotLabel.translatesAutoresizingMaskIntoConstraints = false
        let leftDot = dotLabel.leftAnchor.constraint(equalTo: secondLabel.rightAnchor)
        let centerDotY = dotLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        NSLayoutConstraint.activate([leftDot, centerDotY])

        msLabel.translatesAutoresizingMaskIntoConstraints = false
        let leftMs = msLabel.leftAnchor.constraint(equalTo: dotLabel.rightAnchor)
        let centerMsY = msLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        NSLayoutConstraint.activate([leftMs, centerMsY])
    }

    func changeTime(min: String, sec: String, mils: String) {
        self.minuteLabel.text = min
        self.secondLabel.text = sec
        self.msLabel.text = mils
    }

}
