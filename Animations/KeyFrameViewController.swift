import UIKit

class KeyFrameViewController: UIViewController {
    
    private let animatedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemIndigo
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        launchAnimationExample()
    }
    
    private func setupView() {
        title = "Key Frame"
        view.backgroundColor = .systemYellow
        
        tabBarItem = UITabBarItem(
            title: "Key Frame", image: UIImage(systemName: "display.2"), tag: 1
        )
    }
    
    private func setupSubviews() {
        view.addSubview(animatedView)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            animatedView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 50.0),
            animatedView.widthAnchor.constraint(equalToConstant: 100.0),
            animatedView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 50.0),
            animatedView.heightAnchor.constraint(equalToConstant: 100.0)
        ])
    }
    
    private func launchAnimationExample() {
        
        let centerOrigin = animatedView.center
        
        UIView.animateKeyframes(withDuration: 5.0, delay: 1.0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.animatedView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.animatedView.center = CGPoint(
                    x: self.view.bounds.midX,
                    y: self.view.bounds.maxY - self.animatedView.frame.height
                )
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.animatedView.center = CGPoint(x: self.view.bounds.width - self.animatedView.frame.width, y: centerOrigin.y)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.animatedView.center = centerOrigin
                self.animatedView.transform = CGAffineTransform.identity
            }
        },
        completion: { finished in
            print("Did finish KeyFrame example")
        })
    }

}
