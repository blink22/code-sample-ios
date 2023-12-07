# Code Conventions

This document outlines best practices and conventions to follow when writing Swift code. Adhering to these practices helps create clean, readable, and maintainable code.

## Table of Contents

1. [Code Structure](#1-code-structure)
2. [Naming Conventions](#2-naming-conventions)
3. [Optionals](#3-optionals)
4. [Error Handling](#4-error-handling)
5. [Type Inference](#5-type-inference)
6. [Access Control](#6-access-control)
7. [Extensions](#7-extensions)
8. [Closures](#8-closures)
9. [Memory Management](#9-memory-management)

## 1. Code Structure

- **Organize code logically into files and folders.**
  - Group related functionalities together.

- **Use extensions to separate functionality into smaller, focused units.**
  - Avoid overly long files.

## 2. Naming Conventions

- **Follow Swift naming conventions:**
  - Use camelCase for variables and function names.
  - Use UpperCamelCase for type names (classes, structs, enums).
  - Use uppercase for acronyms (e.g., `URL`, `HTTP`).

- **Be descriptive with names:**
  - Choose meaningful and clear names for variables, functions, and types.

## 3. Optionals

- **Use optionals judiciously:**
  - Only use optionals when a value can legitimately be absent.
  - Prefer using `guard` or `if let` for unwrapping optionals.

```swift
if let value = optionalValue {
    // Use 'value' safely
} else {
    // Handle absence
}
```
## 4. Error Handling

- **Use Swift's Error type for error handling:**
  - Create custom error types for specific error cases.

```swift
enum NetworkingError: Error {
    case noInternet
    case serverError
}
```
## 5. Type Inference
- **Leverage Swift's type inference:**
  - Let the compiler infer types when possible.
```swift
let name = "John"
let count = 42
```
## 6. Access Control
- **Use access control to restrict the visibility of types and methods:**
  - Use the most restrictive access level that makes sense.
```swift
private class MyPrivateClass {
    // Implementation
}
```

## 7. Extensions
- **Use extensions to add functionality to existing types:**
    - Keep related functionalities grouped.**
```swift
extension String {
    func customFunction() {
        // Implementation
    }
}
```
## 8. Closures
 - **Use trailing closures for cleaner syntax:**
    - Especially for functions that take a closure as their last argument.
```swift
UIView.animate(withDuration: 0.3) {
    // Animation
}
```
## 9. Memory Management
- **Understand and use weak and unowned references:
Avoid strong reference cycles.**
```swift
class MyClass {
    var closure: (() -> Void)?

    init() {
        closure = { [weak self] in
            self?.someFunction()
        }
    }
}
```