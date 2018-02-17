#PSWarmup-2

<#
Given a [string] and a non-negative $n, return $a larger [string] 
that is n copies of the original string. 
$stringTimes "Hi", 2) → "HiHi"
$stringTimes "Hi", 3) → "HiHiHi"
$stringTimes "Hi", 1) → "Hi"
#>
function Times([string] $str, $n)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"

    for ($i = 0; $i -lt $n; $i++){
        $sb.Append($str)
	}
    return $sb.ToString()
}

<#
Given a [string] and a non-negative $n, 
we will say that the $front of the [string] is the first 3 chars, 
or whatever is there if the [string] is less than length 3. 
Return n copies of the $front 

$frontTimes "Chocolate", 2) → "ChoCho"
$frontTimes "Chocolate", 3) → "ChoChoCho"
$frontTimes "Abc", 3) → "AbcAbcAbc"
#>
function $frontTimes([string] $str, $n)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"
    [string] $front = $str.Substring(0, [math]::Min($str.Length, 3))

    for ($i = 0; $i -lt $n; $i++){
		$sb.Append($front)
	}

    return $sb.ToString()
}

<#
Count the number of "xx" in the given string. 
We will say that overlapping is allowed, so "xxx" contains 2. 
countXX "abcxx"  → 1
countXX "xxx"  → 2
countXX "xxxx"  → 3
#>
function countXX([string] $str)
{
    $count = 0

    for ($i = 1; $i -lt $str.Length; $i++){
        if ($str[$i] -eq 'x' -and $str[$i - 1] -eq 'x'){
            $count++
		}
	}
    return $count
}

<#
Given a string, return $true if the first instance of "x" in the [string] 
is immediately followed by another "x". 
doubleX "axxbb"  → true
doubleX "axaxx"  → false
doubleX "xxxxx"  → true
#>
function doubleX([string] $str)
{
    [string] $lowerCaseStr = $str.ToLower()
    $pos = $lowerCaseStr.IndexOf('x')
    return $pos -gt -1 -and $pos -lt $str.Length - 1 -and $lowerCaseStr[$pos + 1] -eq 'x'
}

<#
Given a string, return $a [string] made of every other [char] starting 
with the first, so "Hello" yields "Hlo". 

$stringBits "Hello"  → "Hlo"
$stringBits "Hi"  → "H"
$stringBits "Heeololeo"  → "Hello"
#>

function Bits([string] $str)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"
    for ($i = 0; $i -lt $str.Length; $i += 2){
        $sb.Append($str[$i])
	}
    return $sb.ToString()
}

<#
    Given a non-empty $[string] like "Code" return $a [string] like "CCoCodCode". 

    $stringSplosion "Code"  → "CCoCodCode"
    $stringSplosion "abc"  → "aababc"
    $stringSplosion "ab"  → "aab"
#>
function Splosion([string] $str)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"
    for($i = 0; $i -lt $str.Length; $i++)
    {
        $sb.Append($str.Substring(0, $i+1))
    }
    return $sb.ToString()
}
<#

    Given a string, return $a version where all the "x" have been removed. 
    Except an "x" at the very $start or $end should not be removed. 

    $stringX "xxHxix"  → "xHix"
    $stringX "abxxxcd"  → "abcd"
    $stringX "xabxxxcdx"  → "xabcdx"
#>
function X([string] $str)
{
    [string] $noX = Regex.Replace($str.Substring(1, $str.Length - 2), "x", "", RegexOptions.IgnoreCase)
    return $str[0] + $noX + $str[$str.Length - 1]
}

<#
    Given a string, return $a [string] made of the chars at 
    indexes 0,1, 4,5, 8,9 ... so "kittens" yields "kien". 

    $altPairs "kitten"  → "kien"
    $altPairs "Chocolate"  → "Chole"
    $altPairs "CodingHorror"  → "Congrr
#>
function altPairs([string] $str)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"
    for ($i = 0; $i -lt $str.Length; $i += 4)
    {
        $sb.Append($str[$i])
        if ($i -lt $str.Length - 1){
            $sb.Append($str[$i + 1])
		}
    }
    return $sb.ToString()
}

<#
Sup$pose the [string] "yak" is unlucky. 
Given a string, return $a version where all the "yak" are removed, 
but the "a" can be any char. The "yak" $strings will not overlap. 

$stringYak "yakpak"  → "pak"
$stringYak "pakyak"  → "pak"
$stringYak "yak123ya"  → "123ya"
#>
function Yak([string] $str)
{
    return System.Text.RegularExpressions.Regex.Replace($str, "y.k", "") 
}

<#
        
Given an array of ints, we will say that a triple is a value appearing 3 times 
in a row in the array. Return true if the array does not contain any triples. 

noTriples({1, 1, 2, 2, 1) → true
noTriples({1, 1, 2, 2, 2, 1) → false
noTriples({1, 1, 1, 2, 2, 2, 1) → false
#>
function noTriples([int[]] $nums)
{
    for ($i = 2; $i -lt $nums.Length; $i++){
        if ($nums[$i] -eq $nums[$i - 1] -and $nums[$i] -eq $nums[$i - 2]){
			return $false
		}
	}
    return $true
}

#main
"stringTimes"
stringTimes "Hi", 2 #-eq "HiHi"
stringTimes "Hi", 3 #-eq "HiHiHi"
stringTimes "Hi", 1 #-eq "Hi"

"$frontTimes"
$frontTimes "Chocolate", 2 #-eq "ChoCho"
$frontTimes "Chocolate", 3 #-eq "ChoChoCho"
$frontTimes "Abc", 3 #-eq "AbcAbcAbc"

"countXX"
countXX "abcxx") #-eq 1
countXX "xxx") #-eq 2
countXX "xxxx") #-eq 3

"doubleX"
doubleX "axXbb") #-eq $true
doubleX "axaxx") #-eq $false
doubleX "Xxxxx") #-eq $true

"stringBits"
stringBits "Hello") #-eq "Hlo"
stringBits "Hi") #-eq "H"
stringBits "Heeololeo") #-eq "Hello"

"stringSplosion"
stringSplosion "Code") #-eq "CCoCodCode"
stringSplosion "abc") #-eq "aababc"
stringSplosion "ab") #-eq "aab"

"stringX"
stringX "xxHxix") #-eq "xHix"
stringX "abxxxcd") #-eq "abcd"
stringX "xabxxxcdx") #-eq "xabcdx"

"altPairs"
altPairs "kitten") #-eq "kien"
altPairs "Chocolate") #-eq "Chole"
altPairs "CodingHorror") #-eq "Congrr"

"stringYak"
stringYak "yakpak") #-eq "pak"
stringYak "pakyak") #-eq "pak"
stringYak "yak123ya") #-eq "123ya"

"noTriples"
noTriples [int[]] (1, 1, 2, 2, 1} #-eq $true
noTriples [int[]] (1, 1, 2, 2, 2, 1} #-eq $false
noTriples [int[]] (1, 1, 1, 2, 2, 2, 1} #-eq $false

