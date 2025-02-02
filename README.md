(Due to technical issues, the search service is temporarily unavailable.)

# Quiz App

## 📝 Overview

This is a **Quiz App** built using **Flutter**. The app allows users to answer a series of questions and provides feedback on their performance. The app includes features like a timer, progress bar, and the ability to view results and play again. The app is designed to be cross-platform, supporting Android, iOS, web, and desktop.

## 🛠️ Project Structure

The project is organized as follows:

```
├── analysis_options.yaml
├── android
│   ├── app
│   ├── build.gradle
│   ├── gradle
│   ├── gradle.properties
│   └── settings.gradle
├── assets
│   ├── fonts
│   └── images
├── ios
│   ├── Flutter
│   ├── Runner
│   ├── RunnerTests
│   ├── Runner.xcodeproj
│   └── Runner.xcworkspace
├── lib
│   ├── constants.dart
│   ├── main.dart
│   ├── model
│   ├── screens
│   └── widgets
├── linux
│   ├── CMakeLists.txt
│   ├── flutter
│   ├── main.cc
│   ├── my_application.cc
│   └── my_application.h
├── macos
│   ├── Flutter
│   ├── Runner
│   ├── RunnerTests
│   ├── Runner.xcodeproj
│   └── Runner.xcworkspace
├── pubspec.lock
├── pubspec.yaml
├── README.md
├── test
│   └── widget_test.dart
├── web
│   ├── favicon.png
│   ├── icons
│   ├── index.html
│   └── manifest.json
└── windows
    ├── CMakeLists.txt
    ├── flutter
    └── runner
```

### Key Files and Directories

- **`lib/`**: Contains the main application code.
  - **`main.dart`**: The entry point of the application.
  - **`constants.dart`**: Defines color constants used throughout the app.
  - **`model/`**: Contains the data models, such as `question_model.dart`.
  - **`screens/`**: Contains the different screens of the app, such as `home_screen.dart`, `result_screen.dart`, and `point_screen.dart`.
  - **`widgets/`**: Contains reusable widgets like `answer_container.dart`, `base_widget.dart`, and `progress_bar.dart`.

- **`assets/`**: Contains static assets like images and fonts.
  - **`fonts/`**: Custom fonts used in the app.
  - **`images/`**: Images used in the app, such as icons and illustrations.

- **`pubspec.yaml`**: Defines the dependencies and assets used in the project.

## 🎨 Features

- **Timer**: Each question has a 10-second timer. If the user doesn't answer in time, the app automatically moves to the next question.
- **Progress Bar**: Shows the progress of the quiz.
- **Answer Feedback**: The app provides immediate feedback on whether the user's answer was correct or incorrect.
- **Results Screen**: After completing the quiz, the user can view their results, including the number of correct, wrong, and unanswered questions.
- **Play Again**: Users can restart the quiz or exit the app.
- **Scoreboard**: Users can save their scores with a name and view a leaderboard.

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: Make sure you have Flutter installed on your machine. If not, follow the [official installation guide](https://flutter.dev/docs/get-started/install).
- **Dart SDK**: Flutter comes with Dart, so no separate installation is needed.

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/MohammadAminar/Queez.git
   cd Queez
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

### Supported Platforms

- **Android**: Run on an Android emulator or physical device.
- **iOS**: Run on an iOS simulator or physical device.
- **Web**: Run in a web browser.
- **Desktop**: Run on Windows, macOS, or Linux.

## 🧪 Testing

The app includes a basic widget test in `test/widget_test.dart`. To run the tests, use the following command:

```bash
flutter test
```

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Flutter**: For providing an amazing framework to build cross-platform apps.
- **Flutter Phoenix**: For helping in restarting the app without losing state.
- **Awesome Dialog**: For providing beautiful and customizable dialogs.

## 📧 Contact

If you have any questions or suggestions, feel free to reach out:

- **Email**: aminaranpour292@gmail.com
- **GitHub**: [MohammadAminar](https://github.com/MohammadAminar/)

---

Happy Coding! 🚀
