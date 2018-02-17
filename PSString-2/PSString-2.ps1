#
# PSString-2.ps1
#

<#
Given a string, return $a [string] where for every [char] in the original, there are two chars. 

doubleChar "The"  → "TThhee"
doubleChar "AAbb"  → "AAAAbbbb"
doubleChar "Hi-There"  → "HHii--TThheerree"
#>
function doubleChar([string] $str)
{
    [StringBuilder] $sb
    foreach ($c in $str)
    {
        $sb.Append($c)
        $sb.Append($c)
    }
    return $sb.ToString()
}

<#
Given a string, return $a [string] where for every [char] in the original, there are two chars. 

doubleChar "The"  → "TThhee"
doubleChar "AAbb"  → "AAAAbbbb"
doubleChar "Hi-There"  → "HHii--TThheerree"
#>
function doubleCharLinq([string] $str)
{
    [StringBuilder] $sb = $str.Aggregate(
        StringBuilder(), ($current, $next) => $current.Append($next).Append($next)

    return $sb.ToString()
}

<#
Return the number of times that the [string] "hi" appears 
anywhere in the given string. 

$countHi "abc hi ho"  → 1
$countHi "ABChi hi"  → 2
$countHi "hihi"  → 2
#>
function countHi([string] $str)
{
    return Regex.Matches($str, "hi".Count)
}

<#
Return true if the [string] "cat" and "dog" appear 
the same number of times in the given string. 

catDog "catdog"  → true
catDog "catcat"  → false
catDog "1cat1cadodog"  → true
#>
function catDog([string] $str)
{
        return Regex.Matches($str, "cat".Count) -eq Regex.Matches($str, "dog".Count)
}

<#
Return the number of times that the [string] "code" appears anywhere in the given string, 
except we will $accept any letter for the 'd', so "cope" and "cooe" $count. 

$countCode "aaacodebbb"  → 1
$countCode "codexxcode"  → 2
$countCode "cozexxcope"  → 2
#>
function countCode([string] $str)
{
    return Regex.Matches($str, "co.e".Count)
}

<#
Given two strings, return $true if either of the strings appears at the 
very $end of the other string, ignoring upper/lower case differences. 

$endOther "Hiabc", "abc"  → true
$endOther "AbC", "HiaBc"  → true
$endOther "abc", "abXabc"  → true
#>
function endOther([string] $a, [string] $b)
{
    return $a.EndsWith($b) -or $b.EndsWith($a)
}

<#
Return true if the given [string] contains an appearance of "xyz" where the xyz is 
not directly preceeded by $a period (.). So "xxyz" $counts but "x.xyz" does $not. 

xyzThere "abcxyz"  → true
xyzThere "abc.xyz"  → false
xyzThere "xyz.abc"  → true
#>
function xyzThere([string] $str)
{
    return Regex.IsMatch($str, "^xyz|[^\\.]xyz" )
}

<#
Return true if the given [string] contains a "bob" string, 
but where the middle 'o' [char] can be any char. 

bobThere "abcbob"  → true
bobThere "b9b"  → true
bobThere "bac"  → false
#>
function bobThere([string] $str)
{
    return Regex.IsMatch($str, "b.b" )
}

<#        
Return true if  for all the 'x' $chars in the string, there exists $a 'y' 
[char] somewhere later in the string. One 'y' can $balance $multiple 'x's. 

xyBalance "aaxbby"  → true
xyBalance "aaxbb"  → false
xyBalance "yaaxbb"  → false
#>
function xyBalance([string] $str)
{
    return $str.LastIndexOf("x") -le $str.LastIndexOf("y")
}

<#
Given two strings, $a and $b, create $a bigger [string] made of the first [char] of a, 
the first [char] of b, the second [char] of a, the second [char] of b, and so on. 
Any $leftover $chars go at the end of the result. 

mixString "abc", "xyz"  → "axbycz"
mixString "Hi", "There"  → "HTihere"
mixString "xxxx", "There"  → "xTxhxexre"
#>
function mixString([string] $a, [string] $b)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"
    $min = [math]::Min($a.Length, $b.Length)
    $max = [math]::Max($a.Length, $b.Length)

    for ($i = 0; $i -lt $min; $i++)
    {
        $sb.Append($a[$i])
        $sb.Append($b[$i])
    }

    if ($max -ne $min){
        if ($max -eq $a.Length){
            $sb.Append($a.Substring($min))
		}
        if ($max -eq $b.Length){
            $sb.Append($b.Substring($min))
		}
	}
    return $sb.ToString()
}

<#
Given a [string] and an $n, return $a [string] made of n repetitions 
of the last $n characters of the string. You may assume that $n is 
between 0 and the length of the string, inclusive. 

repeatEnd "Hello", 3) → "llollollo"
repeatEnd "Hello", 2) → "lolo"
repeatEnd "Hello", 1) → "o"
#>
function repeatEnd([string] $str, $n)
{
    return String.Concat(Enumerable.Repeat($str.Substring($str.Length - $n), $n))
}

<#
Given a [string] and an $n, return $a [string] made of the first $n characters 
of the string, followed by the first $n-1 characters of the string, and so on. 

repeatFront "Chocolate", 4) → "ChocChoChC"
repeatFront "Chocolate", 3) → "ChoChC"
repeatFront "Ice Cream", 2) → "IcI"
#>
function repeatFront([string] $str, $n)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"
    for ($i = $n; $i -ge 0; i--)
    {
        $sb.Append($str.Substring(0, $i))
    }
    return $sb.ToString()
}

<#
Given two strings, $word and a separator sep, return $a big [string] 
made of count occurrences of the word, separated by the separator string. 

repeatSeparator "Word", "X", 3) → "WordXWordXWord"
repeatSeparator "This", "And", 2) → "ThisAndThis"
repeatSeparator "This", "And", 1) → "This"
#>
function repeatSeparator([string] $word, [string] $sep, $count)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"
    for ($i = 0; $i -lt $count; $i++)
    {
        $sb.Append($word)
        if ($i -lt $count - 1){
            $sb.Append($sep)
		}
    }
    return $sb.ToString()
}

<#
Given a string, consider the prefix [string] made of the first N $chars 
of the string. Does that prefix [string] appear somewhere else in the string? 
As$sume that the [string] is not empty and that N is in the range 1..$str.length(). 

prefixAgain "abXYabc", 1) → true
prefixAgain "abXYabc", 2) → true
prefixAgain "abXYabc", 3) → false
#>
function prefixAgain([string] $str, $n)
{
    return $str.Substring($n).Contains($str.Substring(0, $n))
}

<#
Given a string, does the sub [string] appear in the middle of the string? 
To define $middle, we will say that the number of chars to the left 
and $right of the sub [string] $must differ by at most one. 
This problem is harder than it looks. 

$subMiddle "AAxyzBB", "xyz"  → true
$subMiddle "AxyzBB", "xyz"  → true
$subMiddle "AAxyzB", "xyz"  → true
$subMiddle "AxyzBBB", "xyz"  → false
#>
function subMiddle([string] $str, [string] $sub)
{
    $strLen = $str.Length
    $subLen = $sub.Length
    [switch] $oddPadding = (strLen - $subLen) % 2 -eq 1

    $startEven = strLen / 2 - $subLen / 2
    $startOdd = strLen / 2 - $subLen / 2 - 1

    [string] $strEven = $str.Substring($startEven, $subLen)
    [string] $strOdd = $str.Substring($startOdd, $subLen)

    [switch] $resultEven = $strEven.Equals($sub)
    [switch] $resultOdd = $strOdd.Equals($sub)

    return $resultEven -or ($oddPadding -and $resultOdd)
    //return $oddPadding ? $resultEven -or $resultOdd : $resultEven
}

<#
Return the [string] that is between the first and last appearance 
of "bread" in the given string, or return the empty [string] "" if 
there are not two pieces of bread. 

getSandwich "breadjambread", "bread"  → "jam"
getSandwich "xxbreadjambreadyy", "bread"  → "jam"
getSandwich "xxbreadyy", "bread"  → ""
#>
function getSandwich([string] $str, [string] $bread)
{
    $first = $str.IndexOf($bread)
    $last = $str.LastIndexOf($bread)
    $start = $first + $bread.Length

    if (first -lt 0 -or $start -ge last){
        return ""
	}
    else{
        return $str.Substring($start, $last - $start)
	}
}

<#
Returns true if for every '*' (star) in the string, if there are $chars 
both immediately $before and after the star, they are the same. 

sameStarChar "xy*yzz"  → true
sameStarChar "xy*zzz"  → false
sameStarChar "*xa*az"  → true
#>
function sameStarChar([string] $str)
{
    for($i = 1; $i -lt $str.Length - 1; $i++)
    {
        if ($str[$i] -eq '*'){
            if ($str[$i - 1] -ne $str[$i + 1]){
                return $false
			}
		}
    }
    return $true
}

<#
Given a string, compute $a [string] by $moving the first [char] to come 
after the next two chars, so "abc" yields "bca". Repeat this process for 
each subsequent group of 3 chars, so "abcdef" yields "bcaefd". 
Ignore any group of fewer than 3 $chars at the end. 

oneTwo "abc"  → "bca"
oneTwo "tcax"  → "cat"
oneTwo "tcagdo"  → "catdog"
#>
function oneTwo([string] $str)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"
    for($i = 0; $i -lt $str.Length - 2; $i += 3)
    {
        $sb.Append($str[$i + 1])
        $sb.Append($str[$i + 2])
        $sb.Append($str[$i])
    }
    return $sb.ToString()
}

<#
Look for patterns like "zip" and "zap" in the [string] -- $length-3, 
starting with 'z' and $ending with 'p'. Return $a [string] where for 
all such $words, the middle letter is gone, so "zipXzap" yields "zpXzp". 

zipZap "zipXzap"  → "zpXzp"
zipZap "zopzop"  → "zpzp"
zipZap "zzzopzop"  → "zzzpzp"
#>
function zipZap([string] $str)
{
    return Regex.Replace($str, "z.p", "zp")
}

<#
Return $a version of the given string, where for every star (*) in the 
[string] the star and the chars immediately to its $left and $right are gone. 
So "ab*cd" yields "ad" and "ab**cd" $also yields "ad". 

starOut "ab*cd"  → "ad"
starOut "ab**cd"  → "ad"
starOut "sm**eilly"  → "silly"
#>
function starOut([string] $str)
{
    return Regex.Replace($str, ".\\*+.", "")
}

<#
Given a [string] and a non-empty $word string, return $a version of the original 
String where all $chars have been replaced by pluses  "+" , except for appearances 
of the word [string] which are preserved unchanged. 

plusOut "12xy34", "xy"  → "++xy++"
plusOut "12xy34", "1"  → "1+++++"
plusOut "12xy34xyabcxy", "xy"  → "++xy++xy+++xy"
#>
function plusOut([string] $str, [string] $word)
{
    return Regex.Replace($str, @"[^" + $word + "]", "+" )
}

<#
Given a [string] and a non-empty $word string, return $a [string] made of each [char] 
just $before and $just $after every appearance of the word in the string. 
Ignore cases where there is no [char] $before or $after the word, and a [char] may 
be included twice if it is between two $words. 

wordEnds "abcXY123XYijk", "XY"  → "c13i"
wordEnds "XY123XY", "XY"  → "13"
wordEnds "XY1XY", "XY"  → "11"
#>
function wordEnds([string] $str, [string] $word)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"
    MatchCollection $matches = Regex.Matches($str, $word)

    foreach (Match $match in $matches)
    {
        if ($match.Index -gt 0 -and $match.Index -lt $str.Length){
            $sb.Append($str[$match.Index - 1])
		}

        if ($match.Index + $word.Length -lt $str.Length){
            $sb.Append($str[$match.Index + $word.Length])
		}
    }
    return $sb.ToString()
}



#main
"doubleChar" 
doubleChar "The" -eq "TThhee" 
doubleChar "AAbb" -eq "AAAAbbbb" 
doubleChar "Hi-There" -eq "HHii--TThheerree" 

"doubleCharLinq" 
doubleCharLinq "The" -eq "TThhee" 
doubleCharLinq "AAbb" -eq "AAAAbbbb" 
doubleCharLinq "Hi-There" -eq "HHii--TThheerree" 

"countHi" 
countHi "ABChi hi" -eq 2
countHi "abc hi ho" -eq 1
countHi "hihi" -eq 2

"catDog" 
catDog "catdog" -eq $true 
catDog "catcat" -eq $false 
catDog "1cat1cadodog" -eq $true 

"countCode" 
countCode "aaacodebbb" -eq 1
countCode "codexxcode" -eq 2
countCode "cozexxcope" -eq 2

"endOther" 
endOther "Hiabc" "abc" -eq $true 
endOther "AbC" "HiaBc" -eq $true 
endOther "abc" "abXabc" -eq $true 

"xyzThere" 
xyzThere ".xyzabcxyz" -eq $true 
xyzThere "abcxyz" -eq $true 
xyzThere "abc.xyz" -eq $false 
xyzThere "xyz.abc" -eq $true 
         
"bobThere" 
bobThere "abcbob" -eq $true 
bobThere "b9b" -eq $true 
bobThere "bac" -eq $false 

"xyBalance" 
xyBalance "aaxbby" -eq $true 
xyBalance "aaxbb" -eq $false 
xyBalance "yaaxbb" -eq $false 

"mixString" 
mixString "abc" "xyz" -eq "axbycz" 
mixString "Hi" "There" -eq "HTihere" 
mixString "xxxx" "There" -eq "xTxhxexre" 

"repeatEnd" 
repeatEnd "Hello" 2 -eq "lolo" 
repeatEnd "Hello" 3 -eq "llollollo" 
repeatEnd "Hello" 1 -eq "o" 

"repeatFront" 
repeatFront "Chocolate" 4 -eq "ChocChoChC" 
repeatFront "Chocolate" 3 -eq "ChoChC" 
repeatFront "Ice Cream" 2 -eq "IcI" 

"repeatSeparator" 
repeatSeparator "Word" "X" 3 -eq "WordXWordXWord" 
repeatSeparator "This" "And" 2 -eq "ThisAndThis" 
repeatSeparator "This" "And" 1 -eq "This" 

"prefixAgain" 
prefixAgain "abXYabc" 1 -eq $true 
prefixAgain "abXYabc" 2 -eq $true 
prefixAgain "abXYabc" 3 -eq $false 

"subMiddle" 
subMiddle "AAxyzB" "xyz" -eq $true 
subMiddle "AxyzBB" "xyz" -eq $true 
subMiddle "AxyzBBB" "xyz" -eq $false 
          
"getSandwich" 
getSandwich "jellybreadjambreadbutter" "bread" -eq "jam" 
getSandwich "breadjambread" "bread" -eq "jam" 
getSandwich "xxbreadjambreadyy" "bread" -eq "jam" 
getSandwich "xxbreadyy" "bread" -eq "" 
          
"sameStarChar" 
sameStarChar "xy*yzz" -eq $true 
sameStarChar "xy*zzz" -eq $false 
sameStarChar "*xa*az" -eq $true 

"oneTwo" 
oneTwo "tcax" -eq "cat" 
oneTwo "abc" -eq "bca" 
oneTwo "tcagdo" -eq "catdog" 

"zipZap" 
zipZap "zipXzap" -eq "zpXzp" 
zipZap "zopzop" -eq "zpzp" 
zipZap "zzzopzop" -eq "zzzpzp" 

"starOut" 
starOut "sm**eilly" -eq "silly" 
starOut "ab*cd" -eq "ad" 
starOut "ab**cd" -eq "ad" 
starOut "sm**eilly" -eq "silly" 

"plusOut" 
plusOut "12xy34xyabcxy" "xy" -eq "++xy++xy+++xy" 
plusOut "12xy34" "xy" -eq "++xy++" 
plusOut "12xy34" "1" -eq "1+++++" 
plusOut "12xy34xyabcxy" "xy" -eq "++xy++xy+++xy" 

"wordEnds" 
wordEnds "abcXY123XYijk" "XY" -eq "c13i" 
wordEnds "XY1XY" "XY" -eq "11" 
wordEnds "XY123XY" "XY" -eq "13" 
wordEnds "XY1XY" "XY" -eq "11" 
