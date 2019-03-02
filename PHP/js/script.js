"use strict";

document.addEventListener("DOMContentLoaded", init);

function init() {
    getFeed();
}

function getFeed() {
    fetch('request.php?request=feed', {
        method: 'GET',
        credentials: 'include'
    })
    .then(function(res) {
        if(res.ok === true)
            return res.json();
    })
    .then(function(text) {
        console.log(text);
        visualiseFeed(text);
    })
    .catch(function(err) {
        console.log("Error 404: Could not connect to the server - Find", err.message);
    });
}

function visualiseFeed(data) {
    document.querySelector("main").innerHTML = "";

    let d = [];
    if(!(data instanceof Array)) {
        d.push(data);
    } else {
        d = data;
    }

    console.log(d);

    d.forEach(startup => {
        console.log("STARTUP: " + startup["SID"]);
        document.querySelector("main").innerHTML += '<div class="list-item">\n' +
            '            <a href="#" class="image-project">\n' +
            '                <img src="images/uploads/startupImages/' + startup["Image"] + '">\n' +
            '            </a>\n' +
            '            <div class="item-info clearfix">\n' +
            '                <span>\n' +
            '                    <a href="#" class="subject">\n' +
            '                        ' + startup["StartupName"] + '\n' +
            '                    </a>\n' +
            '                </span>\n' +
            '                <div class="owner">\n' +
            '                    <span>\n' +
            '                        <a href="#">\n' +
            '                            by ' + startup["fullName"] + '\n' +
            '                        </a>\n' +
            '                    </span>\n' +
            '                </div>\n' +
            '                <div class="extra">\n' +
            '                    <img src="icons/flag-code.svg" class="flag">\n' +
            '\n' +
            '                    <div class="extra-inner">\n' +
            '                        <span class="icon-wrapper">\n' +
            '                            <span class="icon-wrapper">\n' +
            '                                <img src="icons/working.svg">\n' +
            '                                <span class="amount">\n' +
            '                                    342\n' +
            '                                </span>\n' +
            '                            </span>\n' +
            '                            <span class="icon-wrapper">\n' +
            '                                <img src="icons/views.svg">\n' +
            '                                <span class="amount">\n' +
            '                                    2499\n' +
            '                                </span>\n' +
            '                            </span>\n' +
            '                        </span>\n' +
            '                    </div>\n' +
            '                </div>\n' +
            '            </div>\n' +
            '        </div>';
    });
}