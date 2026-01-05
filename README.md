## 🌡️ Transitor – Collapsible & Resizable Header for Flutter
A lightweight Flutter library that provides a smooth, scroll-driven, resizable header (transitor effect).
Perfect for weather apps, dashboards, profiles, and modern UI designs.

---
## ✨ Features

- 🔄 Auto resize on scroll

- 📱 Fully responsive (no overflow)

- 🧩 Reusable & library-friendly

- 🎛 Nullable constructor properties

- 🚀 Smooth animations

- 🌓 Light & Dark theme compatible

- ❌ No RenderFlex overflow issues

---
## Preview 

https://github.com/user-attachments/assets/531e08b5-1b06-4cb0-8a5a-7762338fc023

---
## 📦 Installation

Add this to your pubspec.yaml:
```
dependencies:
  flutter_image_compression:
    git:
      url: https://github.com/Excelsior-Technologies-Communitye/flutter_transitioner.git
```

then run:
```
flutter pub get
```
---
## 📂 Library Structure
```
transitor/
├─ lib/    
│  └─ src/
│     └─ collapsible_header.dart
├─ example/
│  └─ lib/
│     └─ main.dart          # Demo app
├─ pubspec.yaml
└─ README.md
```

---
## 🚀 Basic Usage
### 1️⃣ Import the library
```
import 'package:flutter_transitioner/src/flutter_transitioner.dart';
```
### 2️⃣ Use in main.dart
```
FullscreenReveal(
  fullscreenContent: FullWeatherView(),
  minimizedContent: MiniWeatherView(),
  hiddenList: weatherListItems,
  listBackgroundColor: Colors.white,
  listCornerRadius: 24,
  scrollHintText: 'Swipe up to see forecast',
);
```
## 🧩 Widget Properties

| Property Name | Type | Required | Description |
|--------------|------|----------|-------------|
| `fullscreenContent` | `Widget` | ✅ Yes | Main widget shown in fullscreen / expanded state |
| `minimizedContent` | `Widget?` | ❌ No | Widget shown when view is minimized |
| `hiddenList` | `List<Widget>` | ✅ Yes | Widgets revealed when expanded |
| `listBackgroundColor` | `Color` | ❌ No | Background color of the hidden list |
| `listCornerRadius` | `double` | ❌ No | Border radius for list container |
| `scrollHintText` | `String` | ❌ No | Hint text shown to guide scrolling |

---
## 🛡️ Why Use Transitor?
```
✔ Avoids layout overflow
✔ Clean separation of UI & logic
✔ Ideal for library & production apps
✔ Smooth UX similar to modern apps
```
---
## 🎨 Example Output
```
┌──────────────────────────────┐
│ Blake            🌙           │
│                              │
│          -11°                │
│       Clear Sky              │
└───────────────╮              │
                ▼  Scroll ↓
┌──────────────────────────────┐
│ Weather Item 1               │
│ Weather Item 2               │
│ Weather Item 3               │
└──────────────────────────────┘
```
---
## 📄 MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
