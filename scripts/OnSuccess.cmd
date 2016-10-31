git add . 
git diff --quiet --exit-code --cached || git commit -m "Update Reference Content" && git push -u origin master && echo "Document updated"