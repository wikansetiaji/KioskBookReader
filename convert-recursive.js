const fs = require('fs');
const path = require('path');
const sharp = require('sharp');

const startDir = path.join(__dirname, 'assets'); // Set your root asset folder here

function processDirectory(dir) {
  fs.readdir(dir, { withFileTypes: true }, (err, entries) => {
    if (err) {
      console.error(`❌ Error reading directory ${dir}:`, err);
      return;
    }

    entries.forEach(entry => {
      const fullPath = path.join(dir, entry.name);

      if (entry.isDirectory()) {
        processDirectory(fullPath); // Recurse
      } else if (entry.isFile() && /\.(jpe?g)$/i.test(entry.name)) {
        const webpPath = path.join(
          dir,
          path.basename(entry.name, path.extname(entry.name)) + '.webp'
        );

        sharp(fullPath)
          .webp({ quality: 80 })
          .toFile(webpPath)
          .then(() => {
            fs.unlink(fullPath, err => {
              if (err) console.error(`❌ Could not delete ${fullPath}:`, err);
              else console.log(`✅ Converted and deleted: ${fullPath}`);
            });
          })
          .catch(err => {
            console.error(`❌ Failed to convert ${fullPath}:`, err);
          });
      }
    });
  });
}

processDirectory(startDir);
