# Step 7

## Creating Files and Modifying Their Permissions

Let's start by creating a file using the touch command and then observe its permissions using `ls -l`.
```
$ touch foo.log
$ ls -l foo.log
-rw-r--r--. 1 [username] [username] [data e ora] foo.log
```
The first part, `rw-r--r--`, shows the file permissions where `r = read`, `w = write`, and the last one, not present in this case, `x = execute`. These permissions are read in groups of three rwx, where the first set indicates the `owner [u]`, the second set indicates the `group [g]`, and the third set indicates `others [o]`.

We can modify these permissions using the `chmod` command by specifying `u` (user), `g` (group), and `o` (others) to indicate whom we are modifying the permissions for (these can be combined, and if you want to indicate all, you can use `all`), followed by `+`, `-`, or `=`to indicate whether to add, remove, or set the permissions, followed by the permissions to be modified `r`, `w`, `x`.
```
$ chmod go+w foo.lib
```
By doing this, we have given write permissions to the group and others in addition to the owner.
