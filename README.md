# git

> Git in Ruby

## Notes

`.git/info/exclude` supports similar behaviour than `.gitignore` but is not
part of the source tree.

I had a hard time understanding the concept of *trees*. I think I kinda get
it now. Every *object* represents a tree and either points to a list of other
trees (directory) or blobs (file).

The glorious command for all things objects is `git cat-file -p`. Easy to follow
a path of hex chars (print commit, tree, file, …).

* Commits point to trees
* Trees point to blobs

The technique of reducing the number of subdirectories and files in a single
directory is super helpful and can bring a great speedup if you have to scan
your filesystem regularly. For example, lots of file caches do this.

In order to save storage space, git tries to compress every file by default.
It uses *DEFLATE* to do this (implemented by zlib).

Use `cat object | ./bin/inflate` to decompress and print an object.

The history of [Alice and Bob](https://en.wikipedia.org/wiki/Alice_and_Bob).

SHA-1 and the [Birthday problem](https://en.wikipedia.org/wiki/Birthday_problem).

Git does not rely on SHA-1 as proof of trust. Its intended use is as an
integrity check against accidental damage, not as part of a digital signature.
That said, if we use checksums (e.g. to check changes in a single file), we can
still use MD5 or even CRC/Adler32. Whatever is fastest.

A doc about the [transition](https://github.com/git/git/blob/master/Documentation/technical/hash-function-transition.txt)
from SHA-1 to SHA-256 in git.

## Dev

* Coding conventions → [standard](https://rubygems.org/gems/standardrb)
* Ruby 2.6.3

## Credits

This work is based on the book
[Building Git](https://shop.jcoglan.com/building-git/) by
[James Coglan](http://jcoglan.com/).

## License

[MIT License](./LICENSE)
