"use strict";

var fs = require('fs');
var path = require('path');

// find all toc.yml and metadata files inside docs-ref-autogen and docs-ref-manual respectively
var apiRefInfo = traverseApiToc("docs-ref-autogen");
var apiRefManualInfo = traverseApiToc("docs-ref-manual");

// check if any metadata files has duplicated uid
checkDuplicateUid(apiRefInfo.ymlList.concat(apiRefManualInfo.ymlList));

let tocList = apiRefInfo.tocList.concat(apiRefManualInfo.tocList);
// merge all toc.yml into one
mergeToc(tocList, "docs-ref-autogen/toc.yml");

// Comment the following remove toc.yml code to work around the manual folder toc missing issue.
// remove other toc.yml
// tocList.forEach(tocPath => {
//   fs.unlinkSync(tocPath);
// });

function checkDuplicateUid(ymlList) {
    var record = new Set();
    ymlList.forEach(function(yml) {
        if (record.has(yml)) {
            console.error("Error: duplicated UID found, " + yml);
            process.exit(1);
        } else {
            record.add(yml);
        }
    });
}

function traverseApiToc(homeDir) {
    var apiInfo = {};
    apiInfo.tocList = [];
    apiInfo.ymlList = [];

    if (!fs.existsSync(homeDir)) {
        return apiInfo;
    }

    fs.readdirSync(homeDir).forEach( function (file) {
        var filePath = path.join(homeDir, file);
        if (fs.lstatSync(filePath).isFile()) {
            if (file === "toc.yml") {
                apiInfo.tocList.push(filePath);
            } else if (path.extname(file) === ".yml") {
                apiInfo.ymlList.push(file);
            }
        } else {
            var otherapiRefInfo = traverseApiToc(filePath)
            apiInfo.tocList = apiInfo.tocList.concat(otherapiRefInfo.tocList);
            apiInfo.ymlList = apiInfo.ymlList.concat(otherapiRefInfo.ymlList);
        }
    });
    return apiInfo;
}


function mergeToc(tocList, destToc) {
    var content = "";
    tocList.forEach(function(toc) {
        if (content === "") {
            content = fs.readFileSync(toc, "utf8");
        } else {
            content = content + fs.readFileSync(toc, "utf8");
        }
    });
    fs.writeFileSync(destToc, content, "utf8");
}
