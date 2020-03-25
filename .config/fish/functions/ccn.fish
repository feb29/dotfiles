# Defined in - @ line 1
function ccn --wraps='echo (kubectx -c)":"(kubens -c)' --description 'print Current Context and Namespace'
    if type -q kubectx && type -q kubens
        echo (kubectx -c)":"(kubens -c);
    else
        return 1
    end
end
