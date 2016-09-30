"use strict";

var fs = require('fs');
var path = require('path');

var info = traverseApiToc("api_ref");
checkDuplicateUid(info.ymlList);
mergeToc(info.tocList, "api_ref/toc.yml");

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
    fs.readdirSync(homeDir).forEach( function (file) {
        var filePath = path.join(homeDir, file);
        if (fs.lstatSync(filePath).isFile()) {
            if (file === "toc.yml") {
                apiInfo.tocList.push(filePath);
            } else if (path.extname(file) === ".yml") {
                apiInfo.ymlList.push(file);
            }
        } else {
            var otherInfo = traverseApiToc(filePath)
            apiInfo.tocList = apiInfo.tocList.concat(otherInfo.tocList);
            apiInfo.ymlList = apiInfo.ymlList.concat(otherInfo.ymlList);
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