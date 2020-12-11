Given a list of files like the `gpl3list.txt` below, you can update multiple versions of that file list using `sed` and a `for` loop, like the `gpl3change.sh` script below.

The `gpl3list.txt` was created using:
```
cd ~/sbo/
grep -i Ryan\ P.C.\ McQuen */*/*.info > ../gpl3list.txt
```

`~/sbo/` is the slackbuilds.org repo. That file is then filtered using: `sed -i 's/:.*//g' gpl3list.txt`.

=====

In a different scenario (changing an email for instance), you would want more than just the `.info` files, so:

```
grep -i "foo@bar.baz" */*/* > ../oldEmailList.txt
sed -i 's/:.*//g' oldEmailList.txt
```

And then running the file `emailChange.sh` below would do most of the work. The only remaining issue is that each file has its own commit! There are several ways to fix this, but one of the easiest ones is to `git rebase -i master` and then change `pick` to `fixup` on any duplicates. Vim macros are your friend for this part!