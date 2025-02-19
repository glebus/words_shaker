# Words Shaker

A Flutter web application that deterministically shuffles numbers based on an input phrase.

## Features

- Shuffle numbers from 1 to N (12, 18, or 24)
- Deterministic shuffling based on input phrase
- Same phrase always produces the same shuffle
- Responsive web design
- Material Design 3

## How it works

The app uses a deterministic algorithm to shuffle numbers based on the characters and their positions in the input phrase. This means:
- Same input phrase always produces the same shuffle
- Different phrases produce different shuffles
- Empty phrase shows numbers in sequential order

## Try it out

Visit [Words Shaker](https://glebus.github.io/words_shaker/) to try the app.

## Development

This project is built with Flutter. To run it locally:
bash
flutter pub get
flutter run -d chrome

To build for web:
bash
flutter build web