if did_filetype()
    finish
endif

let first2lines = getline(1, 2)
let matches = v:false
for line in first2lines
    if line =~ '\(\s[EDBVIA]\s\S\+\s*:\s\)\|\(\s\?[EDBVIA]\/\S\+\s*(\(\s\|\d\)\+):\s\)'
        let matches = v:true
        break
    endif
endfor
if matches
    setfiletype logcat
endif
