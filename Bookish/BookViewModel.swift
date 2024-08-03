import Foundation

class BookViewModel: ObservableObject {
    @Published var books: [Book] = []
    @Published var isDevMode: Bool = true

    init() {
        loadBooks()
    }

    func loadBooks() {
        if isDevMode {
            books = [
                Book(title: "Pride and Prejudice", author: "Jane Austen", filePath: Bundle.main.path(forResource: "pride_and_prejudice", ofType: "epub") ?? ""),
                Book(title: "The Adventures of Sherlock Holmes", author: "Arthur Conan Doyle", filePath: Bundle.main.path(forResource: "sherlock_holmes", ofType: "epub") ?? ""),
                Book(title: "Moby-Dick", author: "Herman Melville", filePath: Bundle.main.path(forResource: "moby_dick", ofType: "epub") ?? "")
            ]
        } else {
            // Load fewer or different books in non-dev mode if needed
            books = [
                Book(title: "Pride and Prejudice", author: "Jane Austen", filePath: Bundle.main.path(forResource: "pride_and_prejudice", ofType: "epub") ?? "")
            ]
        }
    }

    func toggleDevMode() {
        isDevMode.toggle()
        loadBooks()
    }
}