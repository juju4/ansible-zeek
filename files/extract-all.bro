## from https://www.bro.org/bro-exchange-2013/exercises/faf.html

global ext_map: table[string] of string = {
    ["application/x-dosexec"] = "exe",
    ["text/plain"] = "txt",
    ["image/jpeg"] = "jpg",
    ["image/png"] = "png",
    ["text/html"] = "html",
} &default ="";

event file_new(f: fa_file)
    {
    if ( ! f?$mime_type || f$mime_type != "application/x-dosexec" )
        return;

    local ext = "";

    if ( f?$mime_type )
        ext = ext_map[f$mime_type];

    local fname = fmt("%s-%s.%s", f$source, f$id, ext);
    Files::add_analyzer(f, Files::ANALYZER_EXTRACT, [$extract_filename=fname]);
    }
