var page = require('webpage').create();
var args = require('system').args;
var successMsg = args.length > 1 && args[1] ? args[1] : null;

page.onConsoleMessage = function(msg) {
  console.log(msg);
  if(successMsg !== null && successMsg === msg) phantom.exit(0);
};

page.open('bin/phantomjs.html', function(status) {
  // If we arrive here, no successMsg has been found in console.log.
  var success = status === 'success' && successMsg === null;
  phantom.exit(success ? 0 : 1);

  // If you want to search for successMsg in document.body instead:
  // var result = page.evaluate(function() { return document.body.innerText; });
  // phantom.exit(success || result.indexOf(successMsg) >= 0 ? 0 : 1);
});
