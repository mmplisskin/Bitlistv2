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

$( document ).ready(function(){
  // An array of possible quotes





var quotes = [
    'Genius is one percent inspiration, ninety-nine percent perspiration. (Thomas Edison)',
    'The real problem is not whether machines think but whether men do. (B.F. Skinner)',
    'There are only two hard things in Computer Science: cache invalidation and naming things. (Phil Karlton)',
    'If today were the last day of your life, would you want to do what you are about to do today? (Steve Jobs)'];
var currentQuote = 0;

function nextQuote(showImmediately) {
    // We can use a promise to make sure that we don't switch the
    // quote out until the text is hidden
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
$('.ACC').each(function(){

    var itemName = $(this)

      itemName.click(function(e){

        if ($(this).find("#hidden").is(':hidden')){
          console.log("div hidden")
          $(this).removeClass("hoverClOSED")
          $(this).addClass("hoverOPEN")
          // $(this).find("#hidden").show(300);
          $(this).find(".social-share-button").show(400)
          $(this).find("#hidden").css({
              "opacity":".5",
              "display":"block",
          }).show(400).animate({opacity:1})

          jQuery("html, body").animate({ scrollTop: $(this).offset().top - $(".navbar-collapse").height()}, 1000);


          $(this).find("#downARROW").removeClass("fa-angle-double-down ").addClass("fa-angle-double-up")
            e.stopPropagation();
        }


        else{
          $(this).find("#hidden").css({
              "opacity":"0",
              "display":"block",
          }).hide(600).animate({opacity:1})
          $(this).removeClass("hoverOPEN")
          $(this).find(".social-share-button").hide(100)
          $(this).find("#downARROW").addClass("fa-angle-double-down ").removeClass("fa-angle-double-up")
            e.stopPropagation();
        }


      })

  })
})
