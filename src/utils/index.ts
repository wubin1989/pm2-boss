var fs = require('fs');

function streamData(file, start, end, callback) {
    var stream = fs.createReadStream(file, {start: start, end: end});
    stream.addListener("data", function (lines) {
        lines = lines.toString('utf-8');
        lines = lines.slice(lines.indexOf("\n") + 1).split("\n"); // cutoff first probably garbled line
        callback(lines);
    });
}

module.exports = {
    streamData,
}