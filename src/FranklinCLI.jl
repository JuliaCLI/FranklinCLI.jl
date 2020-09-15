module FranklinCLI

using Franklin, Comonicon
Comonicon.set_brief_length!(120)

"""
Generate a new folder for the website. It contains the
skeleton of a website that can be processed by Franklin.

# Arguments

- `path`: the path where you want to create the website.

# Options

- `-t,--template <name>`: template name, default is "basic"

# Flags

- `-v,--verbose`: add this flag to print verbose info.
"""
@cast function new(path; template="basic", verbose::Bool=false)
    Franklin.newsite(path; template=template, verbose=verbose, changedir=false)
    return
end

"""
Runs Franklin in the current directory.

# Options

- `--host <ip>`: the host to use for the local server, default is "127.0.0.1".
- `-p, --port <port>`: the port to use for the local server (should pick a number between 8000 and 9000).

# Flags

- `--clear`: whether to remove any existing output directory.
- `--verbose`: whether to display messages.
- `--single`: whether to run a single pass or run continuously.
- `--prerender`: whether to pre-render javascript (KaTeX and highlight.js).
- `--nomess`: suppresses all messages (internal use).
- `--eval_all`: whether to force re-evaluation of all code blocks.
- `--silent`: switch this on to suppress all output (including eval statements).
"""
@cast function serve(;
    host::String="127.0.0.1",
    port::Int=8000,
    clear::Bool=false, verbose::Bool=false,
    single::Bool=false,
    prerender::Bool=false,
    eval_all::Bool=false,
    silent::Bool=false,
    )

    Franklin.serve(;clear=clear, verb=verbose,
        port=port, single=single, prerender=prerender,
        eval_all=eval_all,
        silent=silent, host=host,
    )
end

@main name="franklin" doc="""
static site generator. Simple, fast, maths with KaTeX, code evaluation,
LaTeX-like commands, optional pre-rendering, in Julia.
"""

end
