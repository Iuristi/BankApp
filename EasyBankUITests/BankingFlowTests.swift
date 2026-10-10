
import XCTest

final class BankingFlowTests: BaseClass {

    // Test 1: Invalid email format
    func testInvalidEmailFormat() {

        let steps = EasyBankSteps(app: app)

        steps.openLogin()

        steps.login(
            email: "invalid-email",
            password: "Test12345!"
        )

        steps.verifyLoginError(contains: "badly formatted")
    }

    // Test 2: Invalid login credentials
    func testInvalidLoginCredentials() {

        let steps = EasyBankSteps(app: app)

        steps.openLogin()

        let email = "unknown_\(UUID().uuidString)@example.com"

        steps.login(
            email: email,
            password: "Test12345!"
        )

        steps.verifyLoginError(
            contains: "malformed or has expired"
        )
    }

    // Test 3: Registration, Logout and Login
    func testRegisterLogoutLogin() {

        let steps = EasyBankSteps(app: app)

        let email = "test_\(UUID().uuidString)@example.com"
        let password = "Test12345!"

        steps.openRegistration()

        steps.register(
            email: email,
            password: password
        )

        steps.verifyHomeScreen()

        steps.logout()

        steps.login(
            email: email,
            password: password
        )

        steps.verifyHomeScreen()
    }
}
