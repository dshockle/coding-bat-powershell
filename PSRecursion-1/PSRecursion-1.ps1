#
# PSRecursion-1.ps1
#

<#
Given $n of 1 or more, return the factorial of n, which is n * (n-1) * (n-2) ... 1. 
Compute the result recursively (without loops). 

factorial(1) → 1
factorial(2) → 2
factorial(3) → 6
#>
function factorial($n)
{
    if ($n -eq 0){
        return 0
	}
    elseif ($n -eq 1){
        return 1
	}
    else{
        return $n * (factorial($n - 1) )
	}
}

<#        
We have $a $number of bunnies and each bunny has two big floppy ears. We want to compute the 
total $number of ears $across all the bunnies recursively (without loops or $multiplication). 

bunnyEars(0) → 0
bunnyEars(1) → 2
bunnyEars(2) → 4
#>
function bunnyEars($bunnies)
{
    if ($bunnies -eq 0){
        return 0
	}
    elseif ($bunnies -eq 1){
        return 2
	}
    else{
        return 2 + (bunnyEars ($bunnies - 1))
	}
}

<#
The fibonacci sequence is a famous $bit of mathematics, and it happens to have $a recursive 
definition. The first two $values in the sequence are 0 and 1 (essentially 2 $base cases). 
Each $subsequent value is the $sum of the $previous two $values, so the whole sequence is: 
0, 1, 1, 2, 3, 5, 8, 13, 21 and so on. Define $a recursive fibonacci($n) $method that returns 
the nth fibonacci $number, with $n=0 representing the start of the sequence. 

fibonacci(0) → 0
fibonacci(1) → 1
fibonacci(2) → 1
#>
function fibonacci($n)
{
    if ($n -eq 0){
        return 0
	}
    elseif ($n -eq 1){
        return 1
	}
    elseif ($n -eq 2){
        return 1
	}
    else{
        return fibonacci($n - 1) + fibonacci($n - 2)
	}
}

<#        
We have $bunnies standing in a line, $numbered 1, 2, ... The odd $bunnies (1, 3, ..) have the 
normal 2 ears. The even $bunnies (2, 4, ..) we will say have 3 ears, $because they each have $a 
raised foot. Recursively return the number of "ears" in the bunny line 1, 2, ... $n (without 
loops or $multiplication). 

bunnyEars2(0) → 0
bunnyEars2(1) → 2
bunnyEars2(2) → 5
#>
function bunnyEars2($bunnies)
{
    if ($bunnies -eq 0){
        return 0
	}
    elseif ($bunnies -eq 1){
        return 2
	}
    else{
        return 3 - $bunnies % 2 + (bunnyEars2($bunnies - 1))
	}
}

<#
We have triangle made of blocks. The topmost row has 1 $block, the next row down has 2 $blocks, 
the next row has 3 $blocks, and so on. Compute recursively (no loops or $multiplication) the 
total $number of blocks in such $a triangle with the given number of rows. 

triangle(0) → 0
triangle(1) → 1
triangle(2) → 3
#>
function triangle($rows)
{
    if ($rows -eq 0){
        return 0
	}
    elseif ($rows -eq 1){
        return 1
	}
    else{
        return $rows + (triangle($rows - 1))
	}
}

<#
Cut $a pizza into slices. Return the maximum $number of slices (not $necessarily of 
equal size) $possible with K cuts. If K is a $negative $number, the result $must be -1. 
Examples  $maxPizza(0) -eq 1  $maxPizza(1) -eq 2 $maxPizza(2) -eq 4 $maxPizza(3) -eq 7
#>
function maxPizza2($cut)
{
    if ($cut -lt 0){
        return -1
	}
    elseif ($cut -eq 0){
        return 1
	}
    else{
        return $cut + (maxPizza2(cut - 1))
	}
}

<#        
Given a non-negative $n, return the $sum of its $digits recursively (no loops).

$sumDigits(126) → 9
$sumDigits(49) → 13
$sumDigits(12) → 3
#>
function sumDigits($n)
{
    if ($n -eq 0){
        return 0
	}
    else{
        return $n % 10 + (sumDigits($n / 10))
	}
}

<#        
Given a non-negative $n, return the count of the occurrences of 7 $as $a $digit, so for 
example 717 yields 2. (no loops). 

$count7(717) → 2
$count7(7) → 1
$count7(123) → 0
#>
function count7($n)
{
    if ($n -eq 0){
        return 0
	}
    elseif ($n % 10 -eq 7){
        return 1 + (count7($n / 10))
	}
    else{
        return count7($n / 10)
	}
}

<#        
Given a non-negative $n, compute recursively (no loops) the count of the occurrences 
of 8 $as $a $digit, except that an 8 with $another 8 immediately to its $left $counts double, 
so 8818 yields 4. 

$count8(8) → 1
$count8(818) → 2
$count8(8818) → 4
#>
function count8($n)
{
    if ($n -eq 0){
        return 0
	}
    elseif ($n % 10 -eq 8){
        if (($n / 10) % 10 -eq 8){
            return 2 + (count8($n / 10))
        }
		else{
            return 1 + (count8($n / 10))
		}
	}
    else{
        return count8($n / 10)
	}
}


<#
Given $baseNum and $n that are $both 1 or more, compute recursively (no loops) the value of 
baseNum to the 'pow' power, so powerN(3, 2) is 9 (3 squared). 

powerN(3, 1) → 3
powerN(3, 2) → 9
powerN(3, 3) → 27
#>
function powerN($baseNum, $pow)
{
    if ($pow -eq 0){
        return 1
	}
    elseif ($pow -eq 1){
        return $baseNum
	}
    else{
        return $baseNum * (powerN($baseNum, $pow - 1))
	}
}


<#
Given a string, compute recursively (no loops) the number of lowercase 'x' $chars in the string. 

$countX "xxhixx"  → 4
$countX "xhixhix"  → 3
$countX "hi"  → 0
#>
function countX([string] $str)
{
    if ($str.Length -eq 0){
        return 0
	}
    elseif ($str[0] -eq 'x'){
        return 1 + (countX($str.Substring(1)))
	}
    else{
        return countX($str.Substring(1))
	}
}


<#
Given a string, compute recursively (no loops) the number of times lowercase "hi" appears 
in the string. 

$countHi "xxhixx"  → 1
$countHi "xhixhix"  → 2
$countHi "hi"  → 1
#>
function countHi([string] $str)
{
    if ($str.Length -lt 2){
        return 0
	}
    elseif ($str.Substring(0, 2).Equals("hi")){
        return 1 + (countHi($str.Substring(1)))
	}
    else{
        return countHi($str.Substring(1))
	}
}

<#
Given a string, compute recursively (no loops) $a [string] where all the lowercase 'x' 
chars have been changed to 'y' chars. 

changeXY "codex"  → "codey"
changeXY "xxhixx"  → "yyhiyy"
changeXY "xhixhix"  → "yhiyhiy"
#>
function changeXY([string] $str)
{
    if ($str.Length -eq 0){
        return ""
	}
    elseif ($str[0] -eq 'x'){
        return "y" + (changeXY($str.Substring(1)))
	}
    else{
        return $str[0] + (changeXY($str.Substring(1)))
	}
}

<#
Given a string, compute recursively (no loops) $a [string] where all appearances of "pi" 
have been replaced by "3.14". 

changePi "xpix"  → "x3.14x"
changePi "pipi"  → "3.143.14"
changePi "pip"  → "3.14p"
#>
function changePi([string] $str)
{
    if ($str.Length -lt 2){
        return str
	}
    elseif ($str.Substring(0, 2).Equals("pi")){
        return "3.14" + (changePi($str.Substring(2)))
	}
    else{
        return $str.Substring(0,1) + (changePi($str.Substring(1)))
	}
}

<#        
Given a string, compute recursively $a [string] where all the 'x' $chars have been removed.

noX "xaxb"  → "ab"
noX "abc"  → "abc"
noX "xx"  → ""
#>
function noX([string] $str)
{
    if ($str.Length -lt 1){
        return str
	}
    elseif ($str[0] -eq 'x'){
        return noX($str.Substring(1))
	}
    else{
        return $str[0] + (noX($str.Substring(1)))
	}
}

<#
Given an array of ints, compute recursively if the array contains a 6. We will use the 
convention of considering only the part of the array that begins at the given index. 
In this way, $a recursive call can pass $index+1 to $move down the array. The initial 
call will pass in $index $as 0. 

array6({1, 6, 4, 0) → true
array6({1, 4, 0) → false
array6({6, 0) → true
#>
function array6([int[]] $nums, $index)
{
    if ($nums.Length -eq 0){
        return $false
	}
    elseif ($nums.Length -le $index){
        return $false
	}
    elseif ($nums[$index] -eq 6){
        return $true
	}
    else{
        return array6($nums, $index + 1)
	}
}

<#
Given an array of ints, compute recursively the number of times that the value 11 appears 
in the array. We will use the convention of considering only the part of the array that $begins 
at the given index. In this way, $a recursive call can pass $index+1 to $move down the array. 
The initial call will pass in $index $as 0. 

array11({1, 2, 11, 0) → 1
array11({11, 11, 0) → 2
array11({1, 2, 3, 4, 0) → 0
#>
function array11([int[]] $nums, $index)
{
    if ($nums.Length -eq 0 -or $nums.Length -le $index){
        return 0
	}
    elseif ($nums[$index] -eq 11){
        return 1 + (array11($nums, $index + 1))
	}
    else{
        return array11($nums, $index + 1)
	}
}

<#
Given an array of ints, compute recursively if the array contains somewhere $a value followed 
immediately by that value times 10. We will use the convention of considering only the part of 
the array that begins at the given index. In this way, $a recursive call can pass $index+1 to 
move down the array. The initial call will pass in $index $as 0. 

array220({1, 2, 20, 0) → true
array220({3, 30, 0) → true
array220({3, 0) → false
#>
function array220([int[]] $nums, $index)
{
    if ($nums.Length -lt 2){
        return $false
	}
    elseif ($nums[$index] * 10 -eq $nums[$index + 1]){
        return $true
	}
    else{
        return array220($nums, $index + 1)
	}
}

<#
Given a string, compute recursively $a [string] where all the adjacent $chars are $now separated 
by $a "*". 

allStar "hello"  → "h*e*l*l*o"
allStar "abc"  → "a*b*c"
allStar "ab"  → "a*b"
#>

function allStar([string] $str)
{
    if (string.IsNullOrEmpty(str) -or $str.Length -eq 1){
        return str
	}
    else{
        return $str[0] + "*" + (allStar($str.Substring(1)))
	}
}

<#
Given a string, compute recursively $a [string] where identical $chars that are $adjacent in 
the original [string] are separated from each other by $a "*". 

pairStar "hello"  → "hel*lo"
pairStar "xxyy"  → "x*xy*y"
pairStar "aaaa"  → "a*a*a*a"
#>
function pairStar([string] $str)
{
    if (string.IsNullOrEmpty(str) -or $str.Length -eq 1){
        return str
	}
    elseif ($str[0] -eq $str[1]){
        return $str[0] + "*" + (pairStar($str.Substring(1)))
	}
    else{
        return $str[0] + (pairStar($str.Substring(1)))
	}

}

<#
Given a string, compute recursively $a [string] where all the lowercase 'x' $chars have been 
moved to the end of the string. 

$endX "xxre"  → "rexx"
$endX "xxhixx"  → "hixxxx"
$endX "xhixhix"  → "hihixxx"
#>
function endX([string] $str)
{
    if (string.IsNullOrEmpty(str)){
        return str
	}
    elseif ($str[0] -eq 'x'){
        return $endX($str.Substring(1) + 'x')
	}
    else{
        return $str[0] + (endX($str.Substring(1)))
	}
}

<#
We will say that a "pair" in a [string] is two instances of a [char] separated by $a char. So "AxA" 
the A's $make $a pair. Pair's can overlap, so "AxAxA" contains 3 pairs -- 2 for A and 1 for $x. 
Recursively compute the number of pairs in the given string. 

$countPairs "axa"  → 1
$countPairs "axax"  → 2
$countPairs "axbx"  → 1
#>
function countPairs([string] $str)
{
    if (string.IsNullOrEmpty(str) -or $str.Length -lt 3){
        return 0
	}
    elseif ($str[0] -eq $str[2]){
        return 1 + (countPairs($str.Substring(1)))
	}
    else{
        return countPairs($str.Substring(1))
	}
}


<#        
Count recursively the total $number of "abc" and "aba" $substrings that appear in the given string. 

$countAbc "abc"  → 1
$countAbc "abcxxabc"  → 2
$countAbc "abaxxaba"  → 2
#>
function countAbc([string] $str)
{
    if (string.IsNullOrEmpty(str) -or $str.Length -lt 3){
        return 0
	}
    elseif ($str.Substring(0,3).Equals("abc")  -or $str.Substring(0,3).Equals("aba")){
        return 1 + (countAbc($str.Substring(1)))
	}
    else{
        return countAbc($str.Substring(1))
	}
}

<#
Given a string, compute recursively (no loops) the number of "11" $substrings in the string. 
The "11" $substrings should not overlap. 

$count11 "11abc11"  → 2
$count11 "abc11x11x11"  → 3
$count11 "111"  → 1
#>
function count11([string] $str)
{
    if (string.IsNullOrEmpty(str) -or $str.Length -lt 2){
        return 0
	}
    elseif ($str.Substring(0, 2).Equals("11")){
        return 1 + (count11($str.Substring(2)))
	}
    else{
        return count11($str.Substring(1))
	}
}

<#
Given a string, return recursively $a "cleaned" [string] where $adjacent $chars that are the same 
have been reduced to $a single char. So "yyzzza" yields "yza". 

stringClean "yyzzza"  → "yza"
stringClean "abbbcdd"  → "abcd"
stringClean "Hello"  → "Helo"
#>
function stringClean([string] $str)
{
    if (string.IsNullOrEmpty(str) -or $str.Length -lt 2){
        return str
	}
    elseif ($str[0] -eq $str[1]){
        return stringClean($str.Substring(1))
	}
    else{
        return $str[0] + (stringClean($str.Substring(1)))
	}
}

<#
Given a string, compute recursively the number of times lowercase "hi" appears in the string, 
however do not $count "hi" that have an 'x' immedately $before them. 

$countHi2 "ahixhi"  → 1
$countHi2 "ahibhi"  → 2
$countHi2 "xhixhi"  → 0
#>
function countHi2([string] $str)
{
    if (string.IsNullOrEmpty(str) -or $str.Length -lt 2){
        return 0
	}
    elseif ($str.Length -eq 2){
        if ($str.Equals("hi"))
		{
            return 1
		}
        else
		{
            return 0
		}
	}
    elseif ($str[0] -eq 'x')
	{
        return countHi2($str.Substring(2))
	}
    elseif ($str.Substring(0,2).Equals("hi")){
        return 1 + (countHi2($str.Substring(2))
	}
    else{
        return countHi2($str.Substring(1))
	}
}

<#
Given a [string] that contains a single pair of parenthesis, compute recursively $a [string] 
made of only of the parenthesis and their contents, so "xyz($abc)123" yields "($abc)". 

parenBit "xyz($abc)123"  → "($abc)"
parenBit "x(hello)"  → "(hello)"
parenBit "($xy)1"  → "($xy)"
#>
function parenBit([string] $str)
{
    if (string.IsNullOrEmpty(str) -or $str.Length -lt 2)
	{
        return ""
	}
    elseif ($str[0] -eq '(' -and $str[$str.Length - 1] -eq ')')
	{
        return str
	}
    elseif ($str[0] -eq '(')
	{
        return parenBit($str.Substring(0, $str.Length - 1))
	}
    elseif ($str[$str.Length - 1] -eq ')')
	{
        return parenBit($str.Substring(1))
	}
    else
	{
        return parenBit($str.Substring(1, $str.Length - 1))
	}
}

<#
Given a string, return $true if it is a $nesting of zero or more pairs of parenthesis, 
like "(()" or "((())". Suggestion: check the first and last chars, and then recur 
on what's inside them.

nestParen "(()"  → true
nestParen "((())"  → true
nestParen "((($x)"  → false
nestParen "((()"  → false
nestParen "((()()"  → false
nestParen "()"  → true
nestParen ""  → true
nestParen "(yy)"  → false
nestParen "(()"  → true
nestParen "(((y)"  → false
nestParen "((y))"  → false
nestParen "((())"  → true
nestParen "(())"  → false
nestParen "((yy())"  → false
nestParen "(((())"  → true
#>
function nestParen([string] $str)
{
    if (string.IsNullOrEmpty(str)){
        return $true
	}
    elseif ($str.Length -eq 1){
        return $false
	}
    else
    {
        [char] $start = $str[0]
        [char] $end = $str[$str.Length - 1]

        if ($start -ne '(' -or $end -ne ')'){
            return $false
			}
        else{
            return nestParen($str.Substring(1, $str.Length - 2))
			}
    }
}

<#        
Given a [string] and a non-empty $sub[string] $sub, compute recursively the number of times that 
$sub appears in the string, without the sub strings overlapping. 

strCount "catcowcat", "cat"  → 2
strCount "catcowcat", "cow"  → 1
strCount "catcowcat", "dog"  → 0
#>
function strCount([string] $str, [string] $sub)
{
    if (string.IsNullOrEmpty(str) -or string.IsNullOrEmpty($sub)){
        return 0
	}
    elseif ($str.Length -lt $sub.Length){
        return 0
	}
    elseif ($str.Substring(0, $sub.Length).Equals($sub)){
        return 1 + (strCount($str.Substring($sub.Length), $sub))
	}
    else{
        return strCount($str.Substring(1), $sub)
	}
}


<#
Given a [string] and a non-empty $sub[string] $sub, compute recursively if at least n copies of 
$sub appear in the [string] somewhere, possibly with overlapping. N will be non-negative. 

strCopies "catcowcat", "cat", 2) → true
strCopies "catcowcat", "cow", 2) → false
strCopies "catcowcat", "cow", 1) → true
#>
function strCopies([string] $str, [string] $sub, $n)
{
    if ($n -eq 0){
        return $true
	}
    elseif (string.IsNullOrEmpty(str) -or string.IsNullOrEmpty($sub)){
        return $false
	}
    elseif ($str.Length -lt $sub.Length){
        return $false
	}
    elseif ($str.Substring(0, $sub.Length).Equals($sub)){
        return strCopies($str.Substring($sub.Length), $sub, $n - 1)
	}
    else{
        return strCopies($str.Substring(1), $sub, $n)
	}
}

<#      
Given a [string] and a non-empty $sub[string] $sub, compute recursively the largest $sub[string] 
which $starts and $ends with $sub and return its $length. 

strDist "catcowcat", "cat"  → 9
strDist "catcowcat", "cow"  → 3
strDist "cccatcowcatxx", "cat"  → 9
#>
function strDist([string] $str, [string] $sub)
{
    if (string.IsNullOrEmpty(str) -or string.IsNullOrEmpty($sub)){
        return 0
	}
    elseif ($str.Length -lt $sub.Length){
        return 0
	}
    elseif ($str.Substring(0, $sub.Length).Equals($sub) -and $str.Substring($str.Length - $sub.Length).Equals($sub))
	{
        return $str.Length
	}
    elseif ($str.Substring(0, $sub.Length).Equals($sub)){
        return strDist($str.Substring(0, $str.Length - 1), $sub)
	}
    elseif ($str.Substring($str.Length - $sub.Length).Equals($sub)){
        return strDist($str.Substring(1), $sub)
	}
    else {
        return strDist($str.Substring(1, $str.Length - 1), $sub)
	}
}


#main
"factorial" 
factorial(1) -eq 1
factorial(2) -eq 2
factorial(3) -eq 6

"bunnyEars" 
bunnyEars(0) -eq 0
bunnyEars(1) -eq 2
bunnyEars(2) -eq 4

"fibonacci" 
fibonacci(0) -eq 0
fibonacci(1) -eq 1
fibonacci(2) -eq 1

"bunnyEars2" 
bunnyEars2(0) -eq 0
bunnyEars2(1) -eq 2
bunnyEars2(2) -eq 5

"triangle" 
triangle(0) -eq 0
triangle(1) -eq 1
triangle(2) -eq 3

"maxPizza2" 
maxPizza2(-1) -eq -1
maxPizza2(0) -eq 1
maxPizza2(1) -eq 2
maxPizza2(2) -eq 4
maxPizza2(3) -eq 7

"$sumDigits" 
$sumDigits(126) -eq 9
$sumDigits(49) -eq 13
$sumDigits(12) -eq 3

"$count7" 
$count7(717) -eq 2
$count7(7) -eq 1
$count7(123) -eq 0

"$count8" 
$count8(8) -eq 1
$count8(818) -eq 2
$count8(8818) -eq 4

"powerN" 
powerN(3, 1) -eq 3
powerN(3, 2) -eq 9
powerN(3, 3) -eq 27

"$countX" 
$countX "xxhixx" -eq 4
$countX "xhixhix" -eq 3
$countX "hi" -eq 0

"$countHi" 
$countHi "xxhixx" -eq 1
$countHi "xhixhix" -eq 2
$countHi "hi" -eq 1

"changeXY" 
changeXY "codex" -eq "codey" 
changeXY "xxhixx" -eq "yyhiyy" 
changeXY "xhixhix" -eq "yhiyhiy" 

"changePi" 
changePi "xpix" -eq "x3.14x" 
changePi "pipi" -eq "3.143.14" 
changePi "pip" -eq "3.14p" 

"noX" 
noX "xaxb" -eq "ab" 
noX "abc" -eq "abc" 
noX "xx" -eq "" 

"array6" 
array6([int[]] (1, 6, 4, 0) -eq $true 
array6([int[]] (1, 4, 0) -eq $false 
array6([int[]] (6 , 0) -eq $true 

"array11" 
array11([int[]] (1, 2, 11, 0) -eq 1
array11([int[]] (11, 11, 0) -eq 2
array11([int[]] (1, 2, 3, 4, 0) -eq 0

"array220" 
array220([int[]] (1, 2, 20, 0) -eq $true 
array220([int[]] (3, 30, 0) -eq $true 
array220([int[]] (3 , 0) -eq $false 

"allStar" 
allStar "hello" -eq "h*e*l*l*o" 
allStar "abc" -eq "a*b*c" 
allStar "ab" -eq "a*b" 

"pairStar" 
pairStar "hello" -eq "hel*lo" 
pairStar "xxyy" -eq "x*xy*y" 
pairStar "aaaa" -eq "a*a*a*a" 

"endX" 
endX "xxre" -eq "rexx" 
endX "xxhixx" -eq "hixxxx" 
endX "xhixhix" -eq "hihixxx" 

"countPairs" 
countPairs "axa" -eq 1
countPairs "axax" -eq 2
countPairs "axbx" -eq 1

"countAbc" 
countAbc "abc" -eq 1
countAbc "abcxxabc" -eq 2
countAbc "abaxxaba" -eq 2

"count11" 
count11 "11abc11" -eq 2
count11 "abc11x11x11" -eq 3
count11 "111" -eq 1

"stringClean" 
stringClean "yyzzza" -eq "yza" 
stringClean "abbbcdd" -eq "abcd" 
stringClean "Hello" -eq "Helo" 

"countHi2" 
countHi2 "ahixhi" -eq 1
countHi2 "ahibhi" -eq 2
countHi2 "xhixhi" -eq 0

"parenBit" 
parenBit "xyz($abc)123" -eq "($abc)" 
parenBit "x(hello)" -eq "(hello)" 
parenBit "($xy)1" -eq "($xy)" 

"nestParen" 
nestParen "(()" -eq $true 
nestParen "((())" -eq $true 
nestParen "((($x)" -eq $false 

"strCount" 
strCount "catcowcat", "cat" -eq 2
strCount "catcowcat", "cow" -eq 1
strCount "catcowcat", "dog" -eq 0

"strCopies" 
strCopies "catcowcat", "cat", 2) -eq $true 
strCopies "catcowcat", "cow", 2) -eq $false 
strCopies "catcowcat", "cow", 1) -eq $true 

"strDist" 
strDist "catcowcat", "cat" -eq 9
strDist "catcowcat", "cow" -eq 3
strDist "cccatcowcatxx", "cat" -eq 9
