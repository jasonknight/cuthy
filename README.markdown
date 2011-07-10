== Why?

  Practice yourself, for heaven's sake, in little things; 
  and thence proceed to greater. 
                              — EPICTETUS (Discourses IV. i) 
                              
The above quote sums it up. We all take for granted that we understand
how computers work, and what an algorithm really means, but the truth
is that computer programming, as an art, is fast dying out and we rely,
perhaps rightly, perhaps wrongly, more and more on libraries that 
"take care of it" for us. The "it" of course being those nasty little
details that actually have to do with the way real computers really work.

Following this philosophy, that nasty little details should be taken care
of for us by someone else, we have become a generation of programmers who 
speak entirely in buzzwords, BDD and TDDP, User Stories and Stakeholders,
and Agile Methodologies, Object Orientation, MVC, and MVCS, Instances vs. 
Singletons and all manner of paradigms that are in fact useful to know about,
but they have little to do with the way computers actually work, and how
they are actually programmed.

I have started this project with a simple goal, to understand how a computer
actually works. Not in abstract language, but in all it's practical and
procedural glory.

I don't want to be protected from the gritty truth of the computers world.
I don't want to be protected from the truth at all.

== Naming

The naming of the examples is by Algorithm, for instance 'algorithm-e.c', or 
'algorithm-e2.c', and 'algorithm-p.c'.

These will be compiled to program-e.asm for the asm code produced by the 
c compiler, and program-e.bin as the executable.

The .asm and .bin files will not be included in the repo,  you will have to
compile them on your own machine.

Each program will announce which Algorithm it is, and on what page of
Knuth's The Art of Programming it can be found.

A shell script called run is provided, and you can use it by running the command:
  $./run [e|e2|p| ...]



