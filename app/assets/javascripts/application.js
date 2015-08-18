// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery2
//= require jquery_ujs
//= require bootstrap-sprockets
//= require social-share-button



//= require_tree .


(function(yourcode) {

   // The global jQuery object is passed as a parameter
   yourcode(window.jQuery, window, document);

 }(function($, window, document) {

  $(function() {

    var acc = $('.ACC')
    acc.on("click", function(e , map) {
          //scroll to the div ON CLICK
          $(this)
              .velocity("scroll", {
                          duration: 800,
                          delay: 300,
                          offset: -56
                        });
           toggle(this)
     });


      // console.log('The DOM is ready');
      function toggle(selected){

        var map;
        var panel = $(selected).children()

        var displayPannel = function(selected){

          //define map cordinates and map
          var maps = $(panel).find(".map")
          var lat = $(panel).first().next().children().first().children().first().children().last().prev().html()
          var long = $(panel).first().next().children().first().children().first().children().last().html()

          $(this).find(".map").show()
          $(panel).velocity("fadeIn", { duration: 500 })
          // $(map).velocity("fadeIn", { duration: 500 })
          //adds class to well removing hover state
          $(panel).parent().addClass("hoverOPEN")
          // changes arrow from down to up
          $(selected).children().siblings().first().children().last().children().first().removeClass("fa-angle-double-down").addClass("fa-angle-double-up")
          google.maps.event.trigger(maps, 'resize')
          console.log(lat, long, maps)
          initialize(lat, long, maps);

        }

        var hidePannel = function(selected){
            //define social map and content to be hidden
            var content = $(panel).first().next()
            var social = $(panel).first().next().next()
            // var map = $(panel).find(".map")
            //hide the content
            $(selected).children().siblings().first().children().last().children().first().removeClass("fa-angle-double-up").addClass("fa-angle-double-down")
            $(content).velocity("fadeOut", { duration: 200 })
            $(social).velocity("fadeOut", { duration: 200 })

            // $(map).velocity("fadeOut", { duration: 200 })
            $(panel).parent().removeClass("hoverOPEN")
        }
        //run displayPannel if pannel is not open
        if ( !$(selected).first().hasClass("hoverOPEN") ){
            displayPannel(selected)
        }
        //run hidePannel if the pannel is displayed
        else if ( $(selected).first().hasClass("hoverOPEN") ){
            hidePannel(selected)
        }
        //WRITE CODE HERE FOR MOUSEUP
      }
        //define map function
        var initialize = function(lat, long, maps){
             console.log("running init")
           var myCenter = new google.maps.LatLng(lat,long);
           var mapProp = {
                center: myCenter,
                zoom:14,
           };
            map = new google.maps.Map(maps[0] , mapProp);
           //  google.maps.event.addDomListener(window, 'load', initialize);
           google.maps.event.addDomListener(window, "resize", function() {
            var center = map.getCenter();
            google.maps.event.trigger(map, "resize");
            map.setCenter(center);
           });

            google.maps.event.addListener(map, 'bounds_changed', function() {
                var bounds = map.getBounds();
            })

            var marker = new google.maps.Marker({
              position:myCenter
            });
           marker.setMap(map);
      }

  });


  // The rest of code goes here!

 }));

$( document ).ready(function(){






var quotes = [
    'We have elected to put our money and faith in a mathematical framework that is free of politics and human error. - TYLER WINKLEVOSS',
    'I think [bitcoin]’s a technical tour de force. - BILL GATES',
    'I think there is a 20% chance that Bitcoin will become a huge, worldwide success. - PETER THIEL',
    'I’ts gold for nerds. - STEPHEN COLBERT',
    'It will be everywhere and the world will have to readjust. World governments will have to readjust. - JOHN MCAFEE',
    'Bitcoin actually has the balance and incentives right, and that is why it is starting to take off. - JULIAN ASSANGE',
    'I understand the political ramifications and I think that government should stay out of ["Bitcoin"] and they should be perfectly legal. - RON PAUL',
    'Bitcoin is the beginning of something great: a currency without a government, something necessary and imperative. - NASSIM TALEB',
    'Economists and journalists often get caught up in this question: Why does Bitcoin have value? And the answer is very easy. Because it it useful and scarce. - ERIC VOORHEES'];
var currentQuote = 0;

function nextQuote(showImmediately) {

    var hidden = $.Deferred();

    if (!showImmediately)
        $('#quotes').fadeOut('slow', function() { hidden.resolve(); });
    else
        hidden.resolve();

    hidden.promise().done(function() {

        // Get a quote that's not the current one
        // (we may need to try a few times if it's a small array
        var randomIndex = currentQuote;
        while (randomIndex == currentQuote) {
            randomIndex = (Math.floor(Math.random() * quotes.length));
        }

        // Now switch it out and fade back in
        $('#quotes').html(quotes[randomIndex]);
        $('#quotes').fadeIn('slow');
        currentQuote = randomIndex;
    });
}

nextQuote(true);
setInterval(function() { nextQuote(false); }, 6000);
})


$( document ).ready(function(){

var quotesUSER = [
    'Do not take life too seriously. You will never get out of it alive. (Elbert Hubbard)',
    'A day without sunshine is like, you know, night.',
    'Always remember that you are absolutely. unique. Just like everyone else. (Margaret Mead)',
    'A successful man is one who makes more money than his wife can spend. A successful woman is one who can find such a man.(Lana Turner)' ,
    'If today were the last day of your life, would you want to do what you are about to do today? (Steve Jobs)',
    'Laugh and the world laughs with you, snore and you sleep alone. (Anthony Burgess)',
    'The trouble with having an open mind, of course, is that people will insist on coming along and trying to put things in it. (Terry Pratchett)'];
var currentQuote = 0;

function nextQuote(showImmediately) {
    // We can use a promise to make sure that we don't switch the
    // quote out until the text is hidden
    var hidden = $.Deferred();

    if (!showImmediately)
        $('#quotesUSER').fadeOut('slow', function() { hidden.resolve(); });
    else
        hidden.resolve();

    hidden.promise().done(function() {

        // Get a quote that's not the current one
        // (we may need to try a few times if it's a small array
        var randomIndex = currentQuote;
        while (randomIndex == currentQuote) {
            randomIndex = (Math.floor(Math.random() * quotesUSER.length));
        }

        // Now switch it out and fade back in
        $('#quotesUSER').html(quotesUSER[randomIndex]);
        $('#quotesUSER').fadeIn('slow');
        currentQuote = randomIndex;
    });
}

nextQuote(true);
setInterval(function() { nextQuote(false); }, 6000);
})


$( document ).ready(function(){




// $('.ACC').each(function(){
//
//     var itemName = $(this)
//     var map;
//
//     $(document).mouseup(function (e)
//       {
//     var container = itemName
//
//     if (!container.is(e.target) && $(container).hasClass("hoverOPEN"))
//     {
//         $(container).find("#hidden").css({
//             "opacity":"0",
//             "display":"block",
//         }).hide(600).animate({opacity:1})
//         $(container).removeClass("hoverOPEN")
//           $(container).find(".social-share-button").hide(100)
//         $(container).find("#downARROW").addClass("fa-angle-double-down ").removeClass("fa-angle-double-up")
//           e.stopPropagation();
//     }
// });
//
//       itemName.click(function(e, map){
//
//         if ($(this).find("#hidden").is(':hidden')){
//
//           console.log("div hidden")
//           $(this).parent().parent().find("#image").show()
//           $(this).removeClass("hoverClOSED")
//           $(this).addClass("hoverOPEN")
//           $(this).find(".social-share-button").show(400)
//           $(this).find(".map").show()
//           $(this).find("#item_image").show()
//           $(this).find("#hidden").css({
//               "opacity":".5",
//               "display":"block",
//           }).show(400).animate({opacity:1})
//
//
//         var lat = $(this).find(".locationLAT")[0].innerHTML
//         var long = $(this).find(".locationLON")[0].innerHTML
//         var maps = $(this).find(".map")[0]
//
//         function initialize(lat, long, maps){
//
//             console.log("running")
//           var myCenter = new google.maps.LatLng(lat,long);
//           var mapProp = {
//                center: myCenter,
//                zoom:14,
//         styles: [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"visibility":"on"}]},{"featureType":"administrative","elementType":"labels","stylers":[{"visibility":"on"},{"color":"#716464"},{"weight":"0.01"}]},{"featureType":"administrative.country","elementType":"labels","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape.natural.landcover","elementType":"geometry","stylers":[{"visibility":"simplified"}]},{"featureType":"poi","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"poi","elementType":"geometry.fill","stylers":[{"visibility":"simplified"}]},{"featureType":"poi","elementType":"geometry.stroke","stylers":[{"visibility":"simplified"}]},{"featureType":"poi","elementType":"labels.text","stylers":[{"visibility":"simplified"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"visibility":"simplified"}]},{"featureType":"poi","elementType":"labels.text.stroke","stylers":[{"visibility":"simplified"}]},{"featureType":"poi.attraction","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"visibility":"simplified"},{"color":"#a05519"},{"saturation":"-13"}]},{"featureType":"road.local","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"transit","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"visibility":"simplified"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"water","elementType":"all","stylers":[{"visibility":"simplified"},{"color":"#84afa3"},{"lightness":52}]},{"featureType":"water","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"water","elementType":"geometry.fill","stylers":[{"visibility":"on"}]}]
//
//           };
//
//            map = new google.maps.Map(maps,mapProp);
//           //  google.maps.event.addDomListener(window, 'load', initialize);
//           google.maps.event.addDomListener(window, "resize", function() {
//            var center = map.getCenter();
//            google.maps.event.trigger(map, "resize");
//            map.setCenter(center);
//           });
//
//            google.maps.event.addListener(map, 'bounds_changed', function() {
//                var bounds = map.getBounds();
//            })
//
//
//            var marker = new google.maps.Marker({
//              position:myCenter
//            });
//           marker.setMap(map);
//
//
//
//         }
//
//         initialize(lat,long, maps);
//
//
//       // $(this).velocity("scroll", {
//       //                // container: $("#container"),
//       //                duration: 800,
//       //                delay: 300,
//       //                offset: $(this).offset().top - $(".navbar-collapse").height()
//       //              });
//       console.log(this)
//
//       // $("#contactLi").click(function(){
//       //               $("#contact").velocity("scroll", {
//       //                 // container: $("#container"),
//       //                 duration: 800,
//       //                 delay: 300,
//       //                 offset: -90
//       //               });
//       //             })
//
//
//
//           // jQuery("html, body").animate({ scrollTop: $(this).offset().top - $(".navbar-collapse").height()}, 1000);
//
//
//           $(this).find("#downARROW").removeClass("fa-angle-double-down ").addClass("fa-angle-double-up")
//             google.maps.event.trigger(maps, 'resize')
//
//
//             e.stopPropagation();
//
//
//
//         }
//
//
//         else{
//           $(this).find("#hidden").css({
//               "opacity":"0",
//               "display":"block",
//           }).hide(600).animate({opacity:1})
//           $(this).removeClass("hoverOPEN")
//           // $(this).find(".map").toggle(100)
//             $(this).find(".social-share-button").hide(100)
//           $(this).find("#downARROW").addClass("fa-angle-double-down ").removeClass("fa-angle-double-up")
//             e.stopPropagation();
//         }
//
//
//       })
//
//   })
})


$( document ).ready(function(){
  function get_rates(){

  console.log("get rates running")
  $.ajax({
          type: "GET",
          dataType: "json",
          url: "/rates",
          success: function(data){

          }
      });

}



})
