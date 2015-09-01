An example of using CI for Haxe projects.

[![TravisCI Build Status](https://travis-ci.org/andyli/HaxeCI.svg?branch=master)](https://travis-ci.org/andyli/HaxeCI)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/andyli/HaxeCI?branch=master&svg=true)](https://ci.appveyor.com/project/andyli/HaxeCI)

Same procedure is used for setting up both [Travis CI](https://travis-ci.org/) and [AppVeyor](http://www.appveyor.com/):
 1. Create a Haxe project if there isn't one.
 2. Create a new repo on Github.
 3. Turn on the switches for the Github repo on Travis CI/AppVeyor.
 4. Copy and modify the configs:
     * [.travis.yml](.travis.yml) for Travis CI
     * [appveyor.yml](appveyor.yml) for AppVeyor
 5. Commit the configs and push to Github.
 6. Watch it build:
     * `https://travis-ci.org/${username}/${reponame}` for Travis CI
     * `https://ci.appveyor.com/project/${username}/${reponame}` for AppVeyor
 7. Add badges to README:
     * `https://travis-ci.org/${username}/${reponame}.svg?branch=master` for Travis CI
     * `https://ci.appveyor.com/api/projects/status/github/${username}/${reponame}?branch=master&svg=true` for AppVeyor

<p xmlns:dct="http://purl.org/dc/terms/" xmlns:vcard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <a rel="license"
     href="http://creativecommons.org/publicdomain/zero/1.0/">
    <img src="http://i.creativecommons.org/p/zero/1.0/88x31.png" style="border-style: none;" alt="CC0" />
  </a>
  <br />
  To the extent possible under law,
  <a rel="dct:publisher"
     href="http://www.onthewings.net/">
    <span property="dct:title">Andy Li</span></a>
  has waived all copyright and related or neighboring rights to
  <span property="dct:title">HaxeCI</span>.
This work is published from:
<span property="vcard:Country" datatype="dct:ISO3166"
      content="HK" about="http://www.onthewings.net/">
  Hong Kong</span>.
</p>
