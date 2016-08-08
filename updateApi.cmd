CALL dnu commands install docfx

CALL git clone git@github.com:Azure/azure-docs-sdk-dotnet.git

CD azure-docs-sdk-dotnet
CALL docfx metadata docfx.json

git config user.email "vscopbld@microsoft.com"
git config user.name "OpenPublishBuild"
git add .
git commit -m "CI Updates"
git push -u origin master
