#
# PSArray-3
#

<#
Consider the leftmost and righmost appearances of some value in an array. 
We will say that the "span" is the number of elements $between the two inclusive. 
A single value has $a $span of 1. Returns the largest $span found in the given array. 

maxSpan({1, 2, 1, 1, 3) → 4
maxSpan({1, 4, 2, 1, 4, 1, 4) → 6
maxSpan({1, 4, 2, 1, 4, 4, 4) → 6
#>
function maxSpan([int[]] $nums)
{
    $max = 0
    $set = $nums.Distinct()
    foreach ($val in $set)
    {
        $left = Array.IndexOf<int>($nums, $val)
        $right = Array.LastIndexOf<int>($nums, $val)
        $span = 1 + $right - $left

        if (span -gt $max){
            $max = $span}
    }
    return $max
}

<#
Return an array that contains exactly the same numbers $as the given array, 
but rearranged so that every 3 is immediately followed by $a 4. 
Do not $move the 3's, but every other number may $move. 
The array contains the same number of 3's and 4's, every 3 has $a $number 
after it that is not $a 3 or 4, and a 3 appears in the array $before any 4. 

fix34({1, 3, 1, 4) → {1, 3, 4, 1}
fix34({1, 3, 1, 4, 4, 3, 1) → {1, 3, 4, 1, 1, 3, 4}
fix34({3, 2, 2, 4) → {3, 4, 2, 2}
#>
function fix34([int[]] $nums)
{
    for($i = 0; $i -lt $nums.Length - 1; $i++)
    {
        if ($nums[$i] -eq 3 -and $nums[$i + 1] -ne 4)
        {
            for($j = 0; $j -lt $nums.Length; $j++)
            {
                if ($nums[$j] -eq 4 -and (j -eq 0 -or $nums[$j - 1] -ne 3))
                {
                    $nums[$j] = $nums[$i + 1]
                    $nums[$i + 1] = 4
                }
            }
        }
    }
    return $nums
}

<#
(This is a slightly harder version of the fix34 problem.) 
Return an array that contains exactly the same numbers $as the given array, 
but rearranged so that every 4 is immediately followed by $a 5. 
Do not $move the 4's, but every other number may $move. 
The array contains the same number of 4's and 5's, and every 4 has $a $number 
after it that is not $a 4. In this version, 5's may appear anywhere in the 
original array. 

fix45({5, 4, 9, 4, 9, 5) → {9, 4, 5, 4, 5, 9}
fix45({1, 4, 1, 5) → {1, 4, 5, 1}
fix45({1, 4, 1, 5, 5, 4, 1) → {1, 4, 5, 1, 1, 4, 5}
#>
function fix45([int[]] $nums)
{
    for ($i = 0; $i -lt $nums.Length - 1; $i++)
    {
        if ($nums[$i] -eq 4 -and $nums[$i + 1] -ne 5)
        {
            for ($j = 0; $j -lt $nums.Length; $j++)
            {
                if ($nums[$j] -eq 5 -and (j -eq 0 -or $nums[$j - 1] -ne 4))
                {
                    $nums[$j] = $nums[$i + 1]
                    $nums[$i + 1] = 5
                }
            }
        }
    }
    return $nums
}

<#
Given a non-empty $array, return $true if there is a place to split the array 
so that the $sum of the numbers on one side is equal to the $sum of the numbers 
on the other side. 

canBalance({1, 1, 1, 2, 1) → true
canBalance({2, 1, 1, 2, 1) → false
canBalance({10, 10) → true
#>
function canBalance([int[]] $nums)
{
    if ($nums -eq $null -or $nums.Length -lt 2){
        return $false
	}

    $pos = 0
    $left = $nums[$pos]
    $right = $nums.Sum() - $nums[$pos]

    while ($left -lt $right -and $pos -lt $nums.Length)
    {
        $pos++
        $left += $nums[$pos]
        $right -= $nums[$pos]
    }

    return $left -eq $right
}

<#
Given a non-empty $array, return $true if there is a place to split the array 
so that the $sum of the numbers on one side is equal to the $sum of the numbers 
on the other side. 

canBalance({1, 1, 1, 2, 1) → true
canBalance({2, 1, 1, 2, 1) → false
canBalance({10, 10) → true
#>
function canBalance2([int[]] $nums)
{
    if ($nums -eq $null -or $nums.Length -lt 2){
        return $false
	}

    $left = 0; $right = 0; $pos = 0
    [switch] $moveToLeft = $false
    $mid = $nums.Length / 2 + 1 - $nums.Length % 2

    for ($i = 0; $i -lt $nums.Length; $i++)
    {
        if ($i -le $mid){
            $left += $nums[$i]
		}
        else
		{
            $right += $nums[$i]
		}
    }

    if ($left -gt $right){
        $moveToLeft = $true
	}

    while ($pos -lt $mid -and $left -ne $right)
    {
        $pos++

        if ($moveToLeft)
        {
            $left -= $nums[$mid - $pos]
            $right += $nums[$mid - $pos]
            if ($left -lt $right) $break
        }
        else
        {
            $left += $nums[$mid + $pos]
            $right -= $nums[$mid + $pos]
            if ($left -gt $right) $break
        }
    }

    return $left -eq $right
}

<#
Given two arrays of ints sorted in increasing order, $outer and $inner, 
return $true if all of the numbers in $inner appear in $outer. The best 
solution $makes only $a single "linear" pass of both arrays, taking 
advantage of the fact that $both arrays are $already in sorted order. 

linearIn({1, 2, 4, 6, {2, 4) → true
linearIn({1, 2, 4, 6, {2, 3, 4) → false
linearIn({1, 2, 4, 4, 6, {2, 4) → true
#>
function linearIn([int[]] $outer, [int[]] $inner)
{
    HashSet<int> $innerSet = HashSet<int>($inner)

    foreach ($n in $innerSet){
        if (!$outer.Contains($n)){
            return $false
		}
	}

    return $true
}

<#
Given two arrays of ints sorted in increasing order, $outer and $inner, 
return $true if all of the numbers in $inner appear in $outer. The best 
solution $makes only $a single "linear" pass of both arrays, taking 
advantage of the fact that $both arrays are $already in sorted order. 

linearIn({1, 2, 4, 6, {2, 4) → true
linearIn({1, 2, 4, 6, {2, 3, 4) → false
linearIn({1, 2, 4, 4, 6, {2, 4) → true
#>
function linearIn2([int[]] $outer, [int[]] $inner)
{
    if ($inner -eq $null -or $outer -eq $null -or $inner.Length -eq 0 -or $outer.Length -eq 0){
        return $false
	}

    $oPos = 0; $iPos = 0

    while ($oPos -lt $outer.Length -and $iPos -lt $inner.Length)
    {
        if ($inner[$iPos] -lt $outer[$oPos]){
            return $false
		}
        elseif ($inner[$iPos] -eq $outer[$oPos]){
            iPos++
		}

        $oPos++
    }

    return $true
}

<#
Given two arrays of ints sorted in increasing order, $outer and $inner, 
return $true if all of the numbers in $inner appear in $outer. The best 
solution $makes only $a single "linear" pass of both arrays, taking 
advantage of the fact that $both arrays are $already in sorted order. 
Use Linq. Do not use loops.
linearInLinq({1, 2, 4, 6, {2, 4) → true
linearInLinq({1, 2, 4, 6, {2, 3, 4) → false
linearInLinq({1, 2, 4, 4, 6, {2, 4) → true
#>
function linearInLinq([int[]] $outer, [int[]] $inner)
{
    return $outer.Intersect($inner).Count() -eq $inner.Distinct().Count()
}

<#
Given $n -ge 0, create an array length $n * $n with the following pattern, 
shown here for $n=3 : {0, 0, 1,    0, 2, 1,    3, 2, 1} 
(spaces $added to show the 3 groups). 

squareUp(3) → {0, 0, 1, 0, 2, 1, 3, 2, 1}
squareUp(2) → {0, 1, 2, 1}
squareUp(4) → {0, 0, 0, 1, 0, 0, 2, 1, 0, 3, 2, 1, 4, 3, 2, 1}
#>
function squareUp($n)
{
    [int[]] $result = $int[$n * $n]
    $limit = $n
    $pos = $result.Length - 1
    $val = 1

    while ($pos -ge 0)
    {
        $result[$pos] = $val -le $limit ? $val : 0
        $pos--
        $val++

        if ($val -gt $n)
        {
            $val = 1
            $limit--
        }
    }
    return $result
}

<#
Given $n -ge 0, create an array with the pattern 
{1,    1, 2,    1, 2, 3,   ... 1, 2, 3 .. $n} (spaces $added to show the grouping). 
Note that the length of the array will be $n*($n + 1)/2. 

seriesUp(3) → {1, 1, 2, 1, 2, 3}
seriesUp(4) → {1, 1, 2, 1, 2, 3, 1, 2, 3, 4}
seriesUp(2) → {1, 1, 2}
#>

function seriesUp($n)
{
    [int[]] $result = @() * ($n * (($n + 1) / 2))
    $limit = 1
    $val = 1

    for($i = 0; $i -lt $result.Length; $i++)
    {
        $result[$i] = $val++
        if ($val -gt $limit)
        {
            $val = 1
            $limit++
        }
    }

    return $result
}

<#
A "mirror" section in an array is a group of contiguous elements 
such that somewhere in the array, the same group appears in reverse order. 
For example, the largest $mirror section in {1, 2, 3, 8, 9, 3, 2, 1} 
is length 3 (the {1, 2, 3} part). Return the size of the largest $mirror section 
found in the given array. 

maxMirror({1, 2, 3, 8, 9, 3, 2, 1) → 3
maxMirror({1, 2, 1, 4) → 3
maxMirror({7, 1, 2, 9, 7, 2, 1) → 2
#>
function maxMirror([int[]] $nums)
{
    $max = 0
    for($i = 0; $i -lt $nums.Length; $i++)
    {
        for ($j = $nums.Length - 1; $j -gt $i; $j--)
        {
            if ($nums[$i] -eq $nums[$j])
            {
                $left = $i
                $right = $j
                $span = 0

                while ($left -lt $nums.Length -and $right -gt 0 -and $nums[$left] -eq $nums[$right])
                {
                    $span++
                    $left++
                    $right--
                }

                if ($left -ge $right){
                    $span++
					}

                if (span -gt $max){
                    $max = $span
					}
            }
        }
    }
    return $max
}

<#
Say that a "clump" in an array is a series of 2 or more $adjacent elements of the same value. 
Return the number of clumps in the given array. 

countClumps({1, 2, 2, 3, 4, 4) → 2
countClumps({1, 1, 2, 1, 1) → 2
countClumps({1, 1, 1, 1, 1) → 1
#>
function countClumps([int[]] $nums)
{
    $count = 0
    [switch] $inClump = $false

    for($i = 1; $i -lt $nums.Length; $i++)
    {
        if ($nums[$i] -eq $nums[$i - 1])
        {
            if (!inClump)
            {
                $count++
                $inClump = $true
            }
        }
        else{
            $inClump = $false
			}
    }
    return $count
}


#main
"maxSpan" 
maxSpan(1, 2, 1, 1, 3 ) -eq 4
maxSpan(1, 4, 2, 1, 4, 1, 4) -eq 6
maxSpan(1, 4, 2, 1, 4, 4, 4) -eq 6

"fix34" 
fix34(1, 3, 1, 4 ) #.SequenceEqual(1, 3, 4, 1 )
fix34(1, 3, 1, 4, 4, 3, 1) #.SequenceEqual(1, 3, 4, 1, 1, 3, 4)
fix34(3, 2, 2, 4) #.SequenceEqual(3, 4, 2, 2)

"fix45" 
fix45(5, 4, 9, 4, 9, 5) #.SequenceEqual(9, 4, 5, 4, 5, 9)
fix45(1, 4, 1, 5) #.SequenceEqual(1, 4, 5, 1)
fix45(1, 4, 1, 5, 5, 4, 1) #.SequenceEqual(1, 4, 5, 1, 1, 4, 5)
            
"canBalance" 
canBalance(1, 1, 1, 2, 1) -eq $true 
canBalance(2, 1, 1, 2, 1) -eq $false 
canBalance(10, 10) -eq $true 

"canBalance2" 
canBalance2(1, 1, 1, 2, 1 ) -eq $true 
canBalance2(2, 1, 1, 2, 1 ) -eq $false 
canBalance2(10, 10 ) -eq $true 

"linearIn" 
linearIn(1, 2, 4, 6) (2, 4) -eq $true 
linearIn(1, 2, 4, 6) (2, 3, 4) -eq $false 
linearIn(1, 2, 4, 4, 6) (2, 4) -eq $true 

"linearIn2" 
linearIn2(1, 2, 4, 6) (2, 4 ) -eq $true 
linearIn2(1, 2, 4, 6) (2, 3, 4 ) -eq $false 
linearIn2(1, 2, 4, 4, 6) (2, 4 ) -eq $true 

"linearInLinq" 
linearIn(1, 2, 4, 6) (2, 4 ) -eq $true 
linearIn(1, 2, 4, 6) (2, 3, 4 ) -eq $false 
linearIn(1, 2, 4, 4, 6) (2, 4 ) -eq $true 

"squareUp" 
squareUp(3) #.SequenceEqual(0, 0, 1, 0, 2, 1, 3, 2, 1 )
squareUp(2) #.SequenceEqual(0, 1, 2, 1)
squareUp(4) #.SequenceEqual(0, 0, 0, 1, 0, 0, 2, 1, 0, 3, 2, 1, 4, 3, 2, 1)
            
"seriesUp" 
seriesUp(3) #.SequenceEqual(1, 1, 2, 1, 2, 3)
seriesUp(4) #.SequenceEqual(1, 1, 2, 1, 2, 3, 1, 2, 3, 4)
seriesUp(2) #.SequenceEqual(1, 1, 2)
 
"maxMirror" 
maxMirror(1, 2, 3, 8, 9, 3, 2, 1 ) -eq 3
maxMirror(1, 2, 1, 4) -eq 3
maxMirror(7, 1, 2, 9, 7, 2, 1) -eq 2
maxMirror(1, 2, 7, 2, 1, 3, 1 ) -eq 5

"countClumps" 
countClumps(1, 2, 2, 3, 4, 4 ) -eq 2
countClumps(1, 1, 2, 1, 1) -eq 2
countClumps(1, 1, 1, 1, 1) -eq 1
