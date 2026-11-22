function wallpaper --description 'Set and save the i3 wallpaper'
    if test (count $argv) -ne 1
        echo 'Usage: wallpaper IMAGE' >&2
        return 2
    end

    set -l image (realpath -e -- "$argv[1]")
    or return 1
    test -f "$image"; or return 1

    feh --bg-fill -- "$image"
end
