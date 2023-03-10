rem i had menu in <iframe>, but they say iframe is baad
rem so this advanced site builder was born
rem it pushes menu from index.html (first 28 lines) to all other html files (replacing all until line 29)

type index.html | head -n +28 > index.head

for %%f in (*.html) do IF /i NOT "%%f"=="index.html" (
	echo %%f
	type %%f | tail -n +29 > %%~nf.tail
	copy /b index.head + %%~nf.tail %%~nf.html
	del %%~nf.tail
)

del index.head
