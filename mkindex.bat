:: Creates an index.html file
:: Step 1 - Create & Delete Index
:: cnt = # of files

echo > index.html
del index.html
for /f %%a in ('dir ^|find "File(s)"') do set cnt=%%a

echo index.html
echo ^<html^> >> index.html

:: echo ^<style^> >> index.html
:: echo body{margin:10px;max-width:500px;} >> index.html
:: echo img{width:100%%;} >> index.html
:: echo ^</style^> >> index.html

echo ^<head^> >> index.html
echo  ^<link rel="stylesheet" href="../styles.css"^> >> index.html
echo ^</head^> >> index.html

echo ^<body^> >> index.html

for /l %%a in (1,1,%cnt%) do (
  if %%a LSS 10 (
    echo ^<img src=00%%a.webp^>^</img^>^<br^> >> index.html )
  if %%a GEQ 10 (
    echo ^<img src=0%%a.webp^>^</img^>^<br^> >> index.html )
)

echo ^</body^> >> index.html
echo ^</html^> >> index.html
