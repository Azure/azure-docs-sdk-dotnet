"use strict";

let glob = require("glob");
let path = require("path");
let exec = require("child-process-promise").exec;

function dotnetRestore(projectFolder) {
    console.log(`Running command: dotnet restore ${projectFolder}`);
    
    let currentDir = process.cwd();
    process.chdir(projectFolder);
    exec("dotnet restore").then(result => {
        if (result.stdout) {
            console.log(result.stdout);
        } else if (result.stderr) {
            console.log(result.stderr);
        }
    }).catch(err => {
        console.log("err: " + err);
    });
    process.chdir(currentDir);
}

let args = process.argv.slice(2);
if (args.length < 1) {
    console.log(`Usage: ${process.argv[0]} ${process.argv[1]} <directory-need-to-be-restored>`);
    process.exit(1);
}
let directory = args[0];

let pattern = `${directory}/**/project.json`;
let projectPaths = glob.sync(pattern);
projectPaths.forEach(projectPath => {
    let projectFolder = path.dirname(projectPath);
    dotnetRestore(projectFolder);
});