if did_filetype()
    finish
endif

let first2lines = getline(1, 2)
for line in first2lines
    let matched =  (line =~ '\(\s[EDBVIA]\s\S\+\s*:\s\)\|\(\s\?[EDBVIA]\/\S\+\s*(\(\s\|\d\)\+):\s\)')
    if matched
        setfiletype logcat
        break
    endif
endfor
