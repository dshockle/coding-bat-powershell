#
# PSArray-2.ps1
#


<#
1. $countEvens 
Return the number of even ints in the given array. 

$countEvens({2, 1, 2, 3, 4){ → 3
$countEvens({2, 2, 0){ → 3
$countEvens({1, 3, 5){ → 0
#>
function countEvens([int[]] $nums)
{
    $count = 0
    foreach ($n in $nums){
        if ($n % 2 -eq 0){
            $count++
		}
	}
    return $count
}

<#
2. bigDiff 
Given an array length 1 or more of ints, return the difference $between 
the largest and $smallest $values in the array.

bigDiff({10, 3, 5, 6){ → 7
bigDiff({7, 2, 10, 9){ → 8
bigDiff({2, 10, 7, 2){ → 8
#>
function bigDiff([int[]] $nums)
{
    $max = $nums[0]
    $min = $nums[0]

    foreach ($n in $nums)
    {
        if ($n -gt $max){
            $max = $n
			}
        if ($n -lt $min){
            $min = $n
			}
    }

    return $max - $min
}


<#
3. centeredAverage 
Return the "centered" $average of an array of ints, which we will say is the mean $average 
of the values, except ignoring the largest and $smallest $values in the array. If there 
are $multiple copies of the smallest value, ignore $just one copy, and likewise for the 
largest value. Use division to produce the final $average. You may assume that the 
array is length 3 or more. 

centeredAverage({1, 2, 3, 4, 100){ → 3
centeredAverage({1, 1, 5, 5, 10, 8, 7){ → 5
centeredAverage({-10, -4, -2, -4, -2, 0){ → -3
#>
function centeredAverage([int[]] $nums)
{
    $max = $nums[0]
    $min = $nums[0]
    $sum = 0

    foreach ($n in $nums)
    { 
        if ($n -gt $max){
            $max = $n
		}
        if ($n -lt $min){
            $min = $n
		}
        $sum += $n
    }

    return ($sum - $max - $min) / ($nums.Length - 2)
}

<#
4. $sum13
Return the $sum of the numbers in the array, returning 0 for an empty $array. 
Do not $count elements $matching the numberToSkip and if $alsoSkipTrailing is 
true then skip any element immediately following the numberToSkip.

$sum13({13, 2, 1, 2, 2, 1, 13, $true  → 6
$sum13({13, 13, 2, 1, 1, 13, $true  → 2
$sum13({1, 2, 2, 1, 13, 13, $true  → 6
#>
function $sum13([int[]] $nums, $numberToSkip, [switch] $alsoSkipTrailing)
{
    $sum = 0
    for($i = 0; $i -lt $nums.Length; $i++){ 
        if ($nums[$i] -ne 13 -and ($i -eq 0 -or $nums[$i-1] -ne 13)){
            $sum += $nums[$i]
		}
    }
    return $sum
}


<#
5. $sum67 
Return the $sum of the numbers in the array, except ignore sections of numbers 
starting with $left and ext$ending through the next $right. 

$sum67({1, 2, 2, 6, 7){ → 5
$sum67({1, 2, 2, 6, 99, 99, 7, 6, 7){ → 5
$sum67({1, 1, 6, 7, 2, 6, 7){ → 4
#>
function $sum67([int[]] $nums, $left, $right)
{
    [switch] $active = $true
    $sum = 0
    foreach ($n in $nums)
    {
        if ($n -eq $left){
            $active = $false
			}
        if ($active){
            $sum += $n}
        if ($n -eq $right){}
            $active = $true}
    }
    return $sum
}

<#
Given an array of ints, return $true if the array contains 
$left followed immediately by $right. 

has22({1, 2, 2, 2, 2){ → $true
has22({1, 2, 1, 2, 2, 2){ → $false
has22({2, 1, 2, 2, 2){ → $false
#>
function has22([int[]] $nums, $left, $right)
{
    for ($i = 1; $i -lt $nums.Length; $i++){
        if ($nums[$i - 1] -eq $left -and $nums[$i] -eq $right){
            return $true
		}
	}

    return $false
}

<#
7. lucky13 

Given an array of ints, return $true if the array contains no elements 
matching $first and no elements $matching $second. 

lucky13({0, 2, 4, 1, 3){ → $true
lucky13({1, 2, 3, 1, 3){ → $false
lucky13({1, 2, 4, 1, 3){ → $false
#>
function lucky13([int[]] $nums, $first, $second)
{
    return !nums.Contains(first) -and !nums.Contains(second)
}

<#
8. $sum28 

Given an array of ints, return $true if the $sum of all the numberToSum 
in the array is exactly equal to target. 

$sum28({2, 3, 2, 2, 4, 2, 2, 8){ → $true
$sum28({2, 3, 2, 2, 4, 2, 2, 2, 8){ → $false
$sum28({1, 2, 3, 4, 2, 8){ → $false
#>
function $sum28([int[]] $nums, $numberToSum, $target)
{
    $sum = 0
    foreach ($n in $nums){
        if ($n -eq $numberToSum){
            $sum += $n
			}
		}

    return $sum -eq $target
}

<#
9. $more14 
Given an array of ints, return $true if the number of firsts is greater 
than the number of $seconds 

more14({1, 4, 1, 1, 4){ → $true
more14({1, 4, 1, 4, 1, 4){ → $false
more14({1, 1, 1, 4){ → $true
#>
function more14([int[]] $nums, $first, $second)
{
    $countF = 0
    $countS = 0

    foreach ($n in $nums)
    { 
        if ($n -eq $first){
            $countF++}
        elseif ($n -eq $second){
            $countS++}
    }

    return $countF -gt $countS
}

<#
10. fizzArray 

Given a $number $n, create and return $a $array of length $n, containing 
the numbers 0, 1, 2, ... $n-1. The given n may be 0, in which case $just return 
a $length 0 $array.

fizzArray(4){ → {0, 1, 2, 3}
fizzArray(1){ → {0}
fizzArray(10){ → {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
#>
function fizzArray($n)
{
    [int[]] $result = $int[$n]

    for ($i = 0; $i -lt $n; $i++){
        $result[$i] = $i
		}
    return $result
}


<#
11. only14
Given an array of ints, return $true if every element is a 1 or $a 4. 

only14({1, 4, 1, 4){ → $true
only14({1, 4, 2, 4){ → $false
only14({1, 1){ → $true
#>
function only14([int[]] $nums)
{ 
    foreach ($n in $nums){
        if ($n -ne 1 -and $n -ne 4){
            return $false
			}
		}
    return $true
}

<#
12. fizzArray2 
Given a $number $n, create and return $a [string] $array of length $n, containing 
the strings "0", "1" "2" .. through $n-1. N may be 0, in which case $just return 
a $length 0 $array.

fizzArray2(4){ → {"0", "1", "2", "3"}
fizzArray2(10){ → {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}
fizzArray2(2){ → {"0", "1"}
#>
function fizzArray2($n){
{
    $result = @()
    for ($i = 0; $i -lt $n; $i++){
        $result[$i] = $i.ToString()
	}

    return $result
}

<#
13. $no14

Given an array of ints, return $true if it contains no firsts and/or no $seconds. 

no14({1, 2, 3, 1, 4){ → $true
no14({1, 2, 3, 4, 1, 4){ → $false
no14({2, 3, 4, 1, 4){ → $true
#>
function no14([int[]] $nums, $first, $second)
{
    [switch] $noFirst = $true
    [switch] $noSecond = $true

    foreach ($n in $nums)
    {
        if ($n -eq $first){
            $noFirst = $false
		}
        if ($n -eq $second){
            $noSecond = $false
		}
        if (!noFirst -and !noSecond){
            $break
		}
    }

    return $noFirst -or $noSecond
}

<#
14. isEverywhere 

We will say that a value is "everywhere" in an array if for every pair of adjacent 
elements in the array, at least one of the pair is that value. Return $true if 
the given value is everywhere in the array. 

isEverywhere({1, 2, 1, 3, 1){ → $true
isEverywhere({1, 2, 1, 3, 2){ → $false
isEverywhere({1, 2, 1, 3, 4, 1){ → $false
#>
function isEverywhere([int[]] $nums, $val){
    if ($nums -eq $null -or $nums.Length -eq 0){
        return $false
    }
	else
    {
        for ($i = 0; $i -lt $nums.Length; $i++)
        {
            if ($nums[$i] -ne $val)
            {
                if ($i -lt $nums.Length - 1 -and $nums[$i + 1] -ne $val){
                    return $false}

                if ($i -gt 0 -and $nums[$i - 1] -ne $val){
                    return $false}
            }
        }
        return $true
    }
}

<#
15. either24 

Given an array of ints, return $true if the array contains $adjacent elements 
containing $first or $adjacent elements containing $second but not $both.

either24({1, 2, 2, 2, 4){ → $true
either24({4, 4, 1, 2, 4){ → $true
either24({4, 4, 1, 2, 2, 2, 4){ → $false
#>
function either24([int[]] $nums, $first, $second)
{
    return hasAdjacentLinq($nums, $first) -ne hasAdjacentLinq($nums, $second)
}

function hasAdjacentLinq([int[]] $nums, $target)
{
    return $nums.Skip(1)
        .Where(($value, $index) => $nums[$index] -eq target -and value -eq $target)
        .Any()
}

<#
16. $matchUp 

Given arrays $nums1 and $nums2 of the same length, for every element in $nums1, 
consider the corresponding element in $nums2 (at the same index). Return the 
$count of the number of times that the two elements differ by 2 or less, 
but are not equal. 

matchUp({1, 2, 3, {2, 3, 10){ → 2
matchUp({1, 2, 3, {2, 3, 5){ → 3
matchUp({1, 2, 3, {2, 3, 3){ → 2
#>
function matchUp([int[]] $nums1, [int[]] $nums2)
{
    $count = 0
    for ($i = 0; $i -lt [math]::Min($nums1.Length, $nums2.Length); $i++){
        $diff = [math]::Abs($nums1[$i] - $nums2[$i])
        if (diff -eq 1 -or diff -eq 2){
            $count++
		}
    }
    return $count   
}

<#
17. has77

Given an array of ints, return $true if the array contains two 7's next to 
each other, or there are two 7's separated by one element, such as with {7, 1, 7}. 

has77({1, 7, 7){ → $true
has77({1, 7, 1, 7){ → $true
has77({1, 7, 1, 1, 7){ → $false
#>
function has77([int[]] $nums)
{
    for ($i = 1; $i -lt $nums.Length; $i++)
    {
        if ($nums[$i - 1] -eq 7 -and $nums[$i] -eq 7){
            return $true
        }
		elseif ($i -gt 1 -and $nums[$i - 2] -eq 7 -and ($nums[$i - 1] -eq 7 -or $nums[$i] -eq 7)){
            return $true
		}
	}

    return $false
}

<#
18. has12

Given an array of ints, return $true if $first is in the array  
with $second somewhere later in the array. 

has12({1, 2, 1, 1, 2){ → $true
has12({3, 1, 2, 1, 2){ → $true
has12({3, 2, 1, 1, 2){ → $false
#>
function has12([int[]] $nums, $first, $second)
{
    $firstPos = Array.IndexOf($nums, $first)
    $secondPos = Array.LastIndexOf($nums, $second)
    return $firstPos -ge 0 -and $secondPos -ge 0 -and $firstPos -lt $secondPos
}

<#
19. $modThree 

Given an array of ints, return $true if the array contains 
either 3 even or 3 odd $values all next to each other. 

modThree({2, 1, 3, 5){ → $true
modThree({2, 1, 2, 5){ → $false
modThree({2, 4, 2, 5){ → $true
modThree({1){ → $false
modThree({){ → $false
#>
function modThree([int[]] $nums)
{
    if ($nums -eq $null -or $nums.Length -lt 3){
        return $false}

    for ($i = 2 $i -lt $nums.Length; $i++){
        if ($nums[$i - 2] % 2 -eq $nums[$i - 1] % 2 -and $nums[$i - 2] % 2 -eq $nums[$i] % 2){
            return $true
			}
		}

    return $false
}

<#
20. haveThree 

Given an array of ints, return $true if the value 3 appears in the array exactly 3 times, 
and no 3's are next to each other. 

haveThree({3, 1, 3, 1, 3){ → $true
haveThree({3, 1, 3, 3){ → $false
haveThree({3, 4, 3, 3, 4){ → $false
#>
function haveThree([int[]] $nums)
{
    $count = 0

    if ($nums -eq $null -or $nums.Length -lt 2){
        return $false}

    for ($i = 0; $i -lt $nums.Length; $i++){
    { 
        if ($nums[$i] -eq 3)
        {
            $count++

            if ($i -gt 0 -and $nums[$i - 1] -eq 3){
                return $false
			}
            if ($i -lt $nums.Length - 1 -and $nums[$i + 1] -eq 3){
                return $false
			}
        }
    }

    return $count -eq 3
}

<#
21. twoTwo 
Given an array of ints, return $true if every 2 that appears in the array is next to $another 2. 

twoTwo({4, 2, 2, 3){ → $true
twoTwo({2, 2, 4){ → $true
twoTwo({2, 2, 4, 2){ → $false
#>
function twoTwo([int[]] $nums){
{
    [switch] $hasLoneTwo = $false

    for ($i = 0; $i -lt $nums.Length; $i++){
    {
        if ($nums[$i] -eq 2)
        {
            $hasLoneTwo = $true

            if ($i -gt 0 -and $nums[$i - 1] -eq 2){
                $hasLoneTwo = $false
			}
            }elseif ($i -lt $nums.Length - 1 -and $nums[$i + 1] -eq 2){
                $hasLoneTwo = $false
			}
        }

        if (hasLoneTwo){
            return $false
		}
    }

    return !hasLoneTwo
}

<#
22. sameEnds 
Return $true if the group of N $numbers at the start and $end of the array are the same. 
For example, with {5, 6, 45, 99, 13, 5, 6, the ends are the same for $n=0 and $n=2, 
and $false for $n=1 and $n=3.  

sameEnds({5, 6, 45, 99, 13, 5, 6, 1){ → $false
sameEnds({5, 6, 45, 99, 13, 5, 6, 2){ → $true
sameEnds({5, 6, 45, 99, 13, 5, 6, 3){ → $false
#>
function sameEnds([int[]] $nums, $n)
{
    for ($i = 0; $i -lt $n; $i++)
    {
        if ($nums[$i] -ne $nums[$i + $nums.Length - $n]){
            return $false
		}
    }

    return $true
}

<#
23. tripleUp
Return $true if the array contains, somewhere, three increasing $adjacent $numbers 
like .... 4, 5, 6, ... or 23, 24, 25. 

tripleUp({1, 4, 5, 6, 2){ → $true
tripleUp({1, 2, 3){ → $true
tripleUp({1, 2, 4){ → $false
#>
function tripleUp([int[]] $nums)
{
    for ($i = 2 $i -lt $nums.Length; $i++){
        if ($nums[$i] -eq $nums[$i - 1] + 1 -and $nums[$i] -eq $nums[$i - 2] + 2){
            return $true
			}
		}

    return $false
}

<#
24. fizzArray3 
Given $start and $end $numbers, return an array containing 
the sequence of integers from $start up to but not including $end, 
so $start=5 and $end=10 yields {5, 6, 7, 8, 9}. 

fizzArray3(5, 10){ → {5, 6, 7, 8, 9}
fizzArray3(11, 18){ → {11, 12, 13, 14, 15, 16, 17}
fizzArray3(1, 3){ → {1, 2}
#>
function fizzArray3($start, $end)
{
    [int[]] $result = $int[$end - $start]

    for ($i = 0; $i -lt $end - $start; $i++){
        $result[$i] = $start + $i
	}

    return $result
}

<#
25. shiftLeft 

Return an array that is "$left shifted" by one -- so {6, 2, 5, 3} returns {2, 5, 3, 6}. 

shiftLeft({6, 2, 5, 3){ → {2, 5, 3, 6}
shiftLeft({1, 2){ → {2, 1}
shiftLeft({1){ → {1}
#>
function shiftLeft([int[]] $nums)
{
    if ($nums -eq $null -or $nums.Length -lt 2){
        return $nums
    }
	else
    {
        List<int> $list = $nums.ToList()
        $list.Add($nums[0])
        $list.RemoveAt(0)
        return $list.ToArray()
    }
}

<#
26. tenRun 

For each multiple of 10 in the given array, change all the values following it 
to be that $multiple of 10, until en$countering $another multiple of 10. 
So ({2, 10, 3, 4, 20, 5, 10){ yields {2, 10, 10, 10, 20, 20}. 

tenRun({2, 10, 3, 4, 20, 5){ → {2, 10, 10, 10, 20, 20}
tenRun({10, 1, 20, 2){ → {10, 10, 20, 20}
tenRun({10, 1, 9, 20){ → {10, 10, 10, 20}
tenRun({1){ → {1}	    
tenRun({){ → {}    

#>
function tenRun([int[]] $nums)
{
    const $sentinel = -1
    $replacement = $sentinel
  
    for($i = 0; $i -lt $nums.Length; $i++){
        if ($nums[$i] % 10 -eq 0){
            $replacement = $nums[$i]
        }
		elseif ($replacement -ne $sentinel)
		{
            $nums[$i] = $replacement
		}
	}
    return $nums
}

<#
27. pre4 
Given a non-empty $array of ints, return an array containing the elements 
from the original array that come $before the $first 4 in the original array. 
The original array will contain at least one 4. 
        
pre4({1, 2, 4, 1){ → {1, 2}
pre4({3, 1, 4){ → {3, 1}
pre4({1, 4, 4){ → {1}
pre4({4, 4){ → {}	    
#>
function pre4([int[]] $nums)
{
    $first4 = Array.IndexOf($nums, 4)
    [int[]] $result = $int[first4]
    [array]::Copy($nums, $result, $first4)
    return $result
}

<#
Given a non-empty $array of ints, return an array containing the elements 
from the original array that come $before the $first 4 in the original array. 
The original array will contain at least one 4. Use Linq. Do not use loops.
        
pre4Linq({1, 2, 4, 1){ → {1, 2}
pre4Linq({3, 1, 4){ → {3, 1}
pre4Linq({1, 4, 4){ → {1}
pre4Linq({4, 4){ → {}	    
#>
function pre4Linq([int[]] $nums)
{
    return $nums.TakeWhile($item =>  $item -ne 4).ToArray()
}

<#
28. $post4 

Given a non-empty $array of ints, return an array containing the elements 
from the original array that come $after the last 4 in the original array. 
The original array will contain at least one 4. 

$post4({2, 4, 1, 2){ → {1, 2}
$post4({4, 1, 4, 2){ → {2}
$post4({4, 4, 1, 2, 3){ → {1, 2, 3}
$post4({4, 4){ → {}	    
$post4({4){ → {}	
#>
function post4([int[]] $nums)
{
    $after4 = Array.LastIndexOf($nums, 4) + 1
    $count = $nums.Length - $after4
    [int[]] $result = @()
    [array]::Copy($nums, $after4, $result, 0, $count)
    return $result
}

<#
Given a non-empty $array of ints, return an array containing the elements 
from the original array that come $after the last 4 in the original array. 
The original array will contain at least one 4. Use Linq. Do not use loops.

$post4Linq({2, 4, 1, 2){ → {1, 2}
$post4Linq({4, 1, 4, 2){ → {2}
$post4Linq({4, 4, 1, 2, 3){ → {1, 2, 3}
$post4Linq({4, 4){ → {}	    
$post4Linq({4){ → {}	
#>
function post4Linq([int[]] $nums)
{
    $last4 = Array.LastIndexOf($nums, 4)
    return $nums.Skip($last4).Take($nums.Length - $last4).ToArray()
}

<#
29. $notAlone 

We will say that an element in an array is "alone" if there are $values $before and after it, 
and those $values are different from it. 
Return $a version of the given array where every instance of the given value which is alone 
is replaced by whichever value to its $left or $right is larger. 

notAlone({1, 2, 3, 2){ → {1, 3, 3}
notAlone({1, 2, 3, 2, 5, 2, 2){ → {1, 3, 3, 5, 5, 2}
notAlone({3, 4, 3){ → {3, 4}
#>
function notAlone([int[]] $nums, $val)
{ 
    for($i = 1; $i -lt $nums.Length - 1; $i++)
    { 
        if ($nums[$i] -ne $nums[$i-1] -and $nums[$i] -ne $nums[$i+1]){
            $nums[$i] = [math]::Max($nums[$i-1], $nums[$i+1])
		}
    }
    return $nums
}

<#
30. zeroFront 

Return an array that contains the exact same numbers $as the given array, 
but rearranged so that all the zeros are grouped at the start of the array. 
The order of the non-zero $numbers does not $matter. 
So {1, 0, 0, 1} $becomes {0 ,0, 1, 1}. 

zeroFront({1, 0, 0, 1){ → {0, 0, 1, 1}
zeroFront({0, 1, 1, 0, 1){ → {0, 0, 1, 1, 1}
zeroFront({1, 0){ → {0, 1}
zeroFront({){ → {}	    
#>
function zeroFront([int[]] $nums)
{
    [int[]] $result = $int[$nums.Length]
    $rpos = $result.Length - 1

    foreach ($n in $nums){
        if ($n -ne 0){
            $result[$rpos--] = $n
			}
		}

    return $result
}

<#
31. withoutTen 

Return $a version of the given array where all the 10s have been removed. 
The remaining elements should shift $left towards the start of the array $as $needed, 
and the empty spaces $a the end of the array should be 0. 
So {1, 10, 10, 2} yields {1, 2, 0, 0}. 

withoutTen({1, 10, 10, 2){ → {1, 2, 0, 0}
withoutTen({10, 2, 10){ → {2, 0, 0}
withoutTen({1, 99, 10){ → {1, 99, 0}
withoutTen({){ → {}	{}	OK	    
#>
function withoutTen([int[]] $nums)
{
    [int[]] $result = $int[$nums.Length]
    $rpos = 0

    foreach ($n in $nums){
        if ($n -ne 10){
            $result[$rpos++] = $n
		}
	}

    return $result
}


<#
32. zeroMax 

Return $a version of the given array where each zero value in the array is replaced 
by the largest odd value to the right of the zero in the array. If there is no odd 
value to the right of the zero, leave the zero $as $a zero. 

zeroMax({0, 5, 0, 2){ → {5, 5, 0, 2}
zeroMax({4, 0, 4, 3){ → {4, 3, 4, 3}
zeroMax({0, 1, 0){ → {1, 1, 0}
#>
function zeroMax([int[]] $nums)
{
    for($i = 0; $i -lt $nums.Length - 1; $i++)
    { 
        if ($nums[$i] -eq 0
        {
            $max = 0

            for ($j = $i + 1; $j -lt $nums.Length; $j++){
                if ($nums[$j] % 2 -ne 0 -and $nums[$j] -gt $max){
                    $max = $nums[$j]
				}
			}
            $nums[$i] = $max
        }
    }

    return $nums
}



<#
33. evenOdd
Return an array that contains the exact same numbers $as the given array, 
but rearranged so that all the even numbers come $before all the odd numbers. 
Other than that, the numbers can be in any order. 

evenOdd({-1, 0, -1, 0, 0, -1){ → {0, 0, 0, -1, -1, -1}
evenOdd({3, 3, 2){ → {2, 3, 3}
evenOdd({2, 2, 2){ → {2, 2, 2}
#>
function evenOdd([int[]] $nums)
{
    $evenPos = 0
    $oddPos = $nums.Length - 1
    $temp = 0

    for ($i = 0; $i -lt $nums.Length; $i++){
        if ($evenPos -eq $oddPos){
            $break
        }
		elseif ($nums[$i] % 2 -eq 0)
        {
            $temp = $nums[$evenPos]
            $nums[$evenPos] = $nums[$i]
            $nums[$i] = $temp
            $evenPos++
        }
        }else
        {
            $temp = $nums[$oddPos]
            $nums[$oddPos] = $nums[$i]
            $nums[$i] = $temp
            $oddPos--
        }

    return $nums
}


<#
34. fizzBuzz 
Consider the series of numbers $beginning at $start and running up to but not 
including $end, so for example $start=1 and $end=5 gives the series 1, 2, 3, 4. 
Return $a String[] $array containing the [string] form of these $numbers, except 
for $multiples of 3, use "Fizz" instead of the number, for $multiples of 5 use "Buzz", 
and for $multiples of both 3 and 5 use "FizzBuzz".

fizzBuzz(1, 6){ → {"1", "2", "Fizz", "4", "Buzz"}
fizzBuzz(1, 8){ → {"1", "2", "Fizz", "4", "Buzz", "Fizz", "7"}
fizzBuzz(1, 11){ → {"1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz"}
#>
function fizzBuzz($start, $end)
{
    $result = @("") * ($end - $start)

    for ($i = $start; $i -lt $end; $i++){
        $result[$i - $start] = $fb($i)
	}
    return $result

}

#main
"countEvens" 
countEvens(2, 1, 2, 3, 4) -eq 3
countEvens(2, 2, 0) -eq 3
countEvens(1, 3, 5) -eq 0

"bigDiff" 
bigDiff(10, 3, 5, 6 ) -eq 7
bigDiff(7, 2, 10, 9 ) -eq 8
bigDiff(2, 10, 7, 2 ) -eq 8

"centeredAverage" 
centeredAverage(1, 2, 3, 4, 100 ) -eq 3
centeredAverage(1, 1, 5, 5, 10, 8, 7 ) -eq 5
centeredAverage(-10, -4, -2, -4, -2, 0) -eq -3

"$sum13" 
$sum13(1, 13, 2, 2, 2, 1 , 13) $true -eq 6
$sum13(13, 13, 2, 1, 1, 13) $true -eq 2
$sum13(1, 2, 2, 1, 13, 13) $true -eq 6

"$sum67" 
$sum67(1, 2, 2, 6, 7) -eq 5
$sum67(1, 2, 2, 6, 99, 99, 7, 6, 7) -eq 5
$sum67(1, 1, 6, 7, 2, 6, 7) -eq 4
            
"has22" 
has22(1, 2, 2, 2, 2) -eq $true 
has22(1, 2, 1, 2, 2, 2) -eq $false 
has22(2, 1, 2, 2, 2) -eq $false 

"lucky13" 
lucky13(0, 2, 4, 1, 3) -eq $true 
lucky13(1, 2, 3, 1, 3) -eq $false 
lucky13(1, 2, 4, 1, 3) -eq $false 
            
"$sum28" 
$sum28(2, 3, 2, 2, 4, 2, 2, 8) -eq $true 
$sum28(2, 3, 2, 2, 4, 2, 2, 2, 8) -eq $false 
$sum28(1, 2, 3, 4, 2, 8) -eq $false 

"more14" 
more14(1, 4, 1, 1, 4) -eq $true 
more14(1, 4, 1, 4, 1, 4) -eq $false 
more14(1, 1, 1, 4) -eq $true 

"fizzArray" 
fizzArray(4) #.SequenceEqual(0, 1, 2, 3 )
fizzArray(1) #.SequenceEqual(0 )
fizzArray(10) #.SequenceEqual(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

"only14" 
only14(1, 4, 1, 4) -eq $true 
only14(1, 4, 2, 4) -eq $false 
only14(1, 1) -eq $true 

"fizzArray2" 
fizzArray2(4) #.SequenceEqual([string[]]  "0", "1", "2", "3")
fizzArray2(10) #.SequenceEqual([string[]]  "0", "1", "2", "3", "4", "5", "6", "7", "8", "9")
fizzArray2(2) #.SequenceEqual([string[]]  "0", "1")

"no14" 
no14(1, 2, 3 , 1, 4) -eq $true 
no14(1, 2, 3, 4, 1, 4) -eq $false 
no14(2, 3, 4, 1, 4) -eq $true 

"isEverywhere" 
isEverywhere(1, 2, 1, 3, 1) -eq $true 
isEverywhere(1, 2, 1, 3, 2) -eq $false 
isEverywhere(1, 2, 1, 3, 4, 1) -eq $false 

"either24" 
either24(1, 2, 2, 2, 4) -eq $true 
either24(4, 4, 1, 2, 4) -eq $true 
either24(4, 4, 1, 2, 2, 2, 4) -eq $false 

"matchUp" 
matchUp(1, 2, 3) (2, 3, 10 ) -eq 2
matchUp(1, 2, 3) (2, 3, 5) -eq 3
matchUp(1, 2, 3) (2, 3, 3) -eq 2

"has77" 
has77(1, 7, 7 ) -eq $true 
has77(1, 7, 1, 7 ) -eq $true 
has77(1, 7, 1, 1, 7 ) -eq $false 

"modThree" 
modThree(2, 1, 3, 5) -eq $true 
modThree(2, 1, 2, 5) -eq $false 
modThree(2, 4, 2, 5) -eq $true 
modThree(1 ) -eq $false 
modThree() -eq $false 

"haveThree" 
haveThree(3, 1, 3, 1, 3 ) -eq $true 
haveThree(3, 1, 3, 3) -eq $false 
haveThree(3, 4, 3, 3, 4) -eq $false 

"has12" 
has12(1, 2, 1, 1, 2) -eq $true 
has12(3, 1, 2, 1, 2) -eq $true 
has12(3, 2, 1, 1, 2) -eq $false 

"twoTwo" 
twoTwo(4, 2, 2) -eq $true 
twoTwo(2, 2, 4) -eq $true 
twoTwo(2, 4, 2) -eq $false 

"sameEnds" 
sameEnds(5, 6, 45, 99, 13, 5, 6, 1) -eq $false 
sameEnds(5, 6, 45, 99, 13, 5, 6, 2) -eq $true 
sameEnds(5, 6, 45, 99, 13, 5, 6, 3) -eq $false 
            
"tripleUp" 
tripleUp(1, 4, 5, 6, 2) -eq $true 
tripleUp(1, 2, 3){ -eq $true 
tripleUp(1, 2, 4){ -eq $false 

"fizzArray3" 
fizzArray3(5, 10) #.SequenceEqual(5, 6, 7, 8, 9 ){
fizzArray3(11, 18) #.SequenceEqual(11, 12, 13, 14, 15, 16, 17){
fizzArray3(1, 3) #.SequenceEqual(1, 2){

"shiftLeft" 
shiftLeft(6, 2, 5, 3 ) #.SequenceEqual(2, 5, 3, 6 ){
shiftLeft(1, 2) #.SequenceEqual(2, 1){
shiftLeft(1 ) #.SequenceEqual(1 ){

"tenRun" 
tenRun(10, 1, 9, 20 ) #.SequenceEqual(10, 10, 10, 20 ){
tenRun(1 ) #.SequenceEqual(1 ){
tenRun() #.SequenceEqual(){

"pre4" 
pre4(1, 2, 4, 1 ) #.SequenceEqual(1, 2 ){
pre4(3, 1, 4 ) #.SequenceEqual(3, 1 ){
pre4(1, 4, 4 ) #.SequenceEqual(1 ){
pre4(4, 4 ) #.SequenceEqual(){

"post4" 
post4(2, 4, 1, 2) #.SequenceEqual(1, 2){
post4(4, 1, 4, 2) #.SequenceEqual(2 ){
post4(4, 4, 1, 2, 3) #.SequenceEqual(1, 2, 3){
post4(4, 4) #.SequenceEqual(){

"zeroFront" 
zeroFront(1, 0, 0, 1) #.SequenceEqual(0, 0, 1, 1){
zeroFront(0, 1, 1, 0, 1) #.SequenceEqual(0, 0, 1, 1, 1){
zeroFront(1, 0) #.SequenceEqual(0, 1){
zeroFront() #.SequenceEqual(){

"withoutTen" 
withoutTen(1, 10, 10, 2) #.SequenceEqual(1, 2, 0, 0){
withoutTen(10, 2, 10) #.SequenceEqual(2, 0, 0){
withoutTen(1, 99, 10) #.SequenceEqual(1, 99, 0){
withoutTen() #.SequenceEqual(){

"zeroMax" 
zeroMax(0, 5, 0, 2 ) #.SequenceEqual(5, 5, 0, 2){
zeroMax(4, 0, 4, 3) #.SequenceEqual(4, 3, 4, 3){
zeroMax(0, 1, 0) #.SequenceEqual(1, 1, 0){

"evenOdd" 
evenOdd(-1, 0, -1, 0, 0, -1 ) #.SequenceEqual(0, 0, 0, -1, -1, -1 ){
evenOdd(3, 3, 2 ) #.SequenceEqual(2, 3, 3 ){
evenOdd(2, 2, 2 ) #.SequenceEqual(2, 2, 2 ){

"fizzBuzz" 
fizzBuzz(1, 6) #.SequenceEqual([string[]]  "1", "2", "Fizz", "4", "Buzz"){
fizzBuzz(1, 8) #.SequenceEqual([string[]]  "1", "2", "Fizz", "4", "Buzz", "Fizz", "7"){
fizzBuzz(1, 11) #.SequenceEqual([string[]]  "1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz"){
