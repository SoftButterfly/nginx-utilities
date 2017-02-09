# Contribute

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
