:: Creates an index.html file for vertical scrolling numbered images

setlocal ENABLEDELAYEDEXPANSION

:: create & Delete Index for accurate file count
echo > index.html
del index.html

:: cnt = # of files
for /f %%a in ('dir ^|find "File(s)"') do set cnt=%%a

:: Write HTML to file
echo ^<html^> >> index.html

echo ^<head^> >> index.html
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> index.html
echo   ^<link rel="stylesheet" href="../styles.css"^> >> index.html
echo ^</head^> >> index.html

echo ^<div class="nav"^> >> index.html

:: Get current directory - last 3 letters
:: Convert text to numbers
:: Get prev and next numbers
set d=!cd:~36,3!
SET /a c=1000%d% %% 1000  
set /a p=!c!-1
set /a n=!c!+1

:: Add Prev Link, insert proper # of 0s. Before 1, link to Main.
if !p! LSS 1 (
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

:: Add Next Link, insert proper # of 0s. After 206, link to Main.
if !n! LSS 10 (
  echo ^<a href="../00!n!"^>Next^</a^>^&nbsp; >> index.html   
) else (
    if !n! LSS 100 (
      echo ^<a href="../0!n!"^>Next^</a^>^&nbsp; >> index.html    
    ) else (
        if !n! LSS 207 (
          echo ^<a href="../!n!"^>Next^</a^>^&nbsp; >> index.html    
        ) else (
            echo ^<a href="../"^>Next^</a^>^&nbsp; >> index.html    
          )
      )
 )

echo ^</div^> >> index.html
echo ^<body^> >> index.html

:: Insert img urls
for /l %%a in (1,1,%cnt%) do (
  if %%a LSS 10 (
    echo ^<img src=00%%a.webp^>^</img^>^<br^> >> index.html
  )
  if %%a GEQ 10 (
    echo ^<img src=0%%a.webp^>^</img^>^<br^> >> index.html 
  )
)

echo ^</body^> >> index.html

echo ^<div class="nav"^> >> index.html

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
        if !n! LSS 207 (
          echo ^<a href="../!n!"^>Next^</a^>^&nbsp; >> index.html    
        ) else (
            echo ^<a href="../"^>Next^</a^>^&nbsp; >> index.html    
          )
      )
 )


echo ^</div^> >> index.html

echo ^</html^> >> index.html
