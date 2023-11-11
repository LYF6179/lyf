:: Creates an index.html file
:: Step 1 - Create & Delete Index
:: cnt = # of files

setlocal ENABLEDELAYEDEXPANSION

echo > index.html
del index.html
for /f %%a in ('dir ^|find "File(s)"') do set cnt=%%a

echo ^<html^> >> index.html

:: echo ^<style^> >> index.html
:: echo body{margin:10px;max-width:500px;} >> index.html
:: echo img{width:100%%;} >> index.html
:: echo ^</style^> >> index.html

echo ^<head^> >> index.html
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> index.html
echo   ^<link rel="stylesheet" href="../styles.css"^> >> index.html
echo ^</head^> >> index.html

echo ^<div class="nav"^> >> index.html

set c=!cd:~36,3!
set /a p=!c!-1
set /a n=!c!+1

:: Add Prev Link
if !p! LSS 2 (
  echo ^<a href="../"^>Prev^</a^>^&nbsp; >> index.html
) else ( 
    if !p! LSS 10 (
      echo ^<a href="../00!p!"^>Prev^</a^>^&nbsp; >> index.html    
    ) else (
        if !p! LSS 100 (
          echo ^<a href="../0!p!"^>Prev^</a^>^&nbsp; >> index.html    
        ) else ( 
            echo ^<a href="../!p!"^>Prev^</a^>^&nbsp; >> index.html            )
          ) 
      )
  )

:: Add Main Link
echo ^<a href="../"^>Main^</a^>^&nbsp; >> index.html    

:: Add Next Link
if !n! LSS 10 (
  echo ^<a href="../00!n!"^>Next^</a^>^&nbsp; >> index.html   
) else (
    if !n! LSS 100 (
      echo ^<a href="../0!n!"^>Next^</a^>^&nbsp; >> index.html    
    ) else (
        if !n! LSS 206 (
          echo ^<a href="../!n!"^>Next^</a^>^&nbsp; >> index.html    
        ) else (
            echo ^<a href="../"^>Next^</a^>^&nbsp; >> index.html    
          )
      )
 )


echo ^</div>^> >> index.html

echo ^<body^> >> index.html

for /l %%a in (1,1,%cnt%) do (
  if %%a LSS 10 (
    echo ^<img src=00%%a.webp^>^</img^>^<br^> >> index.html
  )
  if %%a GEQ 10 (
    echo ^<img src=0%%a.webp^>^</img^>^<br^> >> index.html 
  )
)

echo ^<div class="nav"^> >> index.html

set c=!cd:~36,3!
set /a p=!c!-1
set /a n=!c!+1

:: Add Prev Link
if !p! LSS 2 (
  echo ^<a href="/../"^>Prev^</a^>^&nbsp; >> index.html
) else ( 
    if !p! LSS 10 (
      echo ^<a href="/../00!p!"^>Prev^</a^>^&nbsp; >> index.html    
    ) else (
        if !p! LSS 100 (
          echo ^<a href="/../0!p!"^>Prev^</a^>^&nbsp; >> index.html    
        ) else ( 
            echo ^<a href="/../!p!"^>Prev^</a^>^&nbsp; >> index.html            )
          ) 
      )
  )

:: Add Main Link
echo ^<a href="/../"^>Main^</a^>^&nbsp; >> index.html    

:: Add Next Link
if !n! LSS 10 (
  echo ^<a href="/../00!n!"^>Next^</a^>^&nbsp; >> index.html   
) else (
    if !n! LSS 100 (
      echo ^<a href="/../0!n!"^>Next^</a^>^&nbsp; >> index.html    
    ) else (
        if !n! LSS 206 (
          echo ^<a href="/../!n!"^>Next^</a^>^&nbsp; >> index.html    
        ) else (
            echo ^<a href="/../"^>Next^</a^>^&nbsp; >> index.html    
          )
      )
 )


echo ^</div>^> >> index.html

echo ^</body^> >> index.html
echo ^</html^> >> index.html