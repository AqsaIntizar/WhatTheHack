"use strict";

document.addEventListener("DOMContentLoaded", init);

let ws = null;

function init() {
    ws = new WebSocket("ws://localhost:8080/ws");
    ws.addEventListener("message", onMessage);
    let p = waitAndGetFeed();
}

function onMessage(e) {
    let data = e.data;
    visualiseFeed(JSON.parse(data));
}

function getFeed() {
    console.log("REQUEST");

    let data = {
        method: "get",
        action: "feed"
    };

    let msg = JSON.stringify(data);
    ws.send(msg);
}

async function waitAndGetFeed() {
    await resolveAfterWebSocketReady();
    getFeed();
}

function resolveAfterWebSocketReady() {
    return new Promise(resolve => {
        const FUNC = resolve => {
            if (ws.readyState === WebSocket.OPEN) {
                resolve(true);
            }
            setTimeout(() => {
                FUNC(resolve)
            }, 1);
        };

        FUNC(resolve);
    });
}

function visualiseFeed(data) {
    document.querySelector("main").innerHTML = "";

    data["data"].forEach(startup => {
        document.querySelector("main").innerHTML += '<div class="list-item">\n' +
            '            <a href="#" class="image-project">\n' +
            '                <img src="images/uploads/startupImages/' + startup["imgUrl"] + '">\n' +
            '            </a>\n' +
            '            <div class="item-info clearfix">\n' +
            '                <span>\n' +
            '                    <a href="#" class="subject">\n' +
            '                        ' + startup["name"] + '\n' +
            '                    </a>\n' +
            '                </span>\n' +
            '                <div class="owner">\n' +
            '                    <span>\n' +
            '                        <a href="#">\n' +
            '                            by ' + startup["owner"]["name"] + ' ' + startup["owner"]["lastName"] + '\n' +
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