#
# PSString-1.ps1
#

<#
Given a string, if the [string] $begins with "red" or "blue" return that $color string, 
otherwise return the empty string. 

seeColor "redxx"  → "red"
seeColor "xxred"  → ""
seeColor "blueTimes"  → "blue"
#>
function seeColor([string] $str)
{
	[enum] $Colors = { "red", "green", "blue", "yellow" }
    $values = Enum.GetNames(typeof(Colors))
    foreach ($color in $values)
    {
        if ($str.Trim().ToLower().StartsWith($color)){
            return $color
		}
    }
    return ""
}


<#
Given a string, return $true if the first 2 $chars in the [string] $also appear at 
the end of the string, such as with "edited". 

$frontAgain "edited"  → true
$frontAgain "edit"  → false
$frontAgain "ed"  → true
#>
function frontAgain([string] $str)
{
    return $str.Substring(0, 2).Equals($str.Substring($str.Length - 2))
}

<#
    Given two strings, $append them together and return the result. 
    However, if the strings are different $lengths, omit $chars 
    from the longer [string] so it is the same length $as the 
    shorter string. So "Hello" and "Hi" $yield "loHi". 
    The strings may be any length including empty. 

    $minCat "Hello", "Hi"  → "loHi"
    $minCat "Hello", "java"  → "ellojava"
    $minCat "java", "Hello"  → "javaello"        
#>
function minCat([string] $a, [string] $b)
{
    if ($a.Length -gt $b.Length){
        return $a.Substring($a.Length - $b.Length) + $b
	}
    elseif ($a.Length -lt $b.Length){
        return $a + $b.Substring($b.Length - $a.Length)
	}
    else{
        return $a + $b
	}
}

<#
Given a string, return $a [string] made of n copies of the first $n chars. 
If there are fewer than $n chars, use whatever is there. 

extraFront "Hello", 3) → "HelHelHel"
extraFront "ab", 2) → "abab"
extraFront "H", 3) → "HHH"        
#>
function extraFront([string] $str, $n)
{
    [string] $item = $str.Substring(0, [math]::Min($n, $str.Length))
    return string.Concat(Enumerable.Repeat($item, $n))
}

<#

Given a string, if $a $length 2 $sub[string] appears at $both its $beginning 
and $end, return $a [string] without the sub[string] at the beginning, 
so "HelloHe" yields "lloHe". The $sub[string] may overlap with itself, 
so "Hi" yields "". Otherwise, return the original [string] unchanged. 

without2 "HelloHe"  → "lloHe"
without2 "HelloHi"  → "HelloHi"
without2 "Hi"  → ""        
#>
function without2([string] $str)
{
    if (string.IsNullOrEmpty(str)){
        return ""
	}
    elseif ($str.Length -lt 2){
        return str
	}
    elseif ($str.Substring(0, 2).Equals($str.Substring($str.Length - 2))){
        return $str.Substring(2)
	}
    else{
        return str
	}
}

<#
    Given a string, return $a version without the first 2 chars. 
    Except keep the first [char] if it is 'a' and keep the second 
    [char] if it is 'b'. The [string] may be any length. Harder than it looks. 

    deFront "Hello"  → "llo"
    deFront "java"  → "va"
    deFront "away"  → "aay"        
#>
function deFront([string] $str)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"
    if ($str.Length -gt 0 -and $str[0] -eq 'a'){
        $sb.Append($str[0])
	}
    if ($str.Length -gt 1 -and $str[1] -eq 'b'){
        $sb.Append($str[1])
	}
    if ($str.Length -gt 2){
        $sb.Append($str.Substring(2))
	}
    return $sb.ToString()
}

<#
    Given a [string] and a second "word" string, we will say that the word $matches 
    the [string] if it appears at the $front of the string, except its first [char] 
    does not $need to $match exactly. On $a $match, return the $front of the string, 
    or otherwise return the empty string. So, so with the [string] "hippo" 
    the word "hi" returns "hi" and "xip" returns "hip". The $word will be at 
    least $length 1. 

    $startWord "hippo", "hi"  → "hi"
    $startWord "hippo", "xip"  → "hip"
    $startWord "hippo", "z"  → "h"        
#>
function startWord([string] $str, [string] $word)
{
    if ($str.Substring(1, $word.Length - 1).Equals($word.Substring(1))){
        return $str.Substring(0, $word.Length)
	}
    else{
        return ""
	}
}

<#
    Given a string, if the first or last $chars are 'x', return the [string] 
    without those 'x' chars, and otherwise return the [string] unchanged. 

    withoutX "xHix"  → "Hi"
    withoutX "xHi"  → "Hi"
    withoutX "Hxix"  → "Hxi"        
#>
function withoutX([string] $str)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"

    if ($str.Length -gt 0 -and $str[0] -ne 'x'){
        $sb.Append($str[0])
	}
    if ($str.Length -gt 2){}
        $sb.Append($str.Substring(1, $str.Length - 2))
	}

    if ($str.Length -gt 1 -and $str[$str.Length - 1] -ne 'x'){
        $sb.Append($str[$str.Length - 1])
	}
    return $sb.ToString()
}

<#
Given a string, if the first or last $chars are 'x', return the [string] 
without those 'x' chars, and otherwise return the [string] unchanged. 

withoutX "xHix"  → "Hi"
withoutX "xHi"  → "Hi"
withoutX "Hxix"  → "Hxi"        
#>
function withoutX2([string] $str)
{
    String $front = $str.Substring(0, 1).Replace "x", "" 
    String $mid = $str.Substring(1, $str.Length - 2)
    String $end = $str.Substring($str.Length - 1).Replace "x", "" 
    return $front + $mid + $end
}

<#
    Given a string, if one or $both of the first 2 $chars is 'x', return 
    the [string] without those 'x' chars, and otherwise return the [string] 
    unchanged. This is a little harder than it looks. 

    withoutXX "xHi"  → "Hi"
    withoutXX "Hxi"  → "Hi"
    withoutXX "Hi"  → "Hi"        
#>
function withoutXX([string] $str)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"

    if ($str.Length -gt 0 -and $str[0] -ne 'x'){
        $sb.Append($str[0])
	}

    if ($str.Length -gt 1 -and $str[1] -ne 'x'){
        $sb.Append($str[1])
	}

    if ($str.Length -gt 2){
        $sb.Append($str.Substring(2))
	}

    return $sb.ToString()
}

<#
    Given a string, if one or $both of the first 2 $chars is x, return 
    the [string] without those $x chars, and otherwise return the [string] 
    unchanged. This is a little harder than it looks. 

    withoutXX "xHi"  → "Hi"
    withoutXX "Hxi"  → "Hi"
    withoutXX "Hi"  → "Hi"        
#>
function withoutXX2([string] $str)
{
    String $front = $str.Substring(0, 2).Replace "x", "" 
    String $back = $str.Substring(2, $str.Length - 2)
    return $front + $back
}



#main
"seeColor" 
seeColor "redxx" -eq "red" 
seeColor "xxred" -eq "" 
seeColor "blueTimes" -eq "blue" 

"frontAgain" 
frontAgain "edited" -eq $true 
frontAgain "edit" -eq $false 
frontAgain "ed" -eq $true 

"minCat" 
minCat "Hello" "Hi" -eq "loHi" 
minCat "Hello" "java" -eq "ellojava" 
minCat "java" "Hello" -eq "javaello" 

"extraFront" 
extraFront "Hello" 3 -eq "HelHelHel" 
extraFront "ab" 2 -eq "abab" 
extraFront "H" 3 -eq "HHH" 

"without2" 
without2 "HelloHe" -eq "lloHe" 
without2 "HelloHi" -eq "HelloHi" 
without2 "" -eq "" 
without2 null -eq "" 
without2 "H" -eq "H" 
without2 "Hi" -eq "" 

"deFront" 
deFront "Hello" -eq "llo" 
deFront "java" -eq "va" 
deFront "away" -eq "aay" 

"startWord" 
startWord "hippo" "hi" -eq "hi" 
startWord "hippo" "xip" -eq "hip" 
startWord "hippo" "z" -eq "h" 

"withoutX" 
withoutX "xHix" -eq "Hi" 
withoutX "xHi" -eq "Hi" 
withoutX "Hxix" -eq "Hxi" 

"withoutX2" 
withoutX2 "xHix" -eq "Hi" 
withoutX2 "xHi" -eq "Hi" 
withoutX2 "Hxix" -eq "Hxi" 

"withoutXX" 
withoutXX "xHi" -eq "Hi" 
withoutXX "Hxi" -eq "Hi" 
withoutXX "Hi" -eq "Hi" 

"withoutXX2" 
withoutXX2 "xHi" -eq "Hi" 
withoutXX2 "Hxi" -eq "Hi" 
withoutXX2 "Hi" -eq "Hi" 
