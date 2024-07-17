@echo off

:menu
echo =============================================================================
echo Select one of the Three Shapes to Calculate Their Area
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo 4. Exit
choice /c 1234 /m "Choose an Option:"

if errorlevel 4 goto exit
if errorlevel 3 goto quadrilateral
if errorlevel 2 goto triangle
if errorlevel 1 goto circle



:circle
echo =============================================================================
echo Enter the Radius of the Circle to calculate the Area
set /p rad= "Radius: "
set /a area=3*rad*rad
echo The area of the Circle is %area%
goto menu

:triangle
echo =============================================================================
echo Enter the Sides of the Triangle to calculate the Area
echo Enter the first side of the Triangle:
set /p side1= "Side 1: "
echo Enter the second side of the Triangle:
set /p side2= "Side 2: "
echo Enter the third side of the Triangle:
set /p side3= "Side 3: "
set /a s1=%side1%
set /a s2=%side2%
set /a s3=%side3%

echo =============================================================================
set /a perimeter=%s1% + %s2% + %s3%
set /a s=%perimeter%/2
set /a area=%s% * ((%s%-%s1%) * (%s%-%s2%) * (%s%-%s3%))
call :SquareRoot %area%
echo The area of the Triangle is %answer%

rem For conditions to determine what kind of triangle was calculated
if %s2% EQU %s3% (
    if %s1% EQU %s2% (
        if %s1% EQU %s3% (
            echo The Calculated Triangle is a Equillateral.
            goto menu
        )
    )
) 

if %s1% NEQ %s2% (
    if %s1% NEQ %s3% (
        if %s2% NEQ %s3% (
            echo The Calculated Triangle is a Scalene.
            goto menu
        )
    )
) else (
    echo The Calculated Triangle is a Isosceles
    goto menu
)
:SquareRoot
    SETLOCAL EnableDelayedExpansion
    set root=1
    set /a sqr=%root%*%root%
    :Loop
    if %sqr% LSS %area% (
        set /a root=!root!+1
        set /a sqr=!root!*!root!
        goto Loop
    )
    (EndLocal && set answer=%root% && exit /B)

:quadrilateral
echo =============================================================================
echo Enter the Sides of the Quadrilateral to calculate the Area
set /p s1= "Enter the Length of the Quadrilateral: "
set /p s2= "Enter the Width of the Quadrilateral: "
set /a area= s1*s2
echo The area of the Quadrilateral is %area%

rem For conditions to determine what kind of Quadrilateral was calculated
if "%s1%"=="%s2%" (                                  
    echo The Calculated Quadrilateral is a Square.  
) else (                 
    echo The Calculated Quadrilateral is a Rectangle.
)
goto menu

:exit
echo GOODBYE!
