var data = [];
function get_movies(movies) {
	var movie_dicts = [];
	var last_day = undefined;
	var last_time = undefined;
	for (var i=0; i < movies.length; i++) {
		dateStr = movies[i].querySelector('.date').textContent;
		// dateStr is just a date like this: 
		// what time?
		// if it's a weekday, default to 8pm
		// if it's a weekend default to 3pm, but add 1 hour for each successive use of the same day...
		var date = get_date(dateStr);
		var weekday = date.getDay();
		if (date == last_day) {
			last_time = last_time + 1;
		}
		else {
			if ((weekday == 0) || (weekday == 6)) {
				last_time = 15
			}
			else {
				last_time = 20
			}
			last_day = date
		}
		date.setHours(last_time)
		// sample: 2015-12-13T15:00
		dateStr = [date.getFullYear(), date.getMonth() + 1, date.getDate()].join('-') + 'T' + last_time + ':00'; 
		title = movies[i].querySelector('.title a').textContent;
		loc = window.location;
		url = 'http://' + loc.hostname + movies[i].querySelector('.title a').getAttribute('href');
		movie_dicts.push({
			'feed': 'http://local.thisisglobal.com:8004/api/1.0/sources/13/',
			'title': title,
			'pub_date': dateStr,
			'url': url
		});
	}
	return movie_dicts
}
function get_date(str) {
	console.log(str)
	var bits = str.split('/');
	date = new Date()
	date.setFullYear(bits[2]);
	date.setMonth(bits[1]-1);
	date.setDate(bits[0]);
	date.setHours(0);
	date.setMinutes(0);
	date.setSeconds(0);
	date.setMilliseconds(0);
	return date;
}

function post_data(film) {
	var xhr = new XMLHttpRequest();
	xhr.open('POST', 'http://localhost:8004/api/1.0/items/')	
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.onload = function() {
	    if (xhr.status === 200 && xhr.responseText !== newName) {
	        var next = window.confirm("OK, Wanna do next one?")
	        if (next) {
	        	var next = get_next_data();
	        	if (next) post_data(next);
		    }
	    }
	    else if (xhr.status !== 200) {
	        alert('Request failed.  Returned status of ' + xhr.status);
	    }
	};
	console.log(film);
	var data_str = 'feed=' + film['feed'] + '&title=' + film['title'] + '&pub_date=' + film['pub_date'] + '&url=' + film['url'];
	xhr.send(encodeURI(data_str));
}
function init(){
	var movies_html = document.getElementsByClassName('retableRow');
	data = get_movies(movies_html);
	var next_data = data.shift()
	if (next_data){
		post_data(next_data)
	}
}
//post_data(data.unshift());
function get_next_data() {
	return data.shift() 
}