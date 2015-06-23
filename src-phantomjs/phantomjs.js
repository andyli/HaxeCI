var page = require('webpage').create();
var args = require('system').args;

var successMsg = args.length > 1 && args[1] ? args[1] : null;
var success = successMsg === null;

page.onConsoleMessage = function(msg) {
  console.log(msg);
  if(!success && successMsg === msg) success = true;
};

page.open('bin/phantomjs.html', function(status) {
  success = status === 'success' && success;
  phantom.exit(success ? 0 : 1);

  // If you want to search for successMsg in document.body instead:
  // var result = page.evaluate(function() { return document.body.innerText; });
  // phantom.exit(success || result.indexOf(successMsg) >= 0 ? 0 : 1);
});
