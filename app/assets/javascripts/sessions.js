function initializeSession(sessionId, name){

  var jqxhr = $.ajax({
    url: "/tok/" + sessionId + "/token.json",
    type: "GET",
    async: false,
    dataType: 'json'
  })
      .done(function(r) {
        console.dir(r);
        initialize(sessionId, r.token, name);
      })
      .fail(function(r, textStatus){
        console.error("Failed."  + textStatus);
        console.error("text: " + r.responseText);
        $('body').prepend('Failed to get token.');
      });
}

function initialize(sessionId, token, name) {
  // API KEY
  var apiKey  = "45238082";
  var session = OT.initSession(apiKey, sessionId);

  console.log(apiKey);
  console.log('session_setup', session);


  subscriberSettings = {
    width: '100%',
    height: '90vh'
  };

  publisherSettings = {
    name: name,
    width: "177px",
    height: "100px"
  };


  session.connect(token, function(error) {

    var publisher = OT.initPublisher('publisher', publisherSettings);
    // console.log('connect publish');

    session.publish(publisher);

    //TODO: move #OT_143cad9c_545e_4e72_b16d_76231405e530 to #publisher

  });

  session.on({
    // This function runs when session.connect() asynchronously completes

    //This code below causes screen to duplicate:

    // sessionConnected: function(event) {
    //   console.log('session_connected', session)
    //   // Publish the publisher we initialzed earlier (this will trigger 'streamCreated' on other
    //   // clients)
    //   session.publish(publisher);
    // },

    // This function runs when another client publishes a stream (eg. session.publish())
    streamCreated: function(event) {
      var divID = "subscriber";

      console.log('session_created', session);
      // Create a container for a new Subscriber, assign it an id using the streamId, put it inside
      // the element with id="subscribers"
      var subContainer = document.createElement('div');
      subContainer.id = 'stream-' + event.stream.streamId;

      // first time through, target publisher
      console.log('not subscriber connected');
      console.log(document.getElementById(divID));
      document.getElementById(divID).appendChild(subContainer);

      // Subscribe to the stream that caused this event, put it inside the container we just made
      session.subscribe(event.stream, subContainer, subscriberSettings);
    },
    // Receive a message and append it to the history
    'signal:chat': function(event) {
      var msg = document.createElement('p');
      msg.innerHTML = event.data;
      msg.className = event.from.connectionId === session.connection.connectionId ? 'mine' : 'theirs';
      document.querySelector('#history').appendChild(msg);
      msg.scrollIntoView();
    }
  });


  $(window).unload(function() {
    session.disconnect();
  });


  // Text Chat
  var form = document.querySelector('form');
  var msgTxt = document.querySelector('#msgTxt');

  console.log(form);

  // Send a signal once the user enters data in the form.This will send the data entered to all participants
  form.addEventListener('submit', function(event) {
    event.preventDefault();

    session.signal({
      type: 'chat',
      data: msgTxt.value
    }, function(error) {
      if (!error) {
        msgTxt.value = '';
      }
    });
  });

}
