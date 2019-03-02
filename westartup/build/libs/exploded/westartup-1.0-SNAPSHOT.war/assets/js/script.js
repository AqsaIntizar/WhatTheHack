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
    console.log(data);
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