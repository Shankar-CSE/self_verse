# Contributing to Self Verse

Thanks for your interest in contributing! Community contributions help Self Verse grow.

If you like this project, please ⭐ the repository — it helps others discover it.

## Getting Started

1. Ensure you have Flutter installed: https://flutter.dev/docs/get-started/install
2. Clone the repo and install dependencies:

```bash
git clone https://github.com/Shankar-CSE/self_verse.git
cd self_verse
flutter pub get
```

3. Run the app locally:

```bash
flutter run
```

4. Run static analysis and tests:

```bash
flutter analyze
flutter test
```

## Branching & Commit Style

- Create a topic branch from `main`:
  - `feat/<short-feature-name>` for features
  - `fix/<short-bug-name>` for bug fixes
  - `docs/<short-docs-name>` for documentation
- Use Conventional Commits in messages:
  - `feat: add journaling export`
  - `fix: null check in note list`
  - `docs: update README installation`

## Code Style

- Use `dart format .` to format code before committing.
- Keep changes focused and minimal; avoid unrelated refactors.
- Follow guidelines in `analysis_options.yaml` if present.

## Pull Requests

- Describe the motivation and changes clearly.
- Include screenshots for UI changes.
- Ensure `flutter analyze` and `flutter test` pass.
- Link related issues (e.g., `Closes #123`).
- Check the PR checklist in the template.

## Reporting Issues

Use the Issue Templates to report bugs or request features. Provide clear steps and environment details.

## Discussions

Be respectful and follow the [Code of Conduct](CODE_OF_CONDUCT.md).