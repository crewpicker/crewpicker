import imageCompression from 'browser-image-compression';

export class ImageResizer {
  static readonly DEFAULT_OPTIONS = {
    maxSizeMB: 16, // Maximum file size in MB
    maxWidthOrHeight: 2560, // Maximum width or height
    useWebWorker: true, // Use web worker for better performance
    fileType: 'image/jpeg', // Convert to JPEG for better compression
    quality: 0.85 // JPEG quality (0.1 - 1.0)
  };

  /**
   * Resize and compress an image file
   * @param file - The original image file
   * @param options - Compression options (optional)
   * @returns Promise<Blob> - The compressed image blob
   */
  static async compressImage(file: File, options = {}): Promise<Blob> {
    const compressionOptions = { ...this.DEFAULT_OPTIONS, ...options };
    
    try {
      console.log('Original file size:', (file.size / 1024 / 1024).toFixed(2), 'MB');
      
      const compressedFile = await imageCompression(file, compressionOptions);
      
      console.log('Compressed file size:', (compressedFile.size / 1024 / 1024).toFixed(2), 'MB');
      
      return compressedFile;
    } catch (error) {
      console.error('Image compression failed:', error);
      throw error;
    }
  }

  /**
   * Attach image resizer to a file input element
   * @param fileInput - The file input element
   * @param options - Compression options (optional)
   */
  static attachToFileInput(fileInput: HTMLInputElement, options = {}) {
    if (!fileInput || fileInput.type !== 'file') {
      throw new Error('Invalid file input element');
    }

    fileInput.addEventListener('change', async (event) => {
      const target = event.target as HTMLInputElement;
      const files = target.files;
      
      if (!files || files.length === 0) return;

      const file = files[0];
      
      // Check if it's an image
      if (!file.type.startsWith('image/')) {
        return; // Not an image, let it proceed normally
      }

      // Check if this file has already been processed to avoid infinite loop
      if ((file as any)._isCompressed) {
        return; // Already compressed, don't process again
      }

      // Show loading indicator if available
      const loadingIndicator = this.createLoadingIndicator();
      fileInput.parentNode?.insertBefore(loadingIndicator, fileInput.nextSibling);
      
      try {
        // Disable the input during compression
        fileInput.disabled = true;
        
        const compressedBlob = await this.compressImage(file, options);
        
        // Convert the compressed blob back to a File object
        const compressedFile = new File([compressedBlob], file.name, {
          type: compressedBlob.type,
          lastModified: Date.now()
        });
        
        // Mark the compressed file to prevent reprocessing
        (compressedFile as any)._isCompressed = true;
        
        // Create a new FileList with the compressed file
        const dataTransfer = new DataTransfer();
        dataTransfer.items.add(compressedFile);
        target.files = dataTransfer.files;
        
        // Don't dispatch a new change event - this was causing the loop
        
      } catch (error) {
        console.error('Failed to compress image:', error);
        // Keep the original file if compression fails
        alert('Image compression failed. The original image will be uploaded.');
      } finally {
        // Re-enable the input and remove loading indicator
        fileInput.disabled = false;
        loadingIndicator.remove();
      }
    });
  }

  /**
   * Create a loading indicator element
   */
  private static createLoadingIndicator(): HTMLElement {
    const indicator = document.createElement('div');
    indicator.className = 'image-compression-loading';
    indicator.innerHTML = `
      <small class="text-muted">
        <i class="fas fa-spinner fa-spin"></i> 
        Komprimerer bilde...
      </small>
    `;
    indicator.style.marginTop = '5px';
    return indicator;
  }
}