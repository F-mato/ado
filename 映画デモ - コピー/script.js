const container = document.querySelector('.container');
const seats = document.querySelectorAll('.row .seat:not(.occupied)');
const countone = document.getElementById('countone');
const counttwo = document.getElementById('counttwo');
const countthree = document.getElementById('countthree');
const countfour = document.getElementById('countfour');
const totalone = document.getElementById('totalone');
const totaltwo = document.getElementById('totaltwo');
const totalthree = document.getElementById('totalthree');
const totalfour = document.getElementById('totalfour');
const movieSelect = document.getElementById('movie');


populateUI();

let ticketPrice = +movieSelect.value;

// Save selected movie index and price
function setMovieData(movieIndex, moviePrice) {
  localStorage.setItem('selectedMovieIndex', movieIndex);
  localStorage.setItem('selectedMoviePrice', moviePrice);
}

// Update total and count
function updateSelectedCount() {
  var movieSelect = document.getElementById("movie");
  var movieSelectValue = movieSelect.value;
  var movieText = movieSelect.options[movieSelect.selectedIndex].text;

  console.log(movieSelectValue)
  console.log(movieText)

  const selectedSeats = document.querySelectorAll('.row .seat.selected');

  const seatsIndex = [...selectedSeats].map(seat => [...seats].indexOf(seat));

  localStorage.setItem('selectedSeats', JSON.stringify(seatsIndex));

  const selectedSeatsCount = selectedSeats.length;
 
  if("2000" == movieSelectValue){
    countone.innerText = selectedSeatsCount;
    totalone.innerText = selectedSeatsCount * ticketPrice;
  
  }else if("1800" == movieSelectValue){
  
    counttwo.innerText = selectedSeatsCount;
    totaltwo.innerText = selectedSeatsCount * ticketPrice;
    
  }
  else if("1500" == movieSelectValue){
    countthree.innerText = selectedSeatsCount;
    totalthree.innerText = selectedSeatsCount * ticketPrice;
  }

  countfour.innerText = selectedSeatsCount;
  totalfour.innerText = selectedSeatsCount * ticketPrice;
  
  setMovieData(movieSelect.selectedIndex, movieSelect.value);
}

// Get data from localstorage and populate UI
function populateUI() {
  const selectedSeats = JSON.parse(localStorage.getItem('selectedSeats'));

  if (selectedSeats !== null && selectedSeats.length > 0) {
    seats.forEach((seat, index) => {
      if (selectedSeats.indexOf(index) > -1) {
        seat.classList.add('selected');
      }
    });
  }

  const selectedMovieIndex = localStorage.getItem('selectedMovieIndex');

  if (selectedMovieIndex !== null) {
    movieSelect.selectedIndex = selectedMovieIndex;
  }
}

// Movie select event
movieSelect.addEventListener('change', e => {
  ticketPrice = +e.target.value;
  setMovieData(e.target.selectedIndex, e.target.value);
  //updateSelectedCount();
});

container.addEventListener('click', e => {
  console.log(e.target.classList);
  if (e.target.classList.contains('seat') && !e.target.classList.contains('occupied')){
     e.target.classList.toggle('selected');
     updateSelectedCount();
  }
});



// Initial count and total set
updateSelectedCount();