// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "bootstrap/dist/js/bootstrap.esm.js"
import "@fortawesome/fontawesome-pro/js/all"
import { ImageResizer } from "./image-resizer"

// Initialize image resizer for file inputs when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
  // Find all file inputs that should have image compression
  const imageInputs = document.querySelectorAll('input[type="file"][accept*="image"]');
  
  imageInputs.forEach((input) => {
    ImageResizer.attachToFileInput(input as HTMLInputElement);
  });
});

// Also initialize for dynamically added content (Turbo navigation)
document.addEventListener('turbo:load', () => {
  const imageInputs = document.querySelectorAll('input[type="file"][accept*="image"]');
  
  imageInputs.forEach((input) => {
    // Check if already initialized to avoid double-binding
    if (!(input as any)._imageResizerInitialized) {
      ImageResizer.attachToFileInput(input as HTMLInputElement);
      (input as any)._imageResizerInitialized = true;
    }
  });
});
