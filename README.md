# Packen Test

----

## Content

* lib  
  * Active Support
    * Deep Symbolize Keys
* bin
* test

## Assumptions

* Each bowling game has 10 frames, with the last frame being a bonus frame consisting of up to 3 bowls

* When calculating the score, only frames that have been completed will be evaluated for the total score for a player so far

* The scoreboard can be printed onto the screen at any time, even before the game has ended

* The solution was designed for use as a CLI which receives arguments