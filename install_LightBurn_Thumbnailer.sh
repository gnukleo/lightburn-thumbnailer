# copy thumbnailer entry
mkdir -p $HOME/.local/share/thumbnailers
cp lbrn2.thumbnailer $HOME/.local/share/thumbnailers/

# copy mimetype
mkdir -p $HOME/.local/share/mime/packages
cp org.gnukleo.LightBurn.mime.xml $HOME/.local/share/mime/packages/

# copy thumbnailer factory
sudo cp lbrn2-thumbnailer.py /usr/local/bin/
sudo chmod +x /usr/local/bin/lbrn2-thumbnailer.py

# copy custom icon
mkdir -p $HOME/.local/share/icons/hicolor/scalable/apps
cp org.gnukleo.LightBurn.svg $HOME/.local/share/icons/hicolor/scalable/apps/

mkdir -p $HOME/.local/share/icons/hicolor/scalable/mimetypes
cp org.gnukleo.LightBurn.mime.svg $HOME/.local/share/icons/hicolor/scalable/mimetypes/

mkdir -p $HOME/.local/share/icons/hicolor/symbolic/apps
cp org.gnukleo.LightBurn-symbolic.svg $HOME/.local/share/icons/hicolor/symbolic/apps/

# NOW close all nautilus process
nautilus -q

# remove all cache images
rm -r $HOME/.cache/thumbnails

# update the database mime types
update-mime-database $HOME/.local/share/mime/

# DONE!
echo "Installing done! please open nautilus and navigate to the folder with the LightBurn files"
echo "if any error, send your feedback"
