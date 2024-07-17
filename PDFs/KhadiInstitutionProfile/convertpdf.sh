#!/bin/bash

# Directory containing the PDF files
PDF_DIR="/home/justdial/Development/KhadiInstitutionProfileAll/"
# Output directory for the HTML files
OUTPUT_DIR="/home/justdial/Development/KhadiInstitutionProfileAllHTML"

# Ensure the output directory exists
mkdir -p "$OUTPUT_DIR"

# Loop over all PDF files in the specified directory
for pdf_file in "$PDF_DIR"/*.pdf; do
    # Get the base name of the PDF file (without the directory and extension)
    base_name=$(basename "$pdf_file" .pdf)
    
    # Convert the PDF to HTML using pdftohtml
    pdftohtml "$pdf_file" "$OUTPUT_DIR/$base_name"
    
    echo "Converted $pdf_file to $OUTPUT_DIR/$base_name.html"
done

echo "All PDF files have been converted."

