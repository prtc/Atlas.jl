#!/bin/bash

# Commands to delete only the files/directories identified by Method 3
# These match the exact criteria: small size + minimal content

BASE_PATH="/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz"

echo "Method 3 Cleanup Commands"
echo "========================="
echo ""

echo "1. TO DELETE ONLY THE MINIMAL INDEX.HTML FILES (keeps directories):"
echo "--------------------------------------------------------------------"
echo ""
cat << 'EOF'
find "/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz" -name "index.html" -type f -exec sh -c '
    file="$1"
    dir=$(dirname "$file")
    
    # Only process if directory has exactly one file
    file_count=$(find "$dir" -maxdepth 1 -type f | wc -l)
    if [ "$file_count" -eq 1 ]; then
        # Check file size (< 1000 bytes)
        file_size=$(wc -c < "$file")
        if [ "$file_size" -lt 1000 ]; then
            # Check for minimal content patterns
            if grep -q "creationdates.dat" "$file" && [ "$(grep -c "href=" "$file")" -le 3 ]; then
                echo "REMOVING MINIMAL: $file (${file_size} bytes)"
                rm -v "$file"
            elif ! grep -q "href=" "$file" || [ "$(grep -c "href=" "$file")" -le 2 ]; then
                echo "REMOVING EMPTY: $file (${file_size} bytes)"
                rm -v "$file"
            fi
        fi
    fi
' _ {} \;
EOF

echo ""
echo "2. TO DELETE THE ENTIRE DIRECTORIES (after removing the index.html files):"
echo "--------------------------------------------------------------------------"
echo ""
cat << 'EOF'
find "/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz" -type d -exec sh -c '
    dir="$1"
    
    # Check if directory is now empty (no files at all)
    file_count=$(find "$dir" -maxdepth 1 -type f | wc -l)
    if [ "$file_count" -eq 0 ]; then
        # Check if directory has no subdirectories either
        subdir_count=$(find "$dir" -maxdepth 1 -type d | wc -l)
        if [ "$subdir_count" -eq 1 ]; then  # Only the directory itself
            echo "REMOVING EMPTY DIRECTORY: $dir"
            rmdir -v "$dir"
        fi
    fi
' _ {} \;
EOF

echo ""
echo "3. COMBINED COMMAND (removes files and then empty directories in one go):"
echo "------------------------------------------------------------------------"
echo ""
cat << 'EOF'
find "/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz" -name "index.html" -type f -exec sh -c '
    file="$1"
    dir=$(dirname "$file")
    
    # Only process if directory has exactly one file
    file_count=$(find "$dir" -maxdepth 1 -type f | wc -l)
    if [ "$file_count" -eq 1 ]; then
        # Check file size (< 1000 bytes)
        file_size=$(wc -c < "$file")
        if [ "$file_size" -lt 1000 ]; then
            # Check for minimal content patterns
            if grep -q "creationdates.dat" "$file" && [ "$(grep -c "href=" "$file")" -le 3 ]; then
                echo "REMOVING MINIMAL: $file (${file_size} bytes)"
                rm -v "$file"
                # Try to remove directory if now empty
                rmdir "$dir" 2>/dev/null && echo "REMOVED EMPTY DIRECTORY: $dir"
            elif ! grep -q "href=" "$file" || [ "$(grep -c "href=" "$file")" -le 2 ]; then
                echo "REMOVING EMPTY: $file (${file_size} bytes)"
                rm -v "$file"
                # Try to remove directory if now empty
                rmdir "$dir" 2>/dev/null && echo "REMOVED EMPTY DIRECTORY: $dir"
            fi
        fi
    fi
' _ {} \;
EOF

echo ""
echo "4. DRY RUN COMMAND (to see what would be deleted without actually deleting):"
echo "--------------------------------------------------------------------------"
echo ""
cat << 'EOF'
find "/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz" -name "index.html" -type f -exec sh -c '
    file="$1"
    dir=$(dirname "$file")
    
    # Only process if directory has exactly one file
    file_count=$(find "$dir" -maxdepth 1 -type f | wc -l)
    if [ "$file_count" -eq 1 ]; then
        # Check file size (< 1000 bytes)
        file_size=$(wc -c < "$file")
        if [ "$file_size" -lt 1000 ]; then
            # Check for minimal content patterns
            if grep -q "creationdates.dat" "$file" && [ "$(grep -c "href=" "$file")" -le 3 ]; then
                echo "WOULD DELETE MINIMAL: $file (${file_size} bytes)"
                echo "WOULD DELETE DIRECTORY: $dir"
            elif ! grep -q "href=" "$file" || [ "$(grep -c "href=" "$file")" -le 2 ]; then
                echo "WOULD DELETE EMPTY: $file (${file_size} bytes)"
                echo "WOULD DELETE DIRECTORY: $dir"
            fi
        fi
    fi
' _ {} \;
EOF

echo ""
echo "RECOMMENDATION:"
echo "==============="
echo "1. First run the DRY RUN command (option 4) to see what would be deleted"
echo "2. If the results look correct, run the COMBINED command (option 3)"
echo "3. Alternatively, run option 1 first, then option 2 if you want more control"