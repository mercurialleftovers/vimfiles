vim9script


def g:RunSnippet(): void
	var interpreters: dict<string> = {python: "python", javascript: "deno run", typescript: "deno run"}

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
