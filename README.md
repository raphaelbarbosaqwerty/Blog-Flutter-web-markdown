# Blog Flutter Markdown source

Simple static blog with Flutter using MD files.

## Approaches and additional information
- I decided to use the Clean-dart/clean-architecture on this project for training. There are still some things that can be improved.

### Main libs
- Fluro (Routing).
- Get_it (Dependency Injection).
- flutter_markdown (Read the markdown files).
- rx_notifier (State management).

### Versions (Important)
* Flutter SDK = 1.22.5

### How to use
- Clone this repository.
- Open the `blog_flutter_fluro_template` and type this in the terminal:
```bash
flutter clean
flutter pub get
```
### Tests
- I have written some tests using TDD to follow the clean approach. You can check this by just typing this on the terminal:
```bash
flutter test
```
## Based

- Design based in `Artem Sheludko` please, check his work.

### Modifications

- Template size: folder `core/design/widget_configuration.dart`.
- Top menu and Bottom menu: `core/design/components/*`.
- Name, title, colors: `core/utils/constants.dart`.
- Routing (Fluro): folder `core/router/blog_router.dart`.
- Dependency injection: `main.dart`

## Building
- Easy to build and deploy:
```
flutter build web
```
- Access the folder `build/web` copy all files and just upload.

## New post
- Put your file in `assets/markdown_posts/` example: `assets/markdown_posts/about/0-about.md`.
- Please use the default structure for everything works, check in the example: `assets/markdown_posts/about/0-about.md`.
- For each new post, you put in the `assets/markdown_posts/` you need to build a new version, with `flutter build web`.

### Images