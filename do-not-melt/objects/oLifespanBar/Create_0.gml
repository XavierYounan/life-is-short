

//---------------------------------------------------------------------------------------------------
/*



for (i = 0; i < limit; i++) {
  $(".emptyBar").append(nullBar);
  $(".gridBar").append(bar);
}

// sets the value of each block
var healthSet = 25;

// calls each bar's width
var barWidth = 98 / limit;

//sets your overall health based on number of bars in gridBar div
var healthLimit = healthSet * limit;

var health = healthLimit;

var barTotal = $(".bar").length;

$(".bar").css("width", barWidth + "%");

$(".nullBar").css("width", barWidth + "%");

// creates space between each bar in the gridBar
$(".bar").css("margin-right", 2 / limit + "%");

$(".nullBar").css("margin-right", 2 / limit + "%");

// calls the last damage bar in the gridBar
var last = $(".bar").last();

//sets thevalue of a bar's current health 
var currentHealth = healthSet;

// prints initial health to count div

$(".count h1").html(health);

function heal(val) {
    health = health + val;
    currentHealth = currentHealth + val;
    last.css("width", barWidth * currentHealth / healthSet + "%");
    last.css("border-top-right-radius", "0");
    last.css("border-bottom-right-radius", "0");
    last.css('opacity', "1");
  $(".count h1").html(health);
    currentCheck();

}

function damage(val) {
  health = health - val;
  currentHealth = currentHealth - val;

  last.css("width", barWidth * currentHealth / healthSet + "%");
  last.css("border-top-right-radius", "0");
  last.css("border-bottom-right-radius", "0");
  
  if (health <= 0) {
      health = 0;
      currentHealth = 0;
    }

  $(".count h1").html(health);

  currentCheck();

}

function currentCheck() {

  if (currentHealth <= 0) {
    //     removes current last bar and reastablishes last bar
    last.css('opacity', "0");
    setTimeout(remove, 125);

    //     this function helps allow the opacity to work correctly, since using trnasition in css affects how fadeOut would work

    function remove() {
      last.remove();
      last = $(".bar").last();
      //     changes values
      currentHealth = healthSet + currentHealth;

      //     changes css
      if (currentHealth < healthSet) {
        last.css("border-top-right-radius", "0");
        last.css("border-bottom-right-radius", "0");
        last.css("width", barWidth * currentHealth / healthSet + "%");

        //   if bars run out, always makes sure health is at 0

        //     will run current check function again just in case, this will help if you remove more than 1 bar and keep it functioning correctly
      
        currentCheck();

      }

    }

  }

  if (currentHealth == healthSet) {
    last.css("width", barWidth * healthSet / healthSet + "%");
    last.css("border-top-right-radius", "10px");
    last.css("border-bottom-right-radius", "10px");
  }

  if (currentHealth > healthSet) {
    last.css("width", barWidth * healthSet / healthSet + "%");
    last.css("border-top-right-radius", "10px");
    last.css("border-bottom-right-radius", "10px");
    if (health > healthLimit) {
      health = healthLimit;
      currentHealth = healthSet;
      if($(".bar").length < limit){
        $(".gridBar").append(bar);
        setTimeout(add, 105);
      }
    } else {
      currentHealth = currentHealth - healthSet;
      $(".gridBar").append(bar);

      setTimeout(add, 105);

      function add() {
        last = $(".bar").last();

        last.css("width", "0%");

        // creates space between each bar in the gridBar
        last.css("margin-right", 2 / limit + "%");
        last.css("width", barWidth * currentHealth / healthSet + "%");

        if (currentHealth == healthSet) {
          last.css("border-top-right-radius", "10px");
          last.css("border-bottom-right-radius", "10px");
        } else {
          last.css("border-top-right-radius", "0");
          last.css("border-bottom-right-radius", "0");
        }

        last.css('opacity', "1");

        currentCheck();
      }

    }
  }

  $(".count h1").html(health);
}

// these can be functions or buttons, activates health heal

$(".half").click(function() {
  heal(10);
});

$(".full").click(function() {
  damage(12);
});

*/