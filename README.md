

# Google Books API Flutter App

A Flutter application that allows users to search and explore books using the Google Books API. This app demonstrates how to integrate with external APIs and build a modern mobile interface for browsing books.

## Features

- Search books using Google Books API
- Display book details including:
  - Title
  - Author(s)
  - Book cover images
- Modern and responsive UI
- Real-time search results

## Screenshots

### Book Search Interface
<img src="https://user-images.githubusercontent.com/97346744/169652860-16bb57da-9eb1-4817-8c99-a7d7d6457447.png" alt="Book Search Interface" style="width:200px;">

### Book Details View
<img src="https://user-images.githubusercontent.com/97346744/169652855-0931024a-0c05-43d8-aa73-f46f28ef62ca.png" alt="Book Details" style="width:200px;">

## Tech Stack

- Flutter
- Dart
- Google Books API

## Project Structure

```
lib/
├── Models/
│   ├── Book.dart         # Book model class
│   ├── Volume_info.dart   # Volume information model
│   └── images.dart        # Image links model
├── listbook.dart         # Book list view
└── main.dart            # Application entry point
```

## Setup Instructions

1. Clone the repository
2. Ensure you have Flutter installed on your machine
3. Run `flutter pub get` to install dependencies
4. Connect a device or start an emulator
5. Run `flutter run` to start the application

## Dependencies

- Flutter SDK
- HTTP package for API calls
- Material Design components

## Permissions

The application requires the following permissions:
- Internet access for API calls

## Contributing

Feel free to submit issues and enhancement requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

