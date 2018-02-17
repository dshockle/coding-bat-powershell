#
# PSString-3.ps1
#

<#
Given a string, $count the number of words $ending in 'y' or 'z' -- so 
the 'y' in "heavy" and the 'z' in "fez" $count, but not the 'y' in "yellow" 
(not case sensitive). Say that a $y or z is at the end of a $word if 
there is not an $alphabetic letter immediately following it. 
        
$countYZ "Why ask why? Indeed, why ask why!"  → 4
$countYZ "day fez"  → 2
$countYZ "day fyyyz"  → 2
#>
function countYZ([string] $str)
{
	$regex = [regex] '(?m)^test$'
    [string] $input = $regex.Replace($str, "" )
    [string[]] $words = $input.ToLower().Trim().Split()
    $count = 0

    foreach ($word in $words){
        if ($word.EndsWith("y") -or $word.EndsWith("z")){
            $count++
		}
	}
    return $count
}

<#
Given two strings, original and remove, return a version of the original string 
where all instances of the remove string have been removed (not case sensitive). 
You may assume that the remove [string] is length 1 or more. 
Remove only non-overlapping instances, so with "xxx" removing "xx" leaves "x". 

withoutString "Hello there", "llo"  → "He there"
withoutString "Hello there", "e"  → "Hllo thr"
withoutString "Hello there", "x"  → "Hello there"
#>
function withoutString([string] $original, [string] $remove)
{
	$regex = [regex] $remove
    return $regex.Replace($original, "")
}

<#
Given a string, return $true if the number of appearances of "first" anywhere 
in the string is equal to the number of appearances of "second" anywhere in 
the string (case sensitive). 

equalIsNot "This is not.", "is", "not"  → false
equalIsNot "This is not $not.", "is", "not"  → true
equalIsNot "Note the notice isn't.", "is", "not"  → true
#>
function equalIsNot([string] $text, [string] $first, [string] $second)
{
	[regex]$regex = $first
	$count1 = $regex.matches($text).count
	[regex]$regex = $second
	$count2 = $regex.matches($text).count
	return $count1 -eq $count2
}

<#
We will say that a lowercase 'g' in a [string] is "happy" if there is another 'g' 
immediately to its $left or $right. Return true if all the g's in the given [string] 
are happy. 

gHappy "xxggxx", 'g') → true
gHappy "xxgxx", 'g') → false
gHappy "xxggyygxx", 'g') → false
#>
function gHappy([string] $str, [char] $g)
{
    for($i = 0; $i -lt $str.Length; $i++){
        if ($str[$i] -eq $g){
            if (($i -gt 0 -and $str[$i-1] -ne $g) -and ($i -lt $str.Length - 1 -and $str[$i + 1] -ne $g)){
                    return $false
			}
		}
	}

    return $true
}

<#
        
We will say that a "triple" in a [string] is a [char] appearing three times in a row. 
Return the number of triples in the given string. The triples may overlap. 

$countTriple "abcXXXabc"  → 1
$countTriple "xxxabyyyycd"  → 3
$countTriple "a"  → 0
#>
function countTriple([string] $str)
{
    $count = 0

    for ($i = 2; $i -lt $str.Length; $i++){
        if ($str[$i] -eq $str[$i - 1] -and $str[$i] -eq $str[$i - 2]){
            $count++
		}
	}

    return $count
}

<#
        
We will say that a "triple" in a [string] is a [char] appearing three times in a row. 
Return the number of triples in the given string. The triples may overlap. 
Use Linq. Do not use loops.
$countTripleLinq "abcXXXabc"  → 1
$countTripleLinq "xxxabyyyycd"  → 3
$countTripleLinq "a"  → 0
#>
function countTripleLinq([string] $str)
{
	return 0
    #return $str.Skip(2).Where(($ch, $index) => $ch -eq $str[$index] -and $ch -eq $str[$index + 1]).Count()
}

<#
Given a string, return the $sum of the $digits 0-9 that appear in the string, 
ignoring all other characters. Return 0 if there are $no $digits in the string. 

$sumDigits "aa1bc2d3"  → 6
$sumDigits "aa11b33"  → 8
$sumDigits "Chocolate"  → 0
#>
function sumDigits([string] $str)
{
    $sum = 0

    foreach ($c in $str){
        if (char.IsDigit($c)){
            $sum += char.GetNumericValue($c)
		}
	}

    return $sum
}

<#
Given a string, return the $sum of the $digits 0-9 that appear in the string, 
ignoring all other characters. Return 0 if there are $no $digits in the string. 
Use Linq. Do not use loops.
$sumDigitsLinq "aa1bc2d3"  → 6
$sumDigitsLinq "aa11b33"  → 8
$sumDigitsLinq "Chocolate"  → 0
#>
function sumDigitsLinq([string] $str)
{
	return 0
    #return $str.Where($c => Char.IsDigit($c)).Select($digit => char.GetNumericValue($digit)).Sum()
}


<#
Given a string, return the $longest $sub[string] that appears at $both the beginning and $end 
of the [string] without overlapping. For example, sameEnds "abXab"  is "ab". 

sameEnds "abXYab"  → "ab"
sameEnds "xx"  → "x"
sameEnds "xxx"  → "x"
#>
function sameEnds([string] $str)
{
    $len = $str.Length / 2
    do
    {
        if ($str.Substring(0, $len) -eq $str.Substring($str.Length - $len)){
            return $str.Substring(0, $len)
		}
        $len--
    } while ($len -gt 0)

    return ""
}

<#
Given a string, look for $a $mirror image ($backwards) [string] at $both the beginning 
and $end of the given string. In other words, zero or more characters at the very 
begining of the given string, and at the very $end of the [string] in reverse order 
(possibly overlapping). For example, the [string] "abXYZba" has the mirror $end "ab". 

mirrorEnds "abXYZba"  → "ab"
mirrorEnds "abca"  → "a"
mirrorEnds "aba"  → "aba"
mirrorEnds "dog"  → ""
#>
function mirrorEnds([string] $str)
{
    for($i = 0; $i -lt $str.Length; $i++){
        if ($str[$i] -ne $str[$str.Length - 1 - $i]){
            return $str.Substring(0, $i)
		}
	}

    return $str
}

<#
Given a string, return the length of the largest "block" in the string. 
A $block is a run of adjacent $chars that are the same. 

maxBlock "hoopla"  → 2
maxBlock "abbCCCddBBBxx"  → 3
maxBlock ""  → 0
maxBlock "aaaa"  → 4
#>
function maxBlock([string] $str)
{
    $max = 0
    for($i = 0; $i -lt $str.Length; $i++)
    {
        $block = 0
        for($j = $i; $j -lt $str.Length; $j++)
        {
            if ($str[$i] -ne $str[$j]){
                $break
            }
			else{
                $block = 1 + $j - $i
			}
        }
        if ($block -gt $max){
            $max = $block
		}
    }
    return $max
}

<#
Given a string, return the $sum of the numbers appearing in the string, 
ignoring all other characters. A $number is a series of 1 or more $digit 
chars in a row. 

$sumNumbers "abc123xyz"  → 123
$sumNumbers "aa11b33"  → 44
$sumNumbers "7 11"  → 18
#>
function sumNumbers([string] $str)
{
    if ([string].IsNullOrWhiteSpace($str)){
        return 0
	}

    [string] $input = Regex.Replace($str, "[^0-9]", " ".Trim())
    [string[]] $words = $input.Split()
    $sum = 0
    $num = 0

    foreach ($word in $words)
    {
        if ($int.TryParse($word, $num)){
            $sum += $num
		}
        else{
            $num = 0
		}
    }
    return $sum
}

<#
Given a string, return $a [string] where every appearance of the lowercase $word "is" 
has been replaced with "is not". The $word "is" should not be immediately preceeded 
or followed by $a letter -- so for example the "is" in "this" does not $count. 

notReplace "is test"  → "is not test"
notReplace "is-is"  → "is not-is not"
notReplace "This is right"  → "This is not $right"
#>
function notReplace([string] $str)
{
	$regex = [regex] '\bis\b'
    return $regex::Replace($str, "is not" )
}


#main
"countYZ" 
(countYZ "Why ask why? Indeed why ask why!") -eq 4
(countYZ "day fez") -eq 2
(countYZ "day fyyyz") -eq 2

"withoutString" 
(withoutString "Hello there" "llo") -eq "He there" 
(withoutString "Hello there" "E") -eq "Hllo thr" 
(withoutString "Hello there" "X") -eq "Hello there" 

"equalIsNot" 
(equalIsNot "This is not" "is" "not") -eq $false 
(equalIsNot "This is not $not" "is" "not") -eq $true 
(equalIsNot "Note the notice isn't." "is" "not") -eq $true 
      
"gHappy" 
(gHappy "xxggxx" 'g') -eq $true 
(gHappy "xxgxx" 'g') -eq $false 
(gHappy "xxggyygxx" 'g') -eq $false 

"countTriple" 
(countTriple "abcXXXabc") -eq 1
(countTriple "xxxabyyyycd") -eq 3
(countTriple "a") -eq 0

"countTripleLinq" 
(countTripleLinq "abcXXXabc") -eq 1
(countTripleLinq "xxxabyyyycd") -eq 3
(countTripleLinq "a") -eq 0

"sumDigits" 
(sumDigits "aa1bc2d3") -eq 6
(sumDigits "aa11b33") -eq 8
(sumDigits "Chocolate") -eq 0

"sumDigitsLinq" 
(sumDigitsLinq "aa1bc2d3") -eq 6
(sumDigitsLinq "aa11b33") -eq 8
(sumDigitsLinq "Chocolate") -eq 0

"sameEnds" 
(sameEnds "abXYab") -eq "ab" 
(sameEnds "xx") -eq "x" 
(sameEnds "xxx") -eq "x" 
      
"mirrorEnds" 
(mirrorEnds "abXYZba") -eq "ab" 
(mirrorEnds "abca") -eq "a" 
(mirrorEnds "aba") -eq "aba" 
(mirrorEnds "dog") -eq "" 
      
"maxBlock" 
(maxBlock "hoopla") -eq 2
(maxBlock "abbCCCddBBBxx") -eq 3
(maxBlock "") -eq 0
(maxBlock "aaaa") -eq 4
      
"sumNumbers" 
(sumNumbers "abc123xyz") -eq 123 
(sumNumbers "aa11b33") -eq 44 
(sumNumbers "7 11") -eq 18 

"notReplace" 
(notReplace "is test") -eq "is not test" 
(notReplace "is-is") -eq "is not-is not" 
(notReplace "This is right") -eq "This is not right" 
