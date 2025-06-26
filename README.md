# Clean Architecture Sample - Flutter

A comprehensive Flutter project demonstrating the implementation of Clean Architecture principles with proper separation of concerns, dependency injection, and testability.

## 🏗️ Architecture Overview

This project follows **Clean Architecture** principles as defined by Robert C. Martin, implementing a layered architecture that promotes:

- **Separation of Concerns**: Each layer has a specific responsibility
- **Dependency Rule**: Dependencies point inward, with the domain layer at the center
- **Testability**: Each layer can be tested independently
- **Maintainability**: Changes in one layer don't affect others
- **Scalability**: Easy to add new features without modifying existing code

## 📁 Project Structure

```
lib/
├── authen/                          # Authentication feature module
│   ├── data/                        # Data Layer
│   │   ├── data_source/            # External data sources
│   │   │   ├── authen_api.dart     # API implementation
│   │   │   └── authen_data_source.dart # Abstract data source
│   │   ├── mapper/                 # Data transformation
│   │   │   └── user_mapper.dart    # Model to Entity mapping
│   │   ├── model/                  # Data models
│   │   │   ├── user_request_model.dart
│   │   │   └── user_response_model.dart
│   │   └── repository/             # Repository implementations
│   │       └── login_repository_impl.dart
│   ├── domain/                     # Domain Layer (Core Business Logic)
│   │   ├── entity/                 # Business entities
│   │   │   └── user_entity.dart
│   │   ├── repository/             # Repository interfaces
│   │   │   └── authen_repository.dart
│   │   └── usecase/                # Use cases (Business rules)
│   │       └── login_usecase.dart
│   └── presentation/               # Presentation Layer
│       ├── bloc/                   # State management
│       │   ├── login_cubit.dart
│       │   └── login_state.dart
│       ├── screen/                 # UI screens
│       │   └── login_screen.dart
│       └── ui_extension/           # UI extensions
│           └── user_entity_extension.dart
├── injection_container.dart        # Dependency injection setup
└── main.dart                       # Application entry point
```

## 🏛️ Clean Architecture Layers

### 1. **Domain Layer** (Core Business Logic)
The innermost layer containing business entities, use cases, and repository interfaces.

#### Entities (`lib/authen/domain/entity/`)
- **`user_entity.dart`**: Core business object representing a user
- Contains business logic and validation rules
- Independent of external frameworks

#### Use Cases (`lib/authen/domain/usecase/`)
- **`login_usecase.dart`**: Orchestrates the login business logic
- Implements specific business rules and validation
- Depends only on repository interfaces

#### Repository Interfaces (`lib/authen/domain/repository/`)
- **`authen_repository.dart`**: Abstract contract for authentication operations
- Defines what operations are available without implementation details

### 2. **Data Layer** (External Data Access)
Handles data operations and external dependencies.

#### Data Sources (`lib/authen/data/data_source/`)
- **`authen_data_source.dart`**: Abstract interface for data operations
- **`authen_api.dart`**: Concrete implementation simulating API calls
- Follows dependency inversion principle

#### Models (`lib/authen/data/model/`)
- **`user_request_model.dart`**: Data transfer object for API requests
- **`user_response_model.dart`**: Data transfer object for API responses
- Handles JSON serialization/deserialization

#### Mappers (`lib/authen/data/mapper/`)
- **`user_mapper.dart`**: Converts data models to domain entities
- Ensures clean separation between data and domain layers

#### Repository Implementations (`lib/authen/data/repository/`)
- **`login_repository_impl.dart`**: Concrete implementation of repository interface
- Coordinates between data sources and domain layer

### 3. **Presentation Layer** (UI and State Management)
Handles user interface and state management.

#### State Management (`lib/authen/presentation/bloc/`)
- **`login_cubit.dart`**: Manages login state using BLoC pattern
- **`login_state.dart`**: Defines possible states using sealed classes
- Handles UI state transitions and business logic coordination

#### Screens (`lib/authen/presentation/screen/`)
- **`login_screen.dart`**: UI implementation using Flutter widgets
- Consumes state from BLoC and triggers actions
- Focuses purely on presentation logic

## 🔧 Key Technologies & Dependencies

### State Management
- **flutter_bloc**: Implements BLoC pattern for state management
- **equatable**: Enables proper state comparison

### Dependency Injection
- **get_it**: Service locator for dependency injection
- Provides singleton and factory registrations

### Testing
- **bloc_test**: Testing utilities for BLoC components
- **mockito**: Mocking framework for unit tests
- **build_runner**: Code generation for mocks

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.3.0)
- Dart SDK (>=3.3.0)

### Installation
1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Generate mock files for testing:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. Run the application:
   ```bash
   flutter run
   ```

## 🧪 Testing

The project includes comprehensive unit tests demonstrating clean architecture testing principles:

### Use Case Tests (`test/login_usecase_test.dart`)
- Tests business logic in isolation
- Mocks repository dependencies
- Validates input validation and error handling

### BLoC Tests (`test/login_cubit_test.dart`)
- Tests state management logic
- Verifies state transitions
- Mocks use case dependencies

### Running Tests
```bash
flutter test
```

## 📚 Additional Resources
- [Clean Architecture: A Guide for Flutter Development](http://collab.lge.com/main/display/VSL/Clean+Architecture%3A+A+Guide+for+Flutter+Development)
- [Clean Architecture by Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter BLoC Documentation](https://bloclibrary.dev/)
- [GetIt Documentation](https://pub.dev/packages/get_it)
- [Clean Architecture in Flutter](https://medium.com/flutter-community/clean-architecture-in-flutter-using-bloc-pattern-2c4b20f9b3d8)
