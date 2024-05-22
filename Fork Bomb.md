# Fork Bomb

This .md is meant to explain what a fork bomb is and how to prevent it.

A fork bomb is a form of denial of service (DoS) for unix based system. It consist in a bash function which iterate 
itself again and again, multiplying each time the number of iterations.

The code works as following
```
bomb() {        # Initialize the function
bomb | bomb &   # Create new iteration of the function in background
}; bomb         # End the function an iter again
```
Or in just one line so it can be executed easely as a shell comand while in SSH connection.
```
bomb () { bomb | bomb & }; bomb
```
> [!CAUTION]
> This script will crash the hosting machine

The bomb can be mitigated limiting the number of process a user can start with something like `ulimit` command.
```
ulimit -u [number_of_process]
```
This will limit the number the number of process so that the script will not cause the machine to crash.

