/*! PROJECT_NAME - v0.1.0 - 2012-07-16
* http://PROJECT_WEBSITE/
* Copyright (c) 2012 YOUR_NAME; Licensed MIT */

// Generated by CoffeeScript 1.3.3
(function() {
  var Game;

  Game = (function() {

    function Game() {
      console.log('game created');
    }

    Game.prototype.start = function(id) {
      return console.log(id);
    };

    return Game;

  })();

}).call(this);

// Generated by CoffeeScript 1.3.3
(function() {

  window.onload = function() {
    var game;
    console.log('working');
    game = new Game();
    return game.start(20);
  };

}).call(this);
