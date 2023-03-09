//
//  HomeScreen.swift
//  EburyLite
//
//  Created by Demian Tejo on 06/03/2023.
//

import SwiftUI

struct HomeScreen: View, ViewControllableProtocol {

    @ObservedObject
    var viewModel: HomeViewModel
    typealias Texts = HomeViewModel.Texts
    typealias ImageNames = HomeViewModel.ImageNames
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                titleAndSubtitleView
                mainView
            }.background {
                BackgroundView()
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    userIconButtonView
                }
            }
        }.onAppear {
            Task {
                await viewModel.refreshData()
            }
        }
    }

    private var userIconButtonView : some View {
            Button {
                viewModel.tapUserIcon()
            } label: {
                Image(systemName: ImageNames.user)
                    .font(.system(size: .MEDIUM))
                    .foregroundColor(.white)
            }
    }

    private var titleAndSubtitleView : some View {
        ScrollView {
            Spacer(minLength: .XLARGE)
            Text(Texts.welcome)
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, .MEDIUM)
            Text(Texts.companyName)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, .MEDIUM)
            Spacer()
        }.refreshable {
            await viewModel.pullDownToRefresh()
        }
    }

    private var walletsView : some View {
        VStack {
            HStack {
                Text(Texts.yourCurrencies)
                    .fontWeight(.semibold)
                    .font(.headline)
                Spacer()
                Button {
                    viewModel.tapViewMoreViewLessButton()
                }label: {
                    Text(viewModel.listActionButtonTitle)
                        .fontWeight(.semibold)
                        .font(.headline)
                }
            }
            .padding(.top, .LARGE)
            .padding(.bottom, .MEDIUM)
            .padding(.horizontal, .MEDIUM)
            walletListView
        }

    }

    private var walletListView : some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.itemsToShow) { walletCellData in
                CellView(dataSource: walletCellData)
                    .padding(.bottom, .XSMALL)
            }
        }
        .padding(.horizontal, .MEDIUM)
        .padding(.bottom, .LARGE)
    }

    private var emptyStateView: some View {
        VStack(spacing: .XSMALL) {
            Image(ImageNames.commingSoon)
                .padding(.MEDIUM)
            Text(viewModel.feedbackText)
                .frame(maxWidth: .infinity)
                .font(.title2)
        }
        .padding(.LARGE)
    }

    private var mainView: some View {
        VStack {
            if viewModel.itemsToShow.isEmpty { 
                emptyStateView
            } else {
                walletsView
            }
        }
        .frame(minHeight: viewModel.listViewSize)
        .background(
            Rectangle()
                .fill(Color.backgroundColor)
                .cornerRadius(.CONTAINER_RADIUS, corners: [.topLeft, .topRight])
                .shadow(color: .blackShadow, radius: 10, x: 0, y: 10)
        )
    }

}





