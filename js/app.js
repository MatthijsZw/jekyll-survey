var count = 0, page = 0;
var id = Math.floor(Math.random() * 10000);

var admin, db, surveyResponse, ref = null;
function startDB()
{
  // Get a database reference to our blog
  db = firebase.database();
  ref = db.ref();
}

function nextPage()
{
  document.querySelectorAll('.page').forEach(function(pageElement) {
    pageElement.style.display = "none";
  });
  document.getElementById("page" + page).style.display = "block";
  if(page === 1)
    next()
  page++
}

function start()
{
  startDB();
  nextPage();
}
