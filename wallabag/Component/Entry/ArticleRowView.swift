//
//  ArticleRowView.swift
//  wallabag
//
//  Created by Marinel Maxime on 17/07/2019.
//

import SwiftUI

struct ArticleRowView: View {
    var entry: Entry

    var body: some View {
        HStack {
            NetworkImage(imageURL: entry.previewPicture?.url, placeholderImage: UIImage(systemName: "book")!)
                .frame(width: 50, height: 50, alignment: .center)
            VStack(alignment: .leading) {
                Text(entry.title ?? "")
                    .font(.headline)
                Text("Reading time")
                    .font(.footnote)
                HStack {
                    Image(systemName: entry.isArchived ? "book.fill" : "book")
                    Image(systemName: entry.isStarred ? "star.fill" : "star")
                    Text(entry.domainName ?? "")
                        .font(.footnote)
                }
            }
        }
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(entry: Entry()).previewLayout(.fixed(width: 300, height: 70))
    }
}
