import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct Cryptoverview: Website {
    enum SectionID: String, WebsiteSectionID {
			case info
        // Add the sections that you want your website to contain here:
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://cryptoverview.app")!
    var name = "Cryptoverview"
    var description = "Cryptoverview"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

private struct PortfolioHTMLFactory<Site: Website>: HTMLFactory {
	
	func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
		HTML(
			.head(
				.meta(.charset(.utf8)),
				.meta(.name("viewport"), .content("width=device-width, initial-scale=1")),
				.link(.rel(.shortcutIcon), .type("image/png"), .href("shortcutIcon.png")),
				.title("Cryptoverview"),
				.stylesheet("styles.css")
			),
			.body {
				HStack {
					Div {
						Div("Crypto at a glance")
							.id("title")
						Div("Cryptoverview is the best way to keep up with basic crypto metrics on the go. Whether it's the Bitcoin Fear and Greed Index, the average ETH Gas Fee or the current NUPL of the Bitcoin market, you can count on Cryptoverview keeping you updated.")
						Link(url: "https://apps.apple.com/se/app/cryptoverview/id1578673077?l=en") {
							Image(url: "Download_on_the_App_Store.png", description: "")
								.id("downloadOnTheAppStore")
						}
						Link(url: "https://cryptoverview-privacy.netlify.app") {
							Div("Privacy Policy 🔓")
						}
						.id("privacyPolicy")
					}
					.id("textContent")
					Image(url: "cryptoverview.jpg", description: "")
						.id("cryptoverviewImage")
				}
				.id("container")
			}
		)
	}
	
	func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
		try makeIndexHTML(for: context.index, context: context)
	}
	
	func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
		try makeIndexHTML(for: context.index, context: context)
	}
	
	func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
		try makeIndexHTML(for: context.index, context: context)
	}
	
	func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
		nil
	}
	
	func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
		nil
	}
}

extension Theme {
	static var cryptoverviewTheme: Theme {
		Theme(htmlFactory: PortfolioHTMLFactory(), resourcePaths: ["Resources/cryptoverviewTheme/styles.css"])
	}
}

// This will generate your website using the built-in Foundation theme:
try Cryptoverview().publish(using: [
  .copyFiles(at: "/Resources"),
  .copyFile(at: "/apple-app-site-association.json"),
  .generateHTML(withTheme: .cryptoverviewTheme)
])
