
# Julia crash course for cognitive modelers

⚠️  **This is currently aspirational.** ⚠️

To whet your appepite, I truly believe that learning Julia opens up a lot of modeling projects that wouln't be feasible otherwise. It's not uncommon to get a 100x speed up over a Python implementation, even wihout a lot of careful optimization (which can get you up to 1000x). It is without a doubt my useul technical skill. And while this is posible by creating complicated systems that integrate Python with C++ or other compiler tools (JAX, numba), Julia is unique in that you can write a quick prototype in a notebook or REPL and (sometimes with some minor optimizations) end up with code that runs as fast as C++. Critically, unlike Matlab and R which can be fast for specific matrix 

Is that sound exciting to you, this resource (which, to be clear, doesn't exist yet) might just be for you!

The main goals of the intial tutorials are:

1. Demonstrate how the speed of Julia can speed up your development process and open up projects that would be effectively impossible in Python, Matlab, R
2. Help you decide whether your modeling use case actually warrants investing the time
3. Help you set up a Julia development environment (e.g VS code has best support). Because Julia is JIT, the standard approach of running the program fresh from the commandline every time is quite slow.
4. Familiarize you with non-standard julia syntax, especially the innovative parts that will make you dread switching back to other languages.
5. Introduce the core libraries: 
6. Distributions, Optim
5. Benchmarking and identifying compute bottlenecks.
6. Cover common mistakes that prevents Julia code from being fast.

As much as possible, we'll try to introduce the concept in the context of cognitive modeling. 

One important caveat: we will assume you are proficient in at least one imperative programming language such as Python, Matlab, R, Javascript

If the intial tutorial are successful, I'd like to expand this into a resourece for more advanced/specific tools that come in handy for cognitive modeling. To name a few (please add to the list!):

- distributed computation
- model fitting
- plotting in julia inclueding fast-genrated animation with [Makie](https://docs.makie.org/stable/)
- integration with R for plotting, data-wranpling, and stats (Julia hasn't quite caught up on this front, but there are some promising directions
- Tidier.jl](https://github.com/TidierOrg/Tidier.jl))
- understanding the power and pitfall multiple disatch and parametric types
- Improving startup time with [PackageCompiler.jl](https://github.com/JuliaLang/PackageCompiler.jl)
- Integrating with external packages such as [BADS]( https://github.com/lacerbi/bads) 
- Probabilistic programming with Turing.jl, and better yet Gen.jl if we can find a resident expert (I believe the latter is the state of the art in program synthesis and any other models with complex control flow)
