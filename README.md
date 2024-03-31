# lightburn-thumbnailer
show thumbnailers for lightburn files

# installation
1. clone this repository and go to the folder
    ```
   git clone https://github.com/gnukleo/lightburn-thumbnailer.git
    ```
    ```
   cd lightburn-thumbnailer
   ```
# automatic installation
2. set executable installer file
   ```
   chmod +x install_LightBurn_Thumbnailer.sh
   ```
3. done!

# manual installation
2. create directory for thumbnailers if not exist and copy the thumbnailer entry
   ```
   mkdir -p $HOME/.local/share/thumbnailers
   ```
   ```
   cp lbrn2.thumbnailer $HOME/.local/share/thumbnailers/
   ```
3. create directory for mimetype and copy the mime file
   ```
   mkdir -p $HOME/.local/share/mime/packages
   ```
   ```
   cp org.gnukleo.LightBurn.mime.xml $HOME/.local/share/mime/packages/
   ```
4. copy the script for extract and create a thumbnail, and set executable
   ```
   sudo cp lbrn2-thumbnailer.py /usr/local/bin/
   ```
   ```
   sudo chmod +x /usr/local/bin/lbrn2-thumbnailer.py
   ```
5. optionally we copy the icons that will be displayed when the thumbnail fails, usually it happens with the recovery *_backup* files
   ```
   mkdir -p $HOME/.local/share/icons/hicolor/scalable/apps
   ```
   ```
   cp org.gnukleo.LightBurn.svg $HOME/.local/share/icons/hicolor/scalable/apps/
   ```
   ```
   mkdir -p $HOME/.local/share/icons/hicolor/scalable/mimetypes
   ```
   ```
   cp org.gnukleo.LightBurn.mime.svg $HOME/.local/share/icons/hicolor/scalable/mimetypes/
   ```
   ```
   mkdir -p $HOME/.local/share/icons/hicolor/symbolic/apps
   ```
   ```
   cp org.gnukleo.LightBurn-symbolic.svg $HOME/.local/share/icons/hicolor/symbolic/apps/
   ```
6. now close all instances for nautilus
   ```
   nautilus -q
   ```
7. remove all the thumbnails from the cache, this so that they are all refreshed and we do not have errors from failed images
   ```
   rm -r $HOME/.cache/thumbnails
   ```
8. and finally refresh the mime database
   ```
   update-mime-database $HOME/.local/share/mime/
   ```
9. done, now open nautilus and navigate to any folder that has lbrn2 files saved
