# AI-Agents_VertexAi_Flutter

# AI-Powered Photo Discovery App

This is an AI-powered photo discovery app built using Flutter and Firebase. The app leverages generative AI models to provide an interactive and intelligent photo discovery experience. It integrates with Firebase for backend services and uses various Flutter packages for enhanced functionality.

## Features

- **AI-Powered Photo Discovery**: Utilizes generative AI models to discover and recommend photos.
- **Image Picker**: Allows users to select images from their device.
- **Firebase Integration**: Uses Firebase for authentication, core services, and Vertex AI.
- **Chat UI**: Includes a chat interface for interactive user experiences.
- **Permissions Handling**: Manages device permissions for accessing the gallery and camera.
- **Shimmer Effects**: Provides loading animations for a smooth user experience.
- **Routing**: Uses `go_router` for efficient navigation within the app.

## Dependencies

The app uses the following Flutter packages:

- `cupertino_icons: ^1.0.8`
- `image_picker: ^1.0.7`
- `font_awesome_flutter: ^10.7.0`
- `provider: ^6.1.2`
- `flutter_animate: ^4.5.0`
- `go_router: ^14.2.0`
- `firebase_vertexai: ^0.2.2`
- `firebase_core: ^3.1.0`
- `image_gallery_saver: ^2.0.3`
- `permission_handler: ^11.3.1`
- `shimmer: ^3.0.0`
- `flutter_chat_ui: ^1.6.12`
- `uuid: ^4.4.0`
- `http: ^1.2.1`
- `firebase_auth: ^5.1.0`

## Architecture Diagram

Below is the architecture diagram of the app:

![Architecture Diagram](https://camo.githubusercontent.com/9b68ed881b04c8818f0274e87cbc88b1224a4098a7373838345a148519dd574a/68747470733a2f2f73746f726167652e676f6f676c65617069732e636f6d2f6769746875622d7265706f2f67656e657261746976652d61692f73616d706c652d617070732f70686f746f2d646973636f766572792f6172636869746563747572652d6469616772616d2e706e67)

## Inspiration

This project is inspired by the [Photo Discovery Sample App](https://github.com/GoogleCloudPlatform/generative-ai/tree/main/gemini/sample-apps/photo-discovery/app) from Google Cloud Platform's Generative AI repository.

## Getting Started

### Prerequisites

- Flutter SDK installed on your machine.
- Firebase project set up with the necessary configurations.
- Google Cloud Vertex AI enabled for your Firebase project.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   ```

2. Navigate to the project directory:
   ```bash
   cd ai-agent_vertexai
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

### Firebase Setup

1. Add your Firebase configuration files (`google-services.json` for Android and `GoogleService-Info.plist` for iOS) to the respective directories in your Flutter project.
2. Enable Firebase Authentication and Vertex AI in your Firebase console.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Built with ❤️ using Flutter and Firebase.

