# Skills Logo Images

To add local logo images for the skills section, place PNG files in this directory with the following names:

## Programming Languages

- `flutter.png` - Flutter logo
- `dart.png` - Dart logo
- `c_plus_plus.png` - C++ logo (note: + becomes _plus_)
- `csharp.png` - C# logo (note: # becomes sharp)
- `python.png` - Python logo
- `javascript.png` - JavaScript logo

## Frameworks & Tools

- `firebase.png` - Firebase logo
- `git.png` - Git logo
- `vs_code.png` - VS Code logo (note: space becomes \_)
- `android.png` - Android logo
- `figma.png` - Figma logo

## State Management

- `getx.png` - GetX logo
- `provider.png` - Provider logo

## Image Requirements

- Format: PNG (recommended for transparency)
- Size: Preferably 40x40 pixels or larger (will be scaled to 40x40)
- Background: Transparent or white background works best

## How It Works

1. The app first checks if a local asset exists for each skill
2. If a local asset exists, it uses that image
3. If no local asset exists, it tries to load from the network URL
4. If network loading fails, it falls back to a Material Design icon

You can add as many or as few local images as you want. The system will automatically handle the fallbacks.
