vim9script


def g:RunSnippet(): void
    var pycmd: string = executable("python") ? "python" : "python3"
	var interpreters: dict<string> = {python: pycmd, javascript: "deno run", typescript: "deno run", lua: "lua"}
    if interpreters->has_key(&filetype)
        var interpreter = interpreters[&filetype]
		var filename: string = $"__scratch__.{expand('%:e')}"
		execute $":'<,'>w! {filename}"

		if findfile(filename) == filename
			execute $"term ++shell {interpreters[&filetype]} {filename}"
		else
			echo $"{filename} does not exist!"
		endif
	endif
enddef
