import XCTest

final class PokemonDexUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.activate()
        app.launch()
    }

    override func tearDownWithError() throws {
        
    }

    func testUI() throws {
        // UI tests must launch the application that they test.
        guard let app = app else { return }
        
        app.collectionViews.cells.containing(.staticText, identifier:"bulbasaur").element.tap()
        
        let element2 = app/*@START_MENU_TOKEN@*/.scrollViews.containing(.other, identifier:"Vertical scroll bar, 2 pages")/*[[".scrollViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\")",".scrollViews.containing(.other, identifier:\"Vertical scroll bar, 2 pages\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0)
        let element = element2.children(matching: .other).element.children(matching: .other).element
        element.swipeUp()
        
        let descriptionAStrangeSeedWasPlantedOnItsBackAtBirthThePlantSproutsAndGrowsWithThisPokMonStaticText = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Description: \n\nA strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON."]/*[[".cells.staticTexts[\"Description: \\n\\nA strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.\"]",".staticTexts[\"Description: \\n\\nA strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        descriptionAStrangeSeedWasPlantedOnItsBackAtBirthThePlantSproutsAndGrowsWithThisPokMonStaticText.swipeUp()
        
        let app2 = app
        app2.tables/*@START_MENU_TOKEN@*/.staticTexts["Mythical?: \nfalse"]/*[[".cells.staticTexts[\"Mythical?: \\nfalse\"]",".staticTexts[\"Mythical?: \\nfalse\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        element2.swipeDown()
        element.children(matching: .other).element.swipeDown()
        
        let collectionViewsQuery = app2.scrollViews.otherElements.collectionViews
        let typeGrassPoisonCell = collectionViewsQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Type: grass poison ").element/*[[".scrollViews.cells.containing(.staticText, identifier:\"Type: grass poison \").element",".cells.containing(.staticText, identifier:\"Type: grass poison \").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        typeGrassPoisonCell.swipeLeft()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Type: grass poison ").element/*[[".scrollViews",".cells.containing(.image, identifier:\"pikachu-png\").element",".cells.containing(.staticText, identifier:\"Type: grass poison \").element"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        typeGrassPoisonCell.swipeLeft()
        app.navigationBars["bulbasaur"].buttons["Pokemon"].tap()
        
        app.navigationBars["Pokemon"].searchFields["Search for a Pokemon"].tap()
        
        let bKey = app/*@START_MENU_TOKEN@*/.keys["B"]/*[[".keyboards.keys[\"B\"]",".keys[\"B\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bKey.tap()
        
        let uKey = app/*@START_MENU_TOKEN@*/.keys["u"]/*[[".keyboards.keys[\"u\"]",".keys[\"u\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        uKey.tap()
        
        let lKey = app/*@START_MENU_TOKEN@*/.keys["l"]/*[[".keyboards.keys[\"l\"]",".keys[\"l\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        lKey.tap()
        
        let bKey2 = app/*@START_MENU_TOKEN@*/.keys["b"]/*[[".keyboards.keys[\"b\"]",".keys[\"b\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bKey2.tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        
        let sKey = app/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        sKey.tap()
        aKey.tap()
        uKey.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"search\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.otherElements["PopoverDismissRegion"]/*[[".otherElements[\"dismiss popup\"]",".otherElements[\"PopoverDismissRegion\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    
    func testScrollPaging() throws {
        guard let app = app else { return }

        let verticalScrollBar4PagesCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Horizontal scroll bar, 1 page").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 4 pages\").element"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        verticalScrollBar4PagesCollectionView.swipeUp()
        verticalScrollBar4PagesCollectionView.swipeUp()
        verticalScrollBar4PagesCollectionView.swipeUp()
        
        let verticalScrollBar7PagesCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 7 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 7 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        verticalScrollBar7PagesCollectionView.swipeUp()
        verticalScrollBar7PagesCollectionView.swipeUp()
        verticalScrollBar7PagesCollectionView.swipeUp()
        
                        
            
    }
    
    
    func testPaginationLoadingTimeout() throws {
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
