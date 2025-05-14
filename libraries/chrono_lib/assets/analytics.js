document.addEventListener("DOMContentLoaded", function (event) {
	let data = {};
	let sent = false;
	data["ready"] = Date.now();
	data["mousemoved"] = 0;

	let send = (data) => {
		if(!sent){
			sent = true
			// setTimeout(function (){

						
			// }, 2000);
			// const xhttp = new XMLHttpRequest();

			let url = window.location.href
			url += url.includes("?") ? "&_action=chrono_analytics" : "?_action=chrono_analytics"
			// xhttp.open("POST", url);
			
			let postBody = new FormData(undefined)
			postBody.append("data", JSON.stringify(data))
	
			// xhttp.send(postBody);
			navigator.sendBeacon(url, postBody);
		}
	}

	document.addEventListener("mousemove", e => {
		data["mousemoved"] = e.timeStamp;
	});
	document.addEventListener("click", e => {
		data["click"] = {time:e.timeStamp, x:e.clientX + window.scrollX, y:e.clientY + window.scrollY};
		// send(data)
	});

	document.addEventListener("keydown", e => {
		data["keydown"] = {time:e.timeStamp};
		data["keydown"]["tag"] = document.activeElement.tagName;
		// send(data)
	});

	document.addEventListener("visibilitychange", e => {
		if (document.visibilityState === "hidden") {
			if(!sent){
				send(data)
			}
		}
	});
});