================
NGINX::Utilities
================

A collection of utilities to work with nginx.

.. image::
    https://img.shields.io/packagist/l/doctrine/orm.svg?maxAge=2592000
    :alt: MIT License
    :target: https://github.com/SoftButterfly/nginx-utilities


Table of Contents
=================

.. contents::
    :depth: 3


Authors
=======

Authors

* `@ZodiacFireworks <https://github.com/ZodiacFireworks>`_ (Martin Vuelta)


Contribute
==========

Suggestions, reported and documented issues, and pull request to contribute
are welcome.

To send a pull request the unique condition is the use of ``commit.template``
file stored at ``settings`` directory. You can set this file as your git's
``commit.template`` by following this commands

.. code-block:: bash

    $ cd /path/to/nginx-utilities
    $ git config --local commit.template `$(pwd)`/commit.template

After that, you will need add your changes and commit in the following way

.. code-block:: bash

    $ git add .
    $ git commit
    $ # Do the necessary changes and fill the requested information
    $ git commit -F .git/COMMIT_EDITMSG


Licensing
=========

This package is released under the MIT license.

::

    The MIT License

    Copyright (c) 2016 Martin Vuelta, http://zodiacfireworks.github.io/

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
