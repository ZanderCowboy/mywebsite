# mywebsite

A responsive personal portfolio and website built with **Flutter** and **Dart**, featuring a dark-themed UI, Firebase integration, and a mobile-first responsive layout.

---

## About

This project is a multi-page portfolio site with:

- **Home** — Landing page with hero section, call-to-action, and navigation to the personal section
- **Personal** — Profile and detailed sections: About Me, Experience, Projects, Skills, and Education

Content can be driven by **Firebase Remote Config** (e.g. images), with **Firebase Analytics** for usage insights. The app is responsive across mobile, tablet, desktop, and large screens (4K).

---

## Tech stack

| Category | Technologies |
| ---------- | ------------ |
| **Framework** | Flutter, Dart |
| **Backend** | Firebase (Core, Analytics, Remote Config) |
| **UI** | Material Design, custom typography (Playfair Display, Anton, Poiret One), responsive breakpoints |
| **Tooling** | Auto Mappr, Flutter Gen, Very Good Analysis |

---

## Getting started

### Prerequisites

![Flutter](https://img.shields.io/badge/Flutter-3.41.2-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.11.0-blue?logo=dart)
![Remote Config](https://img.shields.io/badge/firebase-Remote_Config-ec6d00?style=flat&logo=firebase&link=https%3A%2F%2Fconsole.firebase.google.com%2F)
![Analytics](https://img.shields.io/badge/firebase-Analytics-ec6d00?style=flat&logo=firebase&link=https%3A%2F%2Fconsole.firebase.google.com%2F)

### Run the app

```bash
# Install dependencies
flutter pub get

# Run on Chrome (web)
flutter run -d chrome

# Or run on your default device
flutter run
```

### Code generation

When you change models or mappers, regenerate code with:

```bash
dart run build_runner build
```

---

## Project structure

```md
lib/
├── bootstrap.dart          # App startup (Firebase, Remote Config, image loading)
├── main.dart               # App entry, routes, responsive breakpoints
├── components/             # Reusable UI (hero, background, links, social pills, etc.)
├── models/                 # Domain & API models, DTOs, enums
├── mappers/                # DTO ↔ domain mappers (Auto Mappr)
├── services/               # Analytics, Remote Config, image loading, app info
├── util/                   # Constants, typography, colors, extensions
├── views/
│   ├── home/               # Home page and widgets
│   └── personal/           # Personal page, profile, details (tabs)
└── gen/                    # Generated assets (flutter_gen)
```

---

## Credits & resources

Attribution for external resources used in this project:

| Resource | Link |
| -------- | ---- |
| **Icons** | [Icons8](https://icons8.com) |
| **Home background** | Photo by [James Wheeler](https://www.pexels.com/photo/lake-and-mountain-417074/) (Pexels) |
| **Personal page background** | Photo by [Pok Rie](https://www.pexels.com/photo/top-view-photo-of-rocky-shore-2049422/) (Pexels) |
| **Skills / tech icons** | [Tech Icons](https://techicons.dev/icons/cplusplus), [SVG Repo](https://www.svgrepo.com/) |
| **Badges** | [Badges](https://shields.io/badges) |

---

## License

This project is open source. See the repository and author for usage terms and license [available here](./LICENSE)
