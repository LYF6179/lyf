:: Creates an 2index.html file
:: Step 1 - Create & Delete Index
:: cnt = # of files

echo > 2index.html
del 2index.html
for /f %%a in ('dir ^|find "File(s)"') do set cnt=%%a

echo 2index.html
echo ^<html^> >> 2index.html

:: echo ^<style^> >> 2index.html
:: echo body{margin:10px;max-width:500px;} >> 2index.html
:: echo img{width:100%%;} >> 2index.html
:: echo ^</style^> >> 2index.html

echo ^<head^> >> 2index.html
echo  ^<link rel="stylesheet" href="../styles.css"^> >> 2index.html
echo ^</head^> >> 2index.html

echo ^<div class="nav">^> >> 2index.html

set dir=%%CD:~36,3%%

echo <a href="/LYF/001">Prev&nbsp;</a>>index2.html
echo <a href="/LYF/">Main&nbsp;</a>>index2.html
echo <a href="/LYF/003">Next&nbsp;</a>>index2.html

echo ^</div>^> >> 2index.html

echo ^<body^> >> 2index.html

for /l %%a in (1,1,%cnt%-1) do (
  if %%a LSS 10 (
    echo ^<img src=00%%a.webp^>^</img^>^<br^> >> 2index.html )
  if %%a GEQ 10 (
    echo ^<img src=0%%a.webp^>^</img^>^<br^> >> 2index.html )
)

echo ^</body^> >> 2index.html
echo ^</html^> >> 2index.html
