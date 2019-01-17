var page = 0;
var startTime = new Date().toUTCString();
var id = Math.floor(Math.random() * 10000);
var admin, db, surveyResponse, ref = null;

function startDB()
{
  // Get a database reference to our blog
  db = firebase.database();
  // Get a new reference:
  ref = db.ref().push();
}

function nextPage()
{
  document.querySelectorAll('.page').forEach(function(pageElement) {
    pageElement.style.display = "none";
  });
  document.getElementById("page" + page).style.display = "block";

  collectAndSendInputs()

  if(page === 1)
  {
    calcCombos()
    next()
  }
  page++
}

function collectAndSendInputs() {
  var inputs = document.querySelectorAll("input")
  var textareas = document.querySelectorAll("textarea")
  var sendObject = {}

  for (var i = 0; i < inputs.length; i++)
  {
    if(inputs[i].type == "radio" || inputs[i].type == "checkbox")
      sendObject[inputs[i].id] = inputs[i].checked
    else
      sendObject[inputs[i].id] = inputs[i].value;
  }

  for (var i = 0; i < textareas.length; i++)
  {
    sendObject[textareas[i].id] = textareas[i].value;
  }

  sendObject["pairwise"] = answers
  sendObject["id"] = id
  sendObject["startTime"] = startTime
  sendObject["completeTime"] = new Date().toUTCString();

  ref.set(sendObject)
}

function start()
{
  startDB();
  nextPage();
}
