//
//  WelcomeViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 이승준 on 10/11/25.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    var name: String? = nil
    let num: String = "🖤"
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "logo2")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 110, y: 295, width: 150, height: 60))
        label.text = "???님 \n반가워요!"
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(goHomeButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(WelcomeViewController.self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func loadView() { super.loadView()
        print("\(num) 🍎 \(#function)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setLayout()
        bindID()
        print("\(num) 🍊 \(#function)")
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(true)
        print("\(num) 🍋 \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(true)
        print("\(num) 🍐 \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(true)
        print("\(num) 🍏 \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) { super.viewDidDisappear(true)
        print("\(num) 🫐 \(#function)")
    }
    
    deinit {
        print("\(num) 🍇 \(#function)")
    }
    
    @objc
    private func goHomeButtonDidTap() {
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func bindID() {
        if let name = name, name != "" {
            self.welcomeLabel.text = "\(name) 님 \n반가워요!"
        } else {
            self.welcomeLabel.text = "\(num) 환영합니다!"
        }
    }
}

#Preview {
    WelcomeViewController()
}
