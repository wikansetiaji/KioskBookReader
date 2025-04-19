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

# Check dependencies
if ! command -v magick &> /dev/null && ! command -v convert &> /dev/null; then
    echo "ImageMagick is not installed. Please install it using 'brew install imagemagick'"
    exit 1
fi
if ! command -v gs &> /dev/null; then
    echo "Ghostscript is not installed. Please install it using 'brew install ghostscript'"
    exit 1
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Use temp output pattern to capture pages
TEMP_PATTERN="$OUTPUT_DIR/tmp_%d.jpg"
PAGE_RANGE=""
if [ "$MAX_PAGES" -gt 0 ]; then
    LAST_PAGE=$((MAX_PAGES - 1))
    PAGE_RANGE="[0-$LAST_PAGE]"
fi

# Use magick or convert
if command -v magick &> /dev/null; then
    magick -density "$DPI" "$INPUT_PDF$PAGE_RANGE" -quality 100 "$TEMP_PATTERN"
else
    convert -density "$DPI" "$INPUT_PDF$PAGE_RANGE" -quality 100 "$TEMP_PATTERN"
fi

# Rename files from tmp_0.jpg -> 0.jpg (etc.)
i=0
for file in "$OUTPUT_DIR"/tmp_*.jpg; do
    mv "$file" "$OUTPUT_DIR/$i.jpg"
    ((i++))
done

echo "✅ Conversion complete! JPGs saved in: $OUTPUT_DIR (0.jpg, 1.jpg, ...)"
