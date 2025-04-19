#!/bin/bash

# Usage: ./pdf_to_jpg.sh input.pdf output_dir [dpi] [max_pages]

set -e

INPUT_PDF="$1"
OUTPUT_DIR="$2"
DPI="${3:-300}"                # Default DPI = 300
MAX_PAGES="${4:-0}"            # 0 means convert all pages

# Validate arguments
if [ -z "$INPUT_PDF" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Usage: $0 input.pdf output_dir [dpi] [max_pages]"
    exit 1
fi

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null && ! command -v convert &> /dev/null; then
    echo "ImageMagick is not installed. Please install it using 'brew install imagemagick'"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Build page range (ImageMagick uses [0] for page 1)
PAGE_RANGE=""
if [ "$MAX_PAGES" -gt 0 ]; then
    LAST_PAGE=$((MAX_PAGES - 1))
    PAGE_RANGE="[0-$LAST_PAGE]"
fi

# Use `magick` if available
if command -v magick &> /dev/null; then
    magick -density "$DPI" "$INPUT_PDF$PAGE_RANGE" -quality 100 "$OUTPUT_DIR/page_%03d.jpg"
else
    convert -density "$DPI" "$INPUT_PDF$PAGE_RANGE" -quality 100 "$OUTPUT_DIR/page_%03d.jpg"
fi

echo "✅ Conversion complete! JPGs saved in: $OUTPUT_DIR"
