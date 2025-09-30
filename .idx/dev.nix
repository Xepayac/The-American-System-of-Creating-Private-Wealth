# shell.nix

# This is a basic Nix shell expression.
# It uses the default 'nixpkgs' channel currently configured on your system.
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # These are the packages that will be available on your PATH when you enter the shell.
  packages = with pkgs; [
    # 1. Conversion Tool: The universal markup converter.
    # Essential for turning your Markdown files into PDF, EPUB, DOCX, etc.
    pandoc 
    
    # 2. PDF Compiler: LaTeX distribution required by Pandoc to generate high-quality PDFs.
    # We use a compact scheme to save on download/build time.
    texlive.combined.scheme-basic

    # 3. Version Control: Essential for working with GitHub.
    git 
  ];

  # Optional: A startup message and a common alias to make things easier
  shellHook = ''
    echo "✍️ Entering simple writing environment (pandoc, git available)."
    # Create an alias to compile your book (adjust 'my_book.md' as needed)
    alias compile-book="pandoc --pdf-engine=xelatex my_book.md -o my_book.pdf"
    
  '';
}