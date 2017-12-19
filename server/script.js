console.log('linked');

var getCurrentCount = function(){
	$.ajax({
		type: 'GET',
		url: 'http://localhost:3000/counter',
		success: function(jsonData){
			var count = jsonData.count;
			return count;
	    }
	});
}





//PART 1 --------------------- ALL MOVIES

var createAll = function(target,movieId,title,year,rating,poster){
	var containerTag = document.createElement('div');
	containerTag.id = movieId;

	var titleTag = document.createElement('h1');
	titleTag.innerHTML = title;

	var yearTag = document.createElement('h2');
	yearTag.innerHTML = year;

	var ratingTag = document.createElement('h2');
	ratingTag.innerHTML = rating;

	var posterTag = document.createElement('img');
	posterTag.src = poster;

	//probably can refactor this
	var targetId = '#' + movieId;

	var button = document.createElement('button');
	button.dataset.movie = movieId;
	button.className = "removeButton"

	$(target).append(containerTag)
	createRemoveButton(button);
	$(targetId).append(titleTag, yearTag, ratingTag, posterTag , button);
}


var createRemoveButton = function(button){
	$(button).on('click', function(){
		
		var link = $(this).data('movie');
		$(this).parent().remove();

		$.ajax({
			type: 'DELETE',
			url: 'http://localhost:3000/movies/' + link,
			success: function(d){
				console.log(d);
			}
		});

	})
}


//example call to get all movies
$.ajax({
	type: 'GET',
	url: 'http://localhost:3000/movies',
	success: function(jsonData){
    	//easiest way to loop a JSON object
    	for(var key in jsonData){
    		var current = jsonData[key]['movie']
    		var indexId = jsonData[key]['id'];
        	//Should also account for if the poster exists or not!
        	if(current.Poster == undefined){
        		current.Poster = "";
        	}
        	createAll('#movie-list', indexId, current.Title, current.Year, current.Rated, current.Poster);
        }
    }
});















//PART 2 --------------------- SEARCHING

var createMovie = function(data,create){
	if(create){
		//we are creating the new movie element and appending it
		createTemp(data);
	}else{
		createTemp("error")
	}
}

var createTemp = function(info){
	if(info==="error"){
		//append text that says there is an error
	}else{
		//append the movie object and a add button
		var titleTag = document.createElement('h1');
		titleTag.innerHTML = info.Title;

		var yearTag = document.createElement('h2');
		yearTag.innerHTML = info.Year;

		var ratingTag = document.createElement('h2');
		ratingTag.innerHTML = info.Rated;

		var posterTag = document.createElement('img');
		posterTag.src = info.Poster;

		var button = document.createElement('button');
		button.className = "addButton"
		createAddButton(button, info);

		$('#new-movie').append(titleTag, yearTag, ratingTag, posterTag, button)

	}
}

var createAddButton = function(button,data){
	//we need to structure the data to match our json Object structure
	$(button).on('click', function(){
		var newMovie = structure(data);
		$.ajax({
			type: 'POST',
			data: newMovie,
			url: 'http://localhost:3000/movies/',
			success: function(d){
				console.log(d);
			}
		});
	})
}

var structure = function(jsonData){
	var newCount = getCurrentCount() + 1
	var jsonMovie = {
      "id": newCount.toString(),
      "movie": {
	        "Title": jsonData.Title,
	        "Year": jsonData.Year,
	        "Rated": jsonData.Rated,
	        "Poster": jsonData.Poster
      	}
	}
	return jsonMovie;
}


$('#submit-api').on('click', function(){
	var title = $('#search-title').val()
	var year = $('#search-year').val()
	//could move this out to a seperate function
	$.ajax({
		type: 'GET',
		url: 'http://www.omdbapi.com/?apikey=6ea921cc&t=' + title + '&y=' + year,
		success: function(jsonData){
	    	//if movie does not exist you will get back a object like this :
	    	//{Response: "False", Error: "Movie not found!"}
	    	// console.log(jsonData)
	    	if(jsonData.Error){
	    		createMovie(jsonData,false);
	    	}else{
	    		createMovie(jsonData,true)
	    	}
	    }
	});
})


