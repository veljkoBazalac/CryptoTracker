//
//  SettingsView.swift
//  CryptoTracker
//
//  Created by VELJKO on 14.11.22..
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let gitHubURL = URL(string: "https://www.github.com/veljkoBazalac")!
    let linkedInURL = URL(string: "https://www.linkedin.com/in/veljkobazalac")!
    let twitterURL = URL(string: "https://twitter.com/Veljko_iOS")!
    let coinGeckoURL = URL(string: "https://www.coingecko.com")!
    
    var body: some View {
        NavigationView {
            List {
                veljkoBazalacSection
                coinGeckoSection
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    dismissButton()
                }
            }
        }
    }
}

extension SettingsView {
    // MARK: - Dismiss View
    private func dismissButton() -> some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
    
    // MARK: - Veljko Bazalac Section
    private var veljkoBazalacSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was developed by Veljko Bažalac. It uses MVVM Architecture, Combine, RestAPIs and CoreData!")
            }
            .padding(.vertical)
            
            Link("Veljko Bažalac's GitHub", destination: gitHubURL)
            Link("Veljko Bažalac's LinkedIn", destination: linkedInURL)
            Link("Veljko Bažalac's Twitter", destination: twitterURL)
        } header: {
            Text("Developer")
        }
    }
    
    // MARK: - CoinGecko Section
    private var coinGeckoSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko!")
            }
            .padding(.vertical)
            
            Link("Visit CoinGecko", destination: coinGeckoURL)
        } header: {
            Text("CoinGecko")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
