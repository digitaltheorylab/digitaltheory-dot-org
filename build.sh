#!/bin/bash
set -e  # Exit on error
set -x  # Print commands for debugging

echo "=== Starting build ==="
echo "Timestamp: $(date)"

# Setup paths
REPO_DIR="$(pwd)"
RHEO_VERSION="v0.1.2"
RHEO_CACHE="$REPO_DIR/.rheo-binary"
RHEO_BIN="$RHEO_CACHE/rheo"

# Download rheo binary from GitHub release if not cached
if [ ! -f "$RHEO_BIN" ]; then
  echo "Downloading rheo ${RHEO_VERSION}..."
  mkdir -p "$RHEO_CACHE"
  curl -sL "https://github.com/freecomputinglab/rheo/releases/download/${RHEO_VERSION}/rheo-x86_64-unknown-linux-gnu.zip" -o /tmp/rheo.zip
  unzip -o /tmp/rheo.zip -d "$RHEO_CACHE"
  chmod +x "$RHEO_BIN"
  rm /tmp/rheo.zip
  echo "Rheo downloaded successfully"
else
  echo "Using cached rheo binary"
fi

# Add rheo to PATH
export PATH="$RHEO_CACHE:$PATH"

# Verify rheo is accessible
rheo --version || echo "Warning: rheo --version failed, but continuing..."

# Download private fonts if FONTS_GITHUB_TOKEN is set (used in CI/CD)
if [ -n "${FONTS_GITHUB_TOKEN}" ]; then
  echo "Downloading fonts from private repository..."
  mkdir -p fonts
  FONT_FILES=(
    "BerkeleyMono-Regular.ttf"
    "BerkeleyMono-Bold.ttf"
    "BerkeleyMono-Oblique.ttf"
    "BerkeleyMono-Bold-Oblique.ttf"
  )
  for font in "${FONT_FILES[@]}"; do
    curl -fsSL \
      -H "Authorization: Bearer ${FONTS_GITHUB_TOKEN}" \
      -H "Accept: application/vnd.github.raw+json" \
      "https://api.github.com/repos/digitaltheorylab/fonts/contents/${font}" \
      -o "fonts/${font}"
    echo "Downloaded: ${font}"
  done
  echo "Fonts downloaded successfully"
else
  echo "FONTS_GITHUB_TOKEN not set; using fonts from working directory"
fi

# Compile the project
echo "Compiling with rheo..."
rheo compile . --html

# Copy over images
cp -r content/img build/html/img

# Verify output was generated
if [ ! -f "build/html/index.html" ]; then
  echo "Error: build/html/index.html not found after compilation"
  exit 1
fi

# Count generated HTML files
HTML_COUNT=$(find build/html -name "*.html" | wc -l)
echo "Successfully generated $HTML_COUNT HTML files"

echo "=== Build completed successfully ==="
echo "Timestamp: $(date)"
