//
//  OnboardingViewController.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/5/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPage = 0 {
        didSet{
            pageControl.currentPage  = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    var slides : [OnboardingSlides] = [
        OnboardingSlides(title: "Delicious Dishes", description: "Experience variety of amazing dishes from different cultures  around the world.", image: UIImage(named: "slide2")!),
        OnboardingSlides(title: "World-Class Chefs", description: "Our dishes are prepared only the best.", image: UIImage(named: "slide1")!),
        OnboardingSlides(title: "Instant worldwide delivery", description: "Your order will be ordered instantly irrespective of your location around the world.", image: UIImage(named: "slide3")!),
            
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1{
			let vc = storyboard?.instantiateViewController(withIdentifier: LoginViewController.controllerIdentifier) as! LoginViewController
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle  = .flipHorizontal
            present(vc,animated: true,completion: nil)
        }else {
            currentPage += 1
            let indexPath =  IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (slides.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setUp(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
//    call me when scrolling ends
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
   
}
