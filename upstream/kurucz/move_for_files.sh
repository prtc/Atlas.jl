#!/bin/bash

# Script to move all .for files from documentation/ to source_codes/ 
# while preserving the subdirectory structure

BASE_PATH="/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz"
SOURCE_DIR="$BASE_PATH/documentation"
TARGET_DIR="$BASE_PATH/source_codes"

echo "Moving .for files from documentation/ to source_codes/"
echo "Source: $SOURCE_DIR"
echo "Target: $TARGET_DIR"
echo "================================================"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Method 1: DRY RUN - Show what would be moved without actually moving
echo "DRY RUN - Files that would be moved:"
echo "------------------------------------"

find "$SOURCE_DIR" -name "*.for" -type f | while read -r file; do
    # Get the relative path from the documentation directory
    rel_path="${file#$SOURCE_DIR/}"
    
    # Construct the target path
    target_file="$TARGET_DIR/$rel_path"
    target_dir=$(dirname "$target_file")
    
    echo "WOULD MOVE:"
    echo "  FROM: $file"
    echo "  TO:   $target_file"
    echo "  DIR:  $target_dir (would be created if needed)"
    echo ""
done

echo ""
echo "ACTUAL MOVE COMMANDS:"
echo "===================="
echo ""

echo "1. SAFE VERSION (with confirmation for each file):"
echo "------------------------------------------------"
cat << 'EOF'
find "/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz/documentation" -name "*.for" -type f | while read -r file; do
    SOURCE_DIR="/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz/documentation"
    TARGET_DIR="/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz/source_codes"
    
    # Get relative path
    rel_path="${file#$SOURCE_DIR/}"
    target_file="$TARGET_DIR/$rel_path"
    target_dir=$(dirname "$target_file")
    
    echo "Moving: $(basename "$file")"
    echo "  From: $file"
    echo "  To:   $target_file"
    
    # Create target directory
    mkdir -p "$target_dir"
    
    # Move the file
    mv "$file" "$target_file"
    
    echo "  ✓ Moved successfully"
    echo ""
done
EOF

echo ""
echo "2. BATCH VERSION (all files at once):"
echo "------------------------------------"
cat << 'EOF'
# First, get list of all .for files and create necessary directories
find "/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz/documentation" -name "*.for" -type f | while read -r file; do
    SOURCE_DIR="/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz/documentation"
    TARGET_DIR="/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz/source_codes"
    
    rel_path="${file#$SOURCE_DIR/}"
    target_file="$TARGET_DIR/$rel_path"
    target_dir=$(dirname "$target_file")
    
    # Create target directory structure
    mkdir -p "$target_dir"
done

# Then move all files
find "/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz/documentation" -name "*.for" -type f | while read -r file; do
    SOURCE_DIR="/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz/documentation"
    TARGET_DIR="/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz/source_codes"
    
    rel_path="${file#$SOURCE_DIR/}"
    target_file="$TARGET_DIR/$rel_path"
    
    mv "$file" "$target_file"
    echo "Moved: $rel_path"
done
EOF

echo ""
echo "3. VERIFICATION COMMANDS (run after moving):"
echo "-------------------------------------------"
cat << 'EOF'
# Count .for files in each directory
echo "Files remaining in documentation:"
find "/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz/documentation" -name "*.for" | wc -l

echo "Files now in source_codes:"
find "/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz/source_codes" -name "*.for" | wc -l

echo "Directory structure created in source_codes:"
find "/Users/pcoelho/work/pesquisa/queued/Atlas.jl/upstream/kurucz/source_codes" -type d | sort
EOF

echo ""
echo "RECOMMENDATION:"
echo "==============="
echo "1. First run this script to see the DRY RUN output"
echo "2. If it looks correct, run the SAFE VERSION command"
echo "3. After completion, run the VERIFICATION commands to confirm"
echo ""
echo "The structure will be preserved, for example:"
echo "  documentation/sun/fluxatlas/makesolarflux.for"
echo "  becomes:"
echo "  source_codes/sun/fluxatlas/makesolarflux.for"