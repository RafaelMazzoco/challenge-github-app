//
//  EmptyView.swift
//  GitHubApp
//
//  Created by Gustavo Rocha on 20/01/22.
//

import UIKit

final class EmptyView: UIView {

    // MARK: Properties
    private lazy var stackLabels: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.spacing = 15
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var viewTitle: UIView = {
        builderView()
    }()
    
    private lazy var labelTitle: UILabel = {
        builderLabel()
    }()
    
    private lazy var viewSubtitle: UIView = {
        builderView()
    }()
    
    private lazy var labelSubtitle: UILabel = {
        builderLabel()
    }()
    
    // MARK: Initialization
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setupUI() {
        backgroundColor = .green
        addSubview(stackLabels)
        stackLabels.addArrangedSubview(viewTitle)
        stackLabels.addArrangedSubview(viewSubtitle)
        viewTitle.addSubview(labelTitle)
        viewSubtitle.addSubview(labelSubtitle)
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackLabels.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackLabels.leftAnchor.constraint(equalTo: readableContentGuide.leftAnchor, constant: 10).isActive = true
        stackLabels.rightAnchor.constraint(equalTo: readableContentGuide.rightAnchor, constant: -10).isActive = true
        
        labelTitle.topAnchor.constraint(equalTo: viewTitle.topAnchor).isActive = true
        labelTitle.leftAnchor.constraint(equalTo: viewTitle.readableContentGuide.leftAnchor).isActive = true
        labelTitle.rightAnchor.constraint(equalTo: viewTitle.readableContentGuide.rightAnchor).isActive = true
        labelTitle.bottomAnchor.constraint(equalTo: viewTitle.bottomAnchor).isActive = true
        
        labelSubtitle.topAnchor.constraint(equalTo: viewSubtitle.topAnchor).isActive = true
        labelSubtitle.leftAnchor.constraint(equalTo: viewSubtitle.readableContentGuide.leftAnchor).isActive = true
        labelSubtitle.rightAnchor.constraint(equalTo: viewSubtitle.readableContentGuide.rightAnchor).isActive = true
        labelSubtitle.bottomAnchor.constraint(equalTo: viewSubtitle.bottomAnchor).isActive = true
    }
    
    func updateView(with configuration: EmptyViewConfiguration) {
        labelTitle.text = configuration.title
        labelSubtitle.text = configuration.subTitle
    }
    
    private func builderView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func builderLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label
    }
}
