vim9script

var TEX_OUT_DIR: string = 'C:\tex_out'
var PDF_READER_PATH: string = 'C:\tools\sumatra\SumatraPDF.exe'
var TEMPLATES_DIR = $MYVIMDIR .. '\\' .. "templates"
# var MUPDF_PATH: string = 'C:\tools\mupdf\mupdf.exe'
# var MUPDF_GL_PATH: string = 'C:\tools\mupdf\mupdf-gl.exe'

def g:Run_current_file(): void
	var package_json_exists: bool = findfile("package.json") == "package.json"
    var pycmd: string = executable('python') ? 'python' : 'python3'
    var interpreters: dict<string> = {python: pycmd, javascript: (package_json_exists ? "npm run test" : "deno run"), typescript: "deno lint && deno run", html: "start", dosbatch: "call", lua: "lua"}
    # TODO(bader): future-version should substitute the file name into the relevant command in case the format is
    # not as simple as "interpreter %", but instead contains args after the %
    if findfile(g:build_file) == g:build_file
        execute $"term ++shell {g:clear_cmd} && .{g:back_slash}{g:build_file}" # TODO(bader): terminal mode
    elseif interpreters->has_key(&filetype)
		var cmd: string = $"term ++shell {interpreters[&filetype]} %"
        execute cmd
    elseif &filetype == "vim"
        execute "source %"
    else
        echo $"{&filetype} has no corresponding interpreter"
    endif

    if &filetype == "tex"
        var summatra_running: string = system("tasklist | grep umatra")
        # execute $"!{g:clear_cmd} && pdflatex -output-directory={TEX_OUT_DIR} %"
        execute $"term {g:clear_cmd} && pdflatex -output-directory={TEX_OUT_DIR} %" # TODO(bader): making scripts execute in terminal mode rather than spawn a shell
        if summatra_running == "" # not running
            # execute $"!{g:clear_cmd} && {PDF_READER_PATH} {TEX_OUT_DIR}\\{fnamemodify(expand('%'), ':t:r')}.pdf" # TODO(bader): term mode
            execute $"term ++shell {g:clear_cmd} && {PDF_READER_PATH} {TEX_OUT_DIR}\\{fnamemodify(expand('%'), ':t:r')}.pdf"
        endif
    endif

enddef
