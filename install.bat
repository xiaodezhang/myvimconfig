REM cp _vimrc  ~/_vimrc
cd gtags
7z -y x glo662wb.zip
mv bin/* ~
mv lib/* ~
mv share/* ~
rm -rf bin lib share
cd ../
gvim +PluginInstall +qall
