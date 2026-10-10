
import XCTest

final class EasyBankPage {

    let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    // Onboarding
    var onboardingLogin: XCUIElement {
        app.buttons["onboarding.login"]
    }

    var onboardingRegister: XCUIElement {
        app.buttons["onboarding.register"]
    }

    // Login
    var loginEmail: XCUIElement {
        app.textFields["login.email"]
    }

    var loginPassword: XCUIElement {
        app.secureTextFields["login.password"]
    }

    var loginSubmit: XCUIElement {
        app.buttons["login.submit"]
    }

    var loginError: XCUIElement {
        app.staticTexts["login.error"]
    }

    // Registration
    var registrationEmail: XCUIElement {
        app.textFields["registration.email"]
    }

    var registrationPassword: XCUIElement {
        app.secureTextFields["registration.password"]
    }

    var repeatPassword: XCUIElement {
        app.secureTextFields["registration.repeatPassword"]
    }

    var registrationSubmit: XCUIElement {
        app.buttons["registration.submit"]
    }

    // Home
    var homeScreen: XCUIElement {
        app.buttons["home.sendMoney"]
    }

    var logoutButton: XCUIElement {
        app.buttons["home.logout"]
    }

    // Logout confirmation
    var logoutAlert: XCUIElement {
        app.alerts["Logging Out"]
    }

    var confirmLogout: XCUIElement {
        app.alerts["Logging Out"].buttons["Yes"]
    }

    // iOS system prompt
    var closePasswordPrompt: XCUIElement {
        app.buttons["Close"]
    }
}

