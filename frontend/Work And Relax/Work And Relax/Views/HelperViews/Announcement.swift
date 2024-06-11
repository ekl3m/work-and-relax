import SwiftUI

struct Announcement: Identifiable, Codable {
    var id: Int64
    var title: String
    var description: String
    var photo: String
    
    // Zmiana nazw kluczy dla zgodności z JSON
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case photo
    }
}

struct AnnouncementView: View {
    var announcement: Announcement
    var onSelect: (Color, Color) -> Void
    @State private var dominantColor: Color = .gray
    @State private var textColor: Color = .white

    var body: some View {
        VStack(alignment: .leading) {
            if let url = URL(string: announcement.photo) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        Color.gray
                            .frame(height: 200)
                            .overlay(
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                            )
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                            .shadow(radius: 5)
                            .onAppear {
                                image.getDominantColor { color in
                                    dominantColor = color
                                    textColor = color.contrastingColor()
                                }
                            }
                    case .failure:
                        Color.red
                            .frame(height: 200)
                            .overlay(
                                VStack {
                                    Image(systemName: "exclamationmark.triangle")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                    Text("Nie udało się załadować obrazu")
                                        .foregroundColor(.white)
                                }
                            )
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Text("Nieprawidłowy URL: \(announcement.photo)")
                    .font(.caption)
                    .foregroundColor(.red)
                Color.red
                    .frame(height: 200)
                    .overlay(
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    )
            }

            Text(announcement.title)
                .font(.system(size: 25, weight: .bold, design: .default))
                .padding(.top, 5)
                .foregroundColor(textColor)

            Text(announcement.description)
                .font(.body)
                .lineLimit(1)
                .padding(.top, 1)
                .foregroundColor(textColor)
        }
        .padding()
        .background(dominantColor)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        .contentShape(Rectangle())  // Ensure the entire area is tappable
        .onTapGesture {
            onSelect(dominantColor, textColor)
        }
    }
}

struct AnnouncementDetailView: View {
    var announcement: Announcement
    var dominantColor: Color
    var textColor: Color
    var goBack: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("Ogłoszenie")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(textColor.darker(by: 50))
                    .padding(.top, 10)
                    .padding(.leading, 25)
                Spacer()
                Button(action: goBack) {
                    Image(systemName: "xmark")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(textColor.darker(by: 50))
                        .padding()
                }
                .padding(.top, 10)
//                .padding(.leading, 10)
            }
            .padding(.vertical, -10)
            
            ScrollView {
                VStack(alignment: .leading) {
                    if let url = URL(string: announcement.photo) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                Color.gray
                                    .frame(height: 300)
                                    .overlay(
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle())
                                    )
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: 500, maxHeight: 900)
                                    .clipped()
                                    .shadow(radius: 5)
                            case .failure:
                                Color.red
                                    .frame(height: 300)
                                    .overlay(
                                        VStack {
                                            Image(systemName: "exclamationmark.triangle")
                                                .foregroundColor(.white)
                                                .font(.largeTitle)
                                            Text("Nie udało się załadować obrazu")
                                                .foregroundColor(.white)
                                        }
                                    )
                            @unknown default:
                                EmptyView()
                            }
                        }
                    } else {
                        Text("Nieprawidłowy URL: \(announcement.photo)")
                            .font(.caption)
                            .foregroundColor(.red)
                        Color.red
                            .frame(height: 300)
                            .overlay(
                                Image(systemName: "exclamationmark.triangle")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            )
                    }

                    Text(announcement.title)
                        .font(.system(size: 35, weight: .bold, design: .default))
                        .padding(.top, 5)
                        .foregroundColor(textColor)

                    Text(announcement.description)
                        .font(.body)
                        .padding(.top, 10)
                        .foregroundColor(textColor)
                }
                .padding()
            }
            .background(dominantColor)
            
            Rectangle()
                .frame(height: 20)
                .foregroundColor(dominantColor)
                .padding(.top, -10)
        }
        .background(dominantColor.darker(by: 20))
        .frame(maxWidth: 600, maxHeight: 700)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        .padding(.top, 100)
    }
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView(
            announcement: Announcement(
                id: Int64(1),
                title: "Przykładowe ogłoszenie",
                description: "Opis przykładowego ogłoszenia, które jest bardzo interesujące.",
                photo: "https://i.imgur.com/fk3bVFl.jpg"
            ),
            onSelect: {_, _ in }
        )
    }
}

