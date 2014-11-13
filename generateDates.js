var handlebars = require('handlebars'),
  fs = require('fs'),
  moment = require('moment'),
  output = '';

fs.readFile('./tmpl-date.hbs', 'utf8', function (err, tmpl) {
  generateHtml(tmpl);
});

var shows = {
  "shows": [
    {
      "date": "2014-12-06",
      "info": "opening for Mike Birbiglia",
      "city": "Los Angeles, CA",
      "url": "http://www.ticketmaster.com/mike-birbiglia-los-angeles-california-12-06-2014/event/09004CCBA95E7C1C",
      "venue": "Wilshire Ebell Theatre"
    },
    {
      "date": "2014-12-07",
      "info": "opening for Mike Birbiglia (two shows)",
      "city": "Santa Cruz, CA",
      "url": "http://www.ticketweb.com/t3/sale/SaleEventDetail?dispatch=loadSelectionData&eventId=4235254",
      "venue": "Rio Theatre"
    },
    {
      "date": "2014-12-09",
      "info": "Dr. Frank Book Release",
      "city": "New York, NY",
      "url": "https://www.facebook.com/events/1496839560600949",
      "venue": "Housing Works",
      "isinfo": true
    },
    {
      "date": "2014-12-10",
      "info": "Tumblr Event",
      "city": "Brooklyn, NY",
      "url": "http://www.bkbazaar.com",
      "venue": "Brooklyn Night Bazaar",
      "isinfo": true
    },
    {
      "date": "2014-12-13",
      "info": "CHUMPED Record Release Show",
      "city": "Brooklyn, NY",
      "url": "http://suburb1a.tumblr.com/",
      "venue": "Suburbia",
      "isinfo": true
    },
    {
      "date": "2014-12-14",
      "info": "The Macauley Culkin Show",
      "city": "Brooklyn, NY",
      "url": "http://liveatsheastadium.com",
      "venue": "Shea Stadium",
      "isinfo": true
    },
    {
      "date": "2014-12-15",
      "info": "Sagher and Gethard",
      "city": "New York, NY",
      "url": "http://ucbtheater.com",
      "venue": "UCB Theater",
      "isinfo": true
    },
    {
      "date": "2014-12-20",
      "info": "Chris Gethard Fuckin Loves Weirdos",
      "city": "Brooklyn, NY",
      "url": "http://www.unionhallny.com/event/719187",
      "venue": "Union Hall"
    },
    {
      "date": "2014-12-21",
      "info": "The Front Bottoms Champagne Jam",
      "city": "New York, NY",
      "url": "http://www.ticketweb.com/t3/sale/SaleEventDetail?dispatch=loadSelectionData&eventId=5384765&pl=webconcerts",
      "venue": "Webster Hall"
    }
  ]
}

function generateHtml (tmpl) {
  for (var i = 0; i < shows.shows.length; i += 1) {
    var show = shows.shows[i],
      ctx = show,
      template = handlebars.compile(tmpl);

    ctx.datetime = show.date;
    ctx.date = moment(show.date).format('M/DD/YYYY');
    var html = template(ctx);

    output += html;
  }

  console.log(output);
}
