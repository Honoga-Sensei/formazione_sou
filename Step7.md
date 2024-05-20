# Step 7

## Creare file e modificarne i permessi

Iniziamo creadno un file con il comando `touch` ed osserviamone le autorizzazioni tramite `ls -l`.\
```
$ touch foo.log
$ ls -l foo.log
-rw-r--r--. 1 [username] [username] [data e ora] foo.log
```
La prima parte `rw-r--r--` contiene appunto le autorizzazione del file dov `r = read`, `w = write`,
e lultima non presente in questo caso `x = execute`. Questi permessi vanno letti in gruppi di tre `rwx`
in cui la prima terzina indica `l'owner [u]` la seconda `il gruppo [g]` e la terza `gli altri utenti [o]` 

Possiamo modificare questi permessi grazie al comando `chmod` specificando di seguito `u` `g` `o` per 
specificare a chi andremmo a modificarli (possono essere combinati tra di loro, e se si vogliono indicare 
ed in caso si vogliano indicare tutti si può usare direttamente `all`), seguito da `+` `-` `=` per 
indicare se aggiungere, togliere o impostare i permessi, seguito ancora dai permessi da modificare 
`r` `w` `x`.
```
$ chmod go+w foo.lib
```
Così facendo abbiamo dato il diritto di scrittura anche agli altri utenti oltr il propretario.
