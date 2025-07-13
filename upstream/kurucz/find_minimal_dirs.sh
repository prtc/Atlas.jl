#!/bin/bash

# Script to find directories that only contain a minimal index.html file
# Usage: ./find_minimal_dirs.sh [base_path]

BASE_PATH="${1:-/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz}"

echo "Searching for directories with only index.html files in: $BASE_PATH"
echo "================================================================"

# Method 1: Find directories with exactly one file that is index.html
echo "Method 1: Directories with exactly one file (index.html):"
echo "----------------------------------------------------------"

find "$BASE_PATH" -type d -exec sh -c '
    dir="$1"
    # Count total files in directory (excluding subdirectories)
    file_count=$(find "$dir" -maxdepth 1 -type f | wc -l)
    
    if [ "$file_count" -eq 1 ]; then
        # Check if the only file is index.html
        only_file=$(find "$dir" -maxdepth 1 -name "index.html" -type f)
        if [ -n "$only_file" ]; then
            echo "$dir"
        fi
    fi
' _ {} \;

echo ""
echo "Method 2: More detailed analysis with file sizes:"
echo "------------------------------------------------"

# Method 2: Find directories with only index.html and show file sizes for verification
find "$BASE_PATH" -type d -exec sh -c '
    dir="$1"
    # Get all files in the directory
    files=$(find "$dir" -maxdepth 1 -type f)
    file_count=$(echo "$files" | grep -c .)
    
    if [ "$file_count" -eq 1 ]; then
        # Check if it'\''s index.html
        if echo "$files" | grep -q "index.html$"; then
            file_size=$(ls -lh "$files" | awk '\''{print $5}'\'')
            echo "$(printf "%-80s" "$dir") Size: $file_size"
        fi
    fi
' _ {} \;

echo ""
echo "Method 3: Check for 'minimal' index.html files (small size, typical content):"
echo "--------------------------------------------------------------------------"

# Method 3: Find index.html files that are likely minimal/empty directory listings
find "$BASE_PATH" -name "index.html" -type f -exec sh -c '
    file="$1"
    dir=$(dirname "$file")
    
    # Count files in directory
    file_count=$(find "$dir" -maxdepth 1 -type f | wc -l)
    
    if [ "$file_count" -eq 1 ]; then
        # Check file size (minimal index.html files are typically small)
        file_size=$(wc -c < "$file")
        
        # Check if file contains minimal content indicators
        if [ "$file_size" -lt 1000 ]; then
            # Check for typical minimal index.html patterns
            if grep -q "creationdates.dat" "$file" && [ "$(grep -c "href=" "$file")" -le 3 ]; then
                echo "MINIMAL: $(printf "%-70s" "$dir") Size: ${file_size} bytes"
            elif ! grep -q "href=" "$file" || [ "$(grep -c "href=" "$file")" -le 2 ]; then
                echo "EMPTY:   $(printf "%-70s" "$dir") Size: ${file_size} bytes"
            fi
        fi
    fi
' _ {} \;

echo ""
echo "Summary Commands:"
echo "================"
echo ""
echo "To list all directories with only index.html:"
echo 'find "'$BASE_PATH'" -type d -exec sh -c '\''dir="$1"; [ $(find "$dir" -maxdepth 1 -type f | wc -l) -eq 1 ] && [ -f "$dir/index.html" ] && echo "$dir"'\'' _ {} \;'
echo ""
echo "To remove all minimal index.html files:"
echo 'find "'$BASE_PATH'" -name "index.html" -type f -exec sh -c '\''file="$1"; dir=$(dirname "$file"); [ $(find "$dir" -maxdepth 1 -type f | wc -l) -eq 1 ] && rm -v "$file"'\'' _ {} \;'
echo ""
echo "To remove entire directories with only index.html:"
echo 'find "'$BASE_PATH'" -type d -exec sh -c '\''dir="$1"; [ $(find "$dir" -maxdepth 1 -type f | wc -l) -eq 1 ] && [ -f "$dir/index.html" ] && rmdir -v "$dir"'\'' _ {} \;'