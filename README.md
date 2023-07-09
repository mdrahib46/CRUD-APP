# CRUD App

This is a Flutter application that implements basic CRUD (Create, Read, Update, Delete) functionality. It allows users to view a list of products, add new products, edit existing products, and remove products.

## Getting Started

To get started with the project, follow these steps:

1. Clone the repository: `git clone <repository-url>`
2. Open the project in your preferred Flutter IDE.

## Dependencies

The project uses the following dependencies:

- `flutter/material.dart`: Flutter's Material Design widgets for building the user interface.
- `http/http.dart`: A package for making HTTP requests to the CRUD API.
- `class.dart`: A custom class file containing the `Product` class.

Make sure to include these dependencies in your `pubspec.yaml` file.

## Usage

The `HomePage` class serves as the main entry point of the application. It displays a list of products retrieved from the API and provides options to add, edit, and remove products.

### Initialization

The `initState` method is overridden to call the `getProduct` method, which fetches the product data from the API. The retrieved data is stored in the `products` list, and the state is updated using `setState` to trigger a rebuild of the UI.

### Fetching Products

The `getProduct` method performs an HTTP GET request to the API endpoint `https://www.crud.teamrabbil.com/api/v1/ReadProduct` using the `http` package. The response is then parsed and decoded from JSON format. If the request is successful (status code 200), the product data is extracted from the decoded response and added to the `products` list.

### UI Components

- `AppBar`: Displays the title of the app at the center.
- `FloatingActionButton`: Allows users to navigate to the `AddNewProducts` screen to add new products.
- `ListView.builder`: Displays a scrollable list of products using the `ListTile` widget. Each `ListTile` represents a product and provides a long-press gesture to show options for editing or removing the product.
- `AlertDialog`: Shows options for editing or removing a product when long-pressed. Selecting an option triggers the corresponding action.

## Contributing

Contributions to the project are welcome. If you find any issues or want to add new features, please open a new issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
