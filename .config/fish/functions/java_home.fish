function java_home -d "print JAVA_HOME"
    /usr/libexec/java_home -V &| tail -n +2 | head -n -2 | fzf -0 -1 | awk '{ print $5 }'
end
