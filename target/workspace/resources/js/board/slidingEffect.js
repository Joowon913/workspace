/**
 * 
 */
const titles = document.getElementsByClassName("title");
	const bodies = document.getElementsByClassName("body");
	const anchors = document.getElementsByClassName("anchor");
	const closeButton = document.getElementById("close");

Array.from(anchors).forEach(function (anchor, index) {
    anchor.addEventListener("click", function () {
      document.querySelector("#slide > #title").innerHTML = titles[index].innerHTML;
      document.querySelector("#slide > #body").innerHTML = bodies[index].innerHTML;
      $('.stretched').addClass('slide-in');
      $('.detail-hidden').addClass('detail-shown');
      event.preventDefault();
    });
});
      
$('#close').click(function () {
		  $('.stretched').toggleClass('slide-in');
	      $('.detail-hidden').toggleClass('detail-shown');
	       event.preventDefault();
	});