// Generated by CoffeeScript 1.3.3
(function() {
  var connection, pubnub;

  pubnub = require('pubnub');

  connection = pubnub.init({
    publish_key: 'pub-c54880a5-ba99-4836-a084-08f57b4b5333',
    subscribe_key: 'sub-3129de73-8f26-11e1-94c8-1543525cae6d',
    ssl: false,
    origin: 'pubsub.pubnub.com'
  });

  connection.subscribe({
    channel: 'novus',
    connect: function() {
      return console.log('connected!');
    },
    callback: function(message) {
      return console.log(message);
    }
  });

}).call(this);