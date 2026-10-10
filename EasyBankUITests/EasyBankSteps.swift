

import XCTest

final class EasyBankSteps {

    let page: EasyBankPage

    init(app: XCUIApplication) {
        page = EasyBankPage(app: app)
    }

    // MARK: - Common actions

   func tap(_ element: XCUIElement) {
    XCTAssertTrue(
        element.waitForExistence(timeout: 15),
        "Element was not found"
    )

    let hittable = NSPredicate(format: "hittable == true")
    let expectation = XCTNSPredicateExpectation(
        predicate: hittable,
        object: element
    )

    let result = XCTWaiter.wait(
        for: [expectation],
        timeout: 10
    )

    XCTAssertEqual(
        result,
        .completed,
        "Element was not hittable"
    )

    element.tap()
}


    func enterText(_ text: String, into field: XCUIElement) {
        XCTAssertTrue(field.waitForExistence(timeout: 10))
        field.tap()
        field.typeText(text)
    }

    // MARK: - Login

    func openLogin() {
        tap(page.onboardingLogin)
    }

    func login(email: String, password: String) {
        enterText(email, into: page.loginEmail)
        enterText(password, into: page.loginPassword)
        tap(page.loginSubmit)
    }

    func verifyLoginError(contains expected: String) {
        XCTAssertTrue(
            page.loginError.waitForExistence(timeout: 10),
            "Login error was not displayed"
        )

        XCTAssertTrue(
            page.loginError.label.contains(expected),
            "Unexpected error: \(page.loginError.label)"
        )
    }

    // MARK: - Registration

    func openRegistration() {
        tap(page.onboardingRegister)
    }

    func enterRegistrationPassword(
        _ password: String,
        into field: XCUIElement
    ) {
        XCTAssertTrue(field.waitForExistence(timeout: 10))
        field.tap()

        if page.closePasswordPrompt.waitForExistence(timeout: 2) {
            page.closePasswordPrompt.tap()
            field.tap()
        }

        field.typeText(password)
    }

    func register(email: String, password: String) {
        enterText(email, into: page.registrationEmail)

        enterRegistrationPassword(
            password,
            into: page.registrationPassword
        )

        enterRegistrationPassword(
            password,
            into: page.repeatPassword
        )

        tap(page.registrationSubmit)
    }

    // MARK: - Home

    func verifyHomeScreen() {
        XCTAssertTrue(
            page.homeScreen.waitForExistence(timeout: 15),
            "Home screen was not displayed"
        )
    }

    // MARK: - Logout

    func logout() {
        tap(page.logoutButton)

        XCTAssertTrue(
            page.logoutAlert.waitForExistence(timeout: 10),
            "Logout confirmation was not displayed"
        )

        tap(page.confirmLogout)

        XCTAssertTrue(
            page.loginEmail.waitForExistence(timeout: 10),
            "Login form was not displayed after logout"
        )
    }
}
