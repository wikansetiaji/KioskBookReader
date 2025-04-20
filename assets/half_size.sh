#!/bin/bash

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "Error: ImageMagick is not installed. Please install it first."
    echo "On Ubuntu/Debian: sudo apt-get install imagemagick"
    echo "On Fedora/RHEL: sudo dnf install ImageMagick"
    echo "On macOS: brew install imagemagick"
    exit 1
fi

# Check for input file
if [ -z "$1" ]; then
    echo "Usage: $0 <image_file>"
    echo "Example: $0 photo.jpg"
    exit 1
fi

input_file="$1"

# Verify file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found!"
    exit 1
fi

# Get original dimensions
original_dimensions=$(identify -format "%wx%h" "$input_file" 2>/dev/null)
if [ -z "$original_dimensions" ]; then
    echo "Error: '$input_file' is not a valid image file"
    exit 1
fi

original_width=$(echo "$original_dimensions" | cut -d'x' -f1)
original_height=$(echo "$original_dimensions" | cut -d'x' -f2)

# Calculate half dimensions
new_width=$((original_width / 2))
new_height=$((original_height / 2))

echo "About to resize $input_file from ${original_width}x${original_height} to ${new_width}x${new_height}"
echo "WARNING: This will overwrite the original file!"

# Safety confirmation
read -p "Are you sure you want to continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Operation cancelled."
    exit 0
fi

# Create temporary file
temp_file="${input_file%.*}_temp.${input_file##*.}"

# Perform the resize
if convert "$input_file" -resize "${new_width}x${new_height}" "$temp_file"; then
    # Replace original if resize succeeded
    mv "$temp_file" "$input_file"
    echo "Resizing complete. Original file has been replaced."
else
    echo "Error: Resizing failed. Original file remains unchanged."
    [ -f "$temp_file" ] && rm "$temp_file"
    exit 1
fi