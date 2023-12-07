# iOS VIPER Architecture: Sample App

This repository contains a detailed sample app that implements VIPER architecture using
 - Alamofire: https://github.com/Alamofire/Alamofire
 - PromiseKit: https://github.com/mxcl/PromiseKit
 - R.swift: https://github.com/mac-cain13/R.swift
<br>
<br>

# Architecture
<p align="center">
  <img width="600" height="814" src="/docs/images/clean-architecture.png">
</p>
<p align="center">
  <img src="/docs/images/viper-architecture.png">
</p>
<br>

####
In order to perform its mission module, it is necessary to solve several problems. It is required to implement the business logic module, networking, database, render the user interface. VIPER describes the role of each component and how they interact with each other.

## Viper Components

#### 1. View

The View layer is responsible for displaying the user interface and capturing user input. It should not contain business logic. Instead, it delegates user actions to the Presenter for processing.

#### 2. Interactor

The Interactor layer contains the business logic and is responsible for interacting with the data layer. It receives requests from the Presenter, processes them, and returns the results.

#### 3. Presenter

The Presenter acts as a mediator between the View and the Interactor. It receives user input from the View, processes it, and updates the View accordingly. The Presenter also communicates with the Interactor to fetch or manipulate data.

#### 4. Entity

The Entity layer represents the data models used in the application. It encapsulates the data and business logic related to the application's domain.

#### 5. Router

The Router handles navigation and routing logic. It is responsible for transitioning between different screens or modules within the application.



## Viper General Rules

#### 1. Module Naming

- **Modules should be named according to functionality.**
  - Example: `LoginView`, `UserProfileInteractor`.

#### 2. Dependency Injection

- **Inject dependencies during initialization.**
  - Avoid components creating their own dependencies.

#### 3. Single Responsibility Principle

- **Each component should have a single responsibility.**
  - Keep components focused on specific tasks.

#### 4. Protocol Usage

- **Use protocols to define interfaces.**
  - Promotes loose coupling and easy testing.

## Structure

<p align="center">
  <img src="/docs/images/viper-structure.png">
</p>

#### Checkout 👉 [Code Conventions](docs/CodeConventions.md) | [Development and Release process](docs/DevelopmentReleaseProcess.md)

# Requirements

* iOS 15.0+
* Xcode 13
* Swift 5


# How to use

```sh
git clone https://github.com/blink22/Code-Sample-iOS.git
cd Code-Sample-iOS
pod install
open Code-Sample-iOS.xcworkspace
```
<br>


# Read the below listed articles. They describe the VIPER concepts.
1. [Straight to the point: VIPER architectural pattern](https://onnerb.medium.com/straight-to-the-point-viper-architectural-pattern-6c9332737af0)
2. [VIPER Architecture for iOS App Development](https://maddevs.io/blog/viper-architecture-for-ios-app-development/)
3. [Understanding and implementing VIPER architecture for iOS applications](https://simonegiordano.medium.com/implement-viper-architecture-in-swift-for-ios-development-part-1-viper-vs-mvvm-edcfd4dbdd38)


# **General Notes**
- Make sure to test your code (Don't depend on having a QA or PR reviewers to find the bugs)
- DON'T make any changes on production before communicating with your manager/senior
