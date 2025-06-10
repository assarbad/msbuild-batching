# Experimenting with MSBuild batching

Batching in MSBuild essentially exploits the feature of `cl.exe` to take an arbitrary number of input files with the same command line arguments (with an inherent way to map input file to output file one by one) and make a single invocation for that batch of items. This can considerably speed up builds and it relies on the client/server architecture built into `cl.exe` or other suitable tools to distribute the work to a pool of processes (process creation in Win32 is _relatively_ expensive, so keeping processes around instead of spawning new ones makes a difference).

## Furthermore ...

This also includes test projects that I use to dabble with MSBuild in order to retrieve circumstantial information during a build (e.g. the compiler version: [`ClVersionRetrieve.targets`](ClVersionRetrieve.targets)).
