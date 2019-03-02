"use strict";

document.addEventListener("DOMContentLoaded", init);

function init(e) {
    document.getElementById("timeFilter").addEventListener("change", timeFilter);
}

function timeFilter(e) {
    let val = e.target.value;

    let maxDiff = -1;
    switch (val) {
        case "This Day":
            maxDiff = 1;
            break;
        case "This Week":
            maxDiff = 7;
            break;
        case "This Month":
            maxDiff = 31;
            break;
        case "This Year":
            maxDiff = 265;
            break;
        case "All Time":
        default:
            break;
    }

    if(maxDiff < 0) {
        getFeed();
    } else {
        fetch(`request.php?request=feed&filter=time&md=${maxDiff}`, {
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
}