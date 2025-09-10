import SwiftUI

struct Guitarist: Identifiable {
    let id = UUID()
    let rank: Int
    let name: String
    let description: String
    let imageName: String
    let link: String
}

struct ContentView: View {
    @State private var guitarists: [Guitarist] = [
        Guitarist(rank: 1,
                  name: "Eddie Van Halen",
                  description: "Eddie played in the band Van Halen, and made many techinqiues on guitar that werent used at the time. Heavily influential for his time.",
                  imageName: "evh",
                  link: "https://www.youtube.com/watch?v=A2I0a7EwWa8&list=RDA2I0a7EwWa8&start_radio=1"),
        
        Guitarist(rank: 2,
                  name: "Marty Friedman",
                  description: "Was lead guitar in Megadeth before leaving to pursue other musical interests. His solos and scales are so techincal, unique and influential.",
                  imageName: "friedman",
                  link: "https://www.youtube.com/watch?v=4Ay5CUjBdBE&list=RD4Ay5CUjBdBE&start_radio=1"),
        
        Guitarist(rank: 3,
                  name: "Nuno Bettencourt",
                  description: "Guitarist in the band Extreme. He plays more funk inspired guitar, with a style similar to Eddie Van Halens. He blended.",
                  imageName: "nuno",
                  link: "https://www.youtube.com/shorts/cLwyahLYkcM?feature=share"),
        
        Guitarist(rank: 4,
                  name: "Synyster Gates",
                  description: "Lead guitarist for the band Avenged Sevenfold. Very good at incorporating speed, harmonies and more blues inspired licks.",
                  imageName: "syn",
                  link: "https://www.youtube.com/watch?v=VoJUG9_et3Y&list=RDVoJUG9_et3Y&start_radio=1"),
        
        Guitarist(rank: 5,
                  name: "Randy Rhoads",
                  description: "Mainly known for playing for Ozzy Osbourne, also played in Quiet Riot. Made an immense impact on the world of guitar playing before his death, hes certainly one of the most celebrated.",
                  imageName: "rhoads",
                  link: "https://www.youtube.com/watch?v=XnuMt9hvcMA&list=RDXnuMt9hvcMA&start_radio=1"),
        
        Guitarist(rank: 6,
                  name: "Dimebag Darrell",
                  description: "Played lead guitar for Pantera, and quickly became peoples favorite. Really helped define the groove metal scene, his squealy and fast solos really set him apart from the others.",
                  imageName: "dimebag",
                  link: "https://www.youtube.com/shorts/BaB1EQtKyOA?feature=share"),
        
        Guitarist(rank: 7,
                  name: "Dave Mustaine",
                  description: "He's the rhythm/lead in Megadeth, after getting kicked out of Metallica, he went off to start his own band and is highly praised about his techinque and musical mastery.",
                  imageName: "mustaine",
                  link: "https://www.youtube.com/shorts/ywUyid5A-7o?feature=share"),
        
        Guitarist(rank: 8,
                  name: "Ritchie Blackmore",
                  description: "Guitarist for two huge bands, Deep Purple and Rainbow. He made a lasting impact on the hard rock scene at the time, he was very creative with all of his work.",
                  imageName: "blackmore",
                  link: "https://www.youtube.com/watch?v=Fa5Rj3VGZMo"),
        
        Guitarist(rank: 9,
                  name: "Tony Iommi",
                  description: "Nicknamed god father of heavy metal because of his playing in one of the first metal bands, Black Sabbath. Despite losing the tips of his fingers he still managed to develop amazing dark sounding solos that were massive and still are.",
                  imageName: "iommi",
                  link: "https://youtu.be/s2sTTN0IJPg?t=38"),
        
        Guitarist(rank: 10,
                  name: "Zakk Wylde",
                  description: "Zakk is known for being the longtime member of Ozzy Osbournes band, and Black Label Society. Many say his riffs are aggressive, hes one of the best with pinch harmonics, huge influence on the more modern heavy metal.",
                  imageName: "zakk",
                  link: "https://www.youtube.com/shorts/yymZzpSDOJw?feature=share")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(guitarists) { guitarist in
                        CardView(guitarist: guitarist)
                    }
                }
                .padding()
            }
            //Not sure how my top went transparent but I believe its because of this line,
            .navigationTitle("Top 10 Guitarists")
        }
    }
}

struct CardView: View {
    let guitarist: Guitarist
    @Environment(\.openURL) var openURL
    
    //This is where I put my custome colors to meet requirements
    let cardBackgroundColor: Color = Color.cardgreen
    let cardBorderColor: Color = Color.bordergreen
    let titleTextColor: Color = Color.mint
    let guitarButtonColor: Color = Color(red: 1.0, green: 0.95, blue: 0.85)
    let guitarIconColor: Color = Color.black
    
    //This is where i made it possible to scroll horizontally through my card.
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                VStack {
                    Image(guitarist.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 5)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("#\(guitarist.rank) \(guitarist.name)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(titleTextColor)
                    
                    Text(guitarist.description)
                        .font(.body)
                        .lineLimit(nil)
                    
                    Button(action: {
                        if let url = URL(string: guitarist.link) {
                            openURL(url)
                        }
                    }) {
                        Image(systemName: "guitars")
                            .font(.title2)
                            .padding(10)
                            .background(guitarButtonColor)
                            .foregroundColor(guitarIconColor)
                            .clipShape(Circle())
                            .shadow(radius: 2)
                    }
                }
                .frame(width: 250, alignment: .leading)
            }
            .padding()
        }
        .frame(height: 240)
        .background(cardBackgroundColor)
        .cornerRadius(20)
        .shadow(radius: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(cardBorderColor, lineWidth: 2)
        )
    }
}

#Preview {
    ContentView()
}

