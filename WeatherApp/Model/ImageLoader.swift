import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
    //MARK: - PROPERTIES
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    //MARK: - INIT
    init(urlString:String) {
        let newUrl = "http:"+urlString
        guard let url = URL(string: newUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
