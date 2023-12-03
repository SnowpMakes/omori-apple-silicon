function patch()
{
    let fs = require("fs");
    let oldWriteFile = fs.writeFile;
    fs.writeFile = function (path, data, options, callback)
    {
        if(typeof(data) === "number")
            oldWriteFile(path, data.toString(), options, callback);
        else
            oldWriteFile(path, data, options, callback);
    }
}

if(!module.exports.patched)
{
    patch();
    module.exports.patched = true;
}

