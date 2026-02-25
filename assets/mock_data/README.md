# Mock Data for Development

This directory contains mock JSON data used during development and testing to avoid repeated remote config fetches.

## Usage

When running in **debug mode** (`kDebugMode`), the app automatically loads data from these local JSON files instead of fetching from Firebase Remote Config.

## Files

- `about_me.json` - About Me section data
- `profile_details.json` - Profile details (name, email, phone, etc.)
- `experience.json` - Work experience data
- `education.json` - Education data
- `projects.json` - Project portfolio data
- `skills.json` - Skills and proficiencies

## Images

In debug mode, all images use placeholder images from `placeholder.com` to:

- Avoid repeated network requests
- Speed up development
- Reduce bandwidth usage

## Automatic Behavior

The `RemoteConfigService` automatically:

1. Detects when running in debug mode (`kDebugMode`)
2. Skips Firebase Remote Config initialization
3. Loads data from local JSON files
4. Returns placeholder image URLs

No code changes needed - just run in debug mode!

## Switching to Production

When building for **release mode**, the app automatically:

- Initializes Firebase Remote Config
- Fetches real data from remote config
- Loads real images

## Modifying Mock Data

To change mock data:

1. Edit the JSON files in this directory
2. Ensure the structure matches the corresponding DTO models in `lib/models/api/`
3. Hot reload or restart the app
