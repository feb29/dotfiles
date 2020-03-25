function expand_global_alias
    switch (commandline -t)
    case "A"
        commandline -rt '| awk'
    case "F"
        commandline -rt '| fzf'
    case "L"
        commandline -rt '| less'
    case "H"
        commandline -rt '| head'
    case "T"
        commandline -rt '| tail'
    case "G"
        commandline -rt '| rg'
    case "W"
        commandline -rt '| wc'
    case "X"
        commandline -rt '| xargs'
    end
end
