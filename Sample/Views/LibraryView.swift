/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that lists the books available in the library.
*/

import SwiftUI

struct LibraryView: View {
    //@Environment(Library.self) private var library
    @State private var library = Library()
    
    var body: some View {
        List(library.books) { book in
            BookView(book: book)
        }
        
        Text("\(library.texto)")
        Button {
            library.getData()
        } label: {
            Text("Get Data from remote api")
        }

    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environment(Library())
    }
}
