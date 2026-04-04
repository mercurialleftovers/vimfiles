vim9script


var hotReload: bool = false

def g:HotReload(): void
    if hotReload
        call g:Run_current_file()
    endif
enddef


def g:ToggleHotReload(): void
    hotReload = !hotReload
    echo "hot reload is " .. (hotReload ? "activated" : "deactivated")
enddef
