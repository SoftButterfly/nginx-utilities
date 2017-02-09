# softbutterfly::nginx

<!-- [![Preview](./banner.png)][1] -->
[![MIT License][2]][1] [![Bash][3]][1]

A collection of utilities to work with nginx.

## Authors

* [@zodiacfireworks](https://github.com/zodiacfireworks)

## Contribute

Suggestions, reported and documented issues, and pull request to contribute
are welcome.

To send a pull request the unique condition is the use of ``commit.template``
file stored at ``settings`` directory. You can set this file as your git's
``commit.template`` by following this commands

```bash
$ cd /path/to/softbutterfly-nginx
$ git config --local commit.template `$(pwd)`/settings/commit.template
```

After that, you will need add your changes and commit in the following way

```bash
$ git add .
$ git commit
$ # Do the necessary changes and fill the requested information
$ git commit -F .git/COMMIT_EDITMSG
```

## Licensing

All resources developed by Softbutterfly members in this repository is released under the MIT license.

```
The MIT License

Copyright (c) 2017 SoftButterfly, https://softbutterfly.io/

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

Resource with its respective licences are protectect by them.

If you find copyright protected content or without its respective credits,
please let us know to give the respective credits and to put the things in
order according to laws.


[1]: https://github.com/softbutterfly/softbutterfly-nginx
[2]: https://img.shields.io/badge/License-MIT-blue.svg?maxAge=2592000&style=flat-square
[3]: https://img.shields.io/badge/Language-Bash-lightgrey.svg?maxAge=2592000&style=flat-square
