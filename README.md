# WildPointerChecker
check wild pointer crash in iOS App. inspiration from zombie object.

[![Build Status](https://travis-ci.org/hdu-rtt/WildPointerChecker.svg?branch=master)](https://travis-ci.org/hdu-rtt/WildPointerChecker)

# How to work
- use fishhook(facebook) lib hook the C method free
- in my free method add the pointer to a unfree list
- when the memory is out off limit, free some
- copy WPCZombieObject Class to the free memory
- rewrite WPCZombieObject's forwardingTargetForSelector to catch the selector

# Usage
- #import "WildPointerChecker/WildPointerChecker.h" in your .m
- call startWildPointerCheck() anywhere to start, you'd better not call twice.
- call stopWildPointerCheck() anywhere to stop