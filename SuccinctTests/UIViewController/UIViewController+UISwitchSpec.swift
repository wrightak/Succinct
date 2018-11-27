import Quick
import Nimble
import Succinct

final class UIViewController_UISwitchSpec: QuickSpec {
    override func spec() {
        describe("finding switches using their on/off status") {
            context("when a switch does not exist in the view hierarchy") {
                it("can find the switch") {
                    let viewController = UIViewControllerBuilder()
                        .build()
                    
                    
                    let switchCount = viewController.countOfSwitches(switchIsOn: true)
                    
                    
                    expect(switchCount).to(equal(0))
                }
            }
            
            context("when a switch exists in the first subview") {
                it("can find the switch") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UISwitchBuilder().withIsOn(true).build())
                        .build()
                    
                    
                    let switchCount = viewController.countOfSwitches(switchIsOn: true)
                    
                    
                    expect(switchCount).to(equal(1))
                }
            }
            
            context("when a switch exists in the second subview") {
                it("can find the switch") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UISwitchBuilder().withIsOn(true).build()
                                )
                                .build()
                        )
                        .build()
                    
                    
                    let switchCount = viewController.countOfSwitches(switchIsOn: true)
                    
                    
                    expect(switchCount).to(equal(1))
                }
            }
            
            context("when there are switches with different statuses") {
                it("can find the switch") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UISwitchBuilder().withIsOn(false).build())
                        .withSubview(
                            UISwitchBuilder().withIsOn(true).build())
                        .build()

                    
                    let switchCount = viewController.countOfSwitches(switchIsOn: false)
                    
                    
                    expect(switchCount).to(equal(1))
                }
            }
        }
    }
}