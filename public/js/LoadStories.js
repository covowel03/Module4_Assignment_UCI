var Story1 = document.getElementById("Story1");
var Story2 = document.getElementById("Story2");
var Story3 = document.getElementById("Story3");
var Container = document.getElementById("story-container");
var Title = document.getElementById("story-title");
var Content = document.getElementById("story-content");
Story1.addEventListener("click", () => story(1));
Story2.addEventListener("click", () => story(2));
Story3.addEventListener("click", () => story(3));

function story(i) {
  fetch(`/api/Story/${i}`)
    .then((response) => {
      if (response.ok) {
        return response.json();
      } else {
        console.log("Failed");
        Title.innerText = "Sorry";
      }
    })
    .then((data) => { 
      Title.innerText = data.title;
      Content.innerHTML = data.content;
    });
    Container.style.display = "block";
}

















