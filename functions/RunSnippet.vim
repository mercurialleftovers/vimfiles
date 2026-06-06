vim9script


def g:RunSnippet(): void
    var pycmd: string = executable("python3") ? "python3" : "python" # for linux
    var jscmd: string = executable("deno") ? "deno" : "node"
    var FNAME_PHOLDER: string = "FILENAME_PLACE_HOLDER"
    var TERM_SPAWN = "term ++shell"

    var interpreters = {
        python: $"{TERM_SPAWN} {pycmd} {FNAME_PHOLDER}",
        javascript: $"{TERM_SPAWN} {jscmd} {FNAME_PHOLDER}",
        typescript: $"{TERM_SPAWN} {jscmd} {FNAME_PHOLDER}",
        lua: $"{TERM_SPAWN} lua {FNAME_PHOLDER}",
        bash: $"{TERM_SPAWN} sh {FNAME_PHOLDER}",
        dosbatch: $"{TERM_SPAWN} call {FNAME_PHOLDER}",
        vim: $":source {FNAME_PHOLDER}",
    }

    if interpreters->has_key(&filetype)
        var interpreter = interpreters[&filetype]
		var filename: string = $"__scratch__.{expand('%:e')}"
        var cmd: string = substitute(interpreter, FNAME_PHOLDER, filename, "g")

        # writing the temp file
		execute $":'<,'>w! {filename}"

		if findfile(filename) == filename
			execute cmd
			system($"!rm {filename}") # TODO(bader): account for windows ? maybe not!
		else
			echo $"{filename} does not exist!"
		endif
	endif
enddef
