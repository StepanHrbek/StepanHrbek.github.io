rem i had menu in <iframe>, but they say iframe is baad
rem so this advanced site builder was born
rem it pushes menu from index.html (first 30 lines) to all other html files (replacing all before 31.line)

type index.html | ..\usr\bin\head -n +30 > index.head

for %%f in (*.html) do IF /i NOT "%%f"=="index.html" (
	echo %%f
	type %%f | ..\usr\bin\tail -n +31 > %%~nf.tail
	copy index.head + %%~nf.tail %%~nf.html
	del %%~nf.tail
)

del index.head
