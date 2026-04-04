vim9script


# full screen in gui mode
var original_guioptions = &guioptions
var full_screen_toggled = (&guioptions =~ 's')

def g:ToggleFullScreen(): void
    echo "togglin full screen ..."
    if full_screen_toggled
        &guioptions = original_guioptions
    else
        &guioptions = original_guioptions .. "s"
    endif

    full_screen_toggled = !full_screen_toggled
enddef
