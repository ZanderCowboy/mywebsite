#!/bin/bash

# Script to generate firebase_options.dart from template using environment variables
# Usage: ./scripts/setup_firebase_config.sh

TEMPLATE_FILE="lib/firebase_options.dart.template"
OUTPUT_FILE="lib/firebase_options.dart"

# Check if template file exists
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file $TEMPLATE_FILE not found!"
    exit 1
fi

# Check if .env file exists for local development
ENV_FILE=".env"
if [ -f "$ENV_FILE" ]; then
    echo "Loading environment variables from $ENV_FILE"
    export $(cat $ENV_FILE | xargs)
fi

# Required environment variables
REQUIRED_VARS=(
    "FIREBASE_WEB_API_KEY"
    "FIREBASE_WEB_APP_ID"
    "FIREBASE_MESSAGING_SENDER_ID"
    "FIREBASE_PROJECT_ID"
    "FIREBASE_AUTH_DOMAIN"
    "FIREBASE_STORAGE_BUCKET"
    "FIREBASE_MEASUREMENT_ID"
    "FIREBASE_ANDROID_API_KEY"
    "FIREBASE_ANDROID_APP_ID"
    "FIREBASE_IOS_API_KEY"
    "FIREBASE_IOS_APP_ID"
    "FIREBASE_IOS_BUNDLE_ID"
)

# Check if all required environment variables are set
missing_vars=()
for var in "${REQUIRED_VARS[@]}"; do
    if [ -z "${!var}" ]; then
        missing_vars+=("$var")
    fi
done

if [ ${#missing_vars[@]} -ne 0 ]; then
    echo "Error: The following environment variables are missing:"
    for var in "${missing_vars[@]}"; do
        echo "  - $var"
    done
    echo ""
    echo "Please set them in your environment or create a .env file with these values."
    echo "Example .env file:"
    echo "FIREBASE_WEB_API_KEY=your_web_api_key_here"
    echo "FIREBASE_WEB_APP_ID=your_web_app_id_here"
    echo "# ... etc"
    exit 1
fi

# Copy template and replace placeholders
cp "$TEMPLATE_FILE" "$OUTPUT_FILE"

# Replace placeholders with environment variables
sed -i "s/{{FIREBASE_WEB_API_KEY}}/$FIREBASE_WEB_API_KEY/g" "$OUTPUT_FILE"
sed -i "s/{{FIREBASE_WEB_APP_ID}}/$FIREBASE_WEB_APP_ID/g" "$OUTPUT_FILE"
sed -i "s/{{FIREBASE_MESSAGING_SENDER_ID}}/$FIREBASE_MESSAGING_SENDER_ID/g" "$OUTPUT_FILE"
sed -i "s/{{FIREBASE_PROJECT_ID}}/$FIREBASE_PROJECT_ID/g" "$OUTPUT_FILE"
sed -i "s/{{FIREBASE_AUTH_DOMAIN}}/$FIREBASE_AUTH_DOMAIN/g" "$OUTPUT_FILE"
sed -i "s/{{FIREBASE_STORAGE_BUCKET}}/$FIREBASE_STORAGE_BUCKET/g" "$OUTPUT_FILE"
sed -i "s/{{FIREBASE_MEASUREMENT_ID}}/$FIREBASE_MEASUREMENT_ID/g" "$OUTPUT_FILE"
sed -i "s/{{FIREBASE_ANDROID_API_KEY}}/$FIREBASE_ANDROID_API_KEY/g" "$OUTPUT_FILE"
sed -i "s/{{FIREBASE_ANDROID_APP_ID}}/$FIREBASE_ANDROID_APP_ID/g" "$OUTPUT_FILE"
sed -i "s/{{FIREBASE_IOS_API_KEY}}/$FIREBASE_IOS_API_KEY/g" "$OUTPUT_FILE"
sed -i "s/{{FIREBASE_IOS_APP_ID}}/$FIREBASE_IOS_APP_ID/g" "$OUTPUT_FILE"
sed -i "s/{{FIREBASE_IOS_BUNDLE_ID}}/$FIREBASE_IOS_BUNDLE_ID/g" "$OUTPUT_FILE"

echo "Successfully generated $OUTPUT_FILE from template!"
echo "Note: This file is gitignored and will not be committed to the repository." 