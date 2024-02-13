
# Custom Brand Button


![Static Badge](https://img.shields.io/badge/platform-ios-blue?style=flat&logo=apple)
![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat&logo=swift&logoColor=white)

A custom Brand Button with multiple varients as follows:
- Green, Primary
- Green, Secondary
- Blue, Primary
- Blue, Secondary
- Disabled (Green or Blue), Primary
- Disabled (Green or Blue), Secondary


## Variations

![App Screenshot](https://github.com/abhi-sriv/BrandButton/assets/6223763/929c2538-a55a-4115-a209-fa909bac25b9)


## ScreenShot

### Variations

The screenshot below showcasess the different variations and states of the custom brand button.

#### Preview

![App Screenshot](https://github.com/abhi-sriv/BrandButton/assets/6223763/07dc89b3-c67e-4f1a-af34-fe7751728938)

#### Disabled State
Disabled states for Primary and Secondary

![App Screenshot](https://github.com/abhi-sriv/BrandButton/assets/6223763/d1ee12b3-d82d-4ab5-b594-f7d7f189e468)

#### Primary Selected
![App Screenshot](https://github.com/abhi-sriv/BrandButton/assets/6223763/8a293807-d096-4316-ba57-d61d62374671)

#### Secondary Selected
![App Screenshot](https://github.com/abhi-sriv/BrandButton/assets/6223763/916ed4fe-432d-4a99-b908-09fdc2f7fb21)



## Installation

Simply drag and drop the "BrandButton" folder in your project and start using the custom control.
#### Future scope
The custom control and its design system can be added to a XCFramework and distributed internally through cocoapods or SPM, depending upon the team's requirements.
## Usage/Examples

```swift
let primaryGreenBtn: BrandButton = BrandButton.init(type: .primaryGreen)
let primaryBlueBtn: BrandButton = BrandButton.init(type: .primaryBlue)
    
let primaryBlueLeftIconBtn: BrandButton = BrandButton.init(type: .primaryBlue, icon: "stop.fill", leadingIcon: true)
let primaryGreenRightIconBtn: BrandButton = BrandButton.init(type: .primaryGreen, icon: "stop.fill", leadingIcon: false)
```


## Architecture

The BrandButton inhertits from a UIButton to leverage the existing functionality provided by the UIButton and add customizations on top of it. You can modify the size, background color, fonts just like any other button.

There is a standard Size object available to set the size of the button as 
```
.regular, .medium, .fullWidth

```

The Custom control uses a micro design system with colors mapped to the design. Changing the color in this system is as easy as modifying the Colors in the Asset Catalog.
We can build a similar one for Fonts to define standard Title, SubTitles. Description to bring further standerdizations.
## Author

[Abhishek Srivastava](https://github.com/abhi-sriv)

