import UIKit
import AVFoundation

protocol MotivationalQuoteCellProtocol {
    var audioUrl: URL? { get set }
    func togglePlayback()
}

class QuoteCell: UICollectionViewCell {

    let quoteLabel = UILabel()
    let coverPhotoImageView = C7FUIImageView()
    fileprivate var _audioPlayer: AVAudioPlayer?

    override init(frame: CGRect) {
        super.init(frame: frame)

        quoteLabel.text = "Life is like a box of chocolates"
        quoteLabel.textColor = .white
        quoteLabel.textAlignment = .left
        quoteLabel.font = UIFont.systemFont(ofSize: 32)
        quoteLabel.lineBreakMode = .byWordWrapping
        quoteLabel.numberOfLines = 0
        
        coverPhotoImageView.image = #imageLiteral(resourceName: "quoteBackground")
        coverPhotoImageView.contentMode = .scaleAspectFill
        coverPhotoImageView.frame = contentView.bounds

        contentView.insertSubview(quoteLabel, at: 1)
        contentView.insertSubview(coverPhotoImageView, at: 0)
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        quoteLabel.frame = contentView.layoutMarginsGuide.layoutFrame
    }

}

extension QuoteCell: MotivationalQuoteCellProtocol {
    var audioUrl: URL? {
        get {
            return _audioPlayer?.url
        } set (maybeUrl) {
            if let url = maybeUrl {
                do {
                    _audioPlayer = try AVAudioPlayer(contentsOf: url)
                    _audioPlayer?.prepareToPlay()
                } catch {
                    print("error initializing audioplayer with new url: \(url)")
                }
            }
        }
    }

    func togglePlayback() {
        if let playing = _audioPlayer?.isPlaying {
            if playing {
                _audioPlayer?.pause()
            } else {
                _audioPlayer?.play()
            }
        }
    }
}
