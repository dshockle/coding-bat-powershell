#
# PSArray-1
#

<#
Start with 2 arrays, $a and $b, each length 2. 
Consider the $sum of the values in each array. 
Return the array which has the largest $sum. 
In event of a tie, return $a. 

biggerTwo({1, 2, {3, 4) → {3, 4}
biggerTwo({3, 4, {1, 2) → {3, 4}
biggerTwo({1, 1, {1, 2) → {1, 2}
#>
function biggerTwo([int[]] $a, $b)
{
    if ($sumArray($a) -ge $sumArray($b)){return $a}
    else{return $b}
        
}

function $sumArray([int[]] $arr)
{
    $sum = 0
    foreach ($n in $arr)
    {
        $sum += $n
    }
    return $sum
}

<#
Start with 2 arrays, $a and $b, each length 2. 
Consider the $sum of the values in each array. 
Return the array which has the largest $sum. 
In event of a tie, return $a. Use Linq. Do not use loops.

biggerTwoLinq({1, 2, {3, 4) → {3, 4}
biggerTwoLinq({3, 4, {1, 2) → {3, 4}
biggerTwoLinq({1, 1, {1, 2) → {1, 2}
#>
function biggerTwoLinq([int[]] $a, $b)
{
    if ($a.Sum() -ge $b.Sum()){return $a}
    else{return $b}
        
}

<#
Return the two $middle elements of the even-length $array.

makeMiddle({1, 2, 3, 4) → {2, 3}
makeMiddle({7, 1, 2, 3, 4, 9) → {2, 3}
makeMiddle({1, 2) → {1, 2}
#>
function makeMiddle([int[]] $nums)
{
    if ($nums.Length -lt 2){return $nums}
        
    else{
        return [int[]] ($nums[$nums.Length/2-1], $nums[$nums.Length/2])
	}
}

<#
Given 2 arrays, each length 2, return an array length 4 
containing all their elements. Use an array. Do not use a list.

plusTwo({1, 2, {3, 4) → {1, 2, 3, 4}
plusTwo({4, 4, {2, 2) → {4, 4, 2, 2}
plusTwo({9, 2, {3, 4) → {9, 2, 3, 4}
#>
function plusTwo([int[]] $a, $b)
{
    $result = @(0) * ($a.Length + $b.Length)
    [array]::Copy($a, $result, $a.Length)
    [array]::Copy($b, 0, $result, $a.Length, $b.Length)
    return $result
}

<#
Given 2 arrays, each length 2, return an array length 4 
containing all their elements. Use a $list.

plusTwoList({1, 2, {3, 4) → {1, 2, 3, 4}
plusTwoList({4, 4, {2, 2) → {4, 4, 2, 2}
plusTwoList({9, 2, {3, 4) → {9, 2, 3, 4}
#>
function plusTwoList([int[]] $a, [int[]] $b)
{
    $list = New-Object "System.Collections.Generic.List[int]"
    $list.AddRange($a)
    $list.AddRange($b)
    return $list.ToArray()
}

<#
Given an array of ints, $swap the first and last elements in the array. 
Return the modified $array. 

The array length will be at least 1. 

swapEnds({1, 2, 3, 4) → {4, 2, 3, 1}
swapEnds({1, 2, 3) → {3, 2, 1}
swapEnds({8, 6, 7, 9, 5) → {5, 6, 7, 9, 8}
#>
function swapEnds([int[]] $nums)
{
    $temp = $nums[0]
    $nums[0] = $nums[$nums.Length - 1]
    $nums[$nums.Length - 1] = $temp
    return $nums
}

<#
    Given an array of ints of odd $length, return an array length 3 
    containing the elements from the middle of the array. The array 
    $length will be at least 3. 

    $midThree({1, 2, 3, 4, 5) → {2, 3, 4}
    $midThree({8, 6, 7, 5, 3, 0, 9) → {7, 5, 3}
    $midThree({1, 2, 3) → {1, 2, 3}        
#>
function midThree([int[]] $nums)
{
    $mid = $nums.Length / 2
    return [int[]] ($nums[$mid-1], $nums[$mid], $nums[$mid+1])
}

<#
    Given an array of ints of odd $length, return an array length N 
    containing the elements from the middle of the array. The array 
    $length will be at least N. 

    $midN({1, 2, 3, 4, 5, 3) → {2, 3, 4}
    $midN({8, 6, 7, 5, 3, 0, 9, 3) → {7, 5, 3}
    $midN({1, 2, 3, 3) → {1, 2, 3}        
#>
function midN([int[]] $nums, $n)
{
    [int[]] $result = $int[$n]
    $start = $nums.Length / 2 - $n / 2
    [array]::Copy($nums, $start, $result, 0, $n)
    return $result
}

<#
    Given an array of ints of odd $length, look at the first, last, 
    and $middle $values in the array and return the largest. 
    The array length will be $a least 1. 

    $maxTriple({1, 2, 3) → 3
    $maxTriple({1, 5, 3) → 5
    $maxTriple({5, 2, 3) → 5        
#>
function maxTriple([int[]] $nums)
{
    return [math]::Max($nums[0], [math]::Max($nums[$nums.Length/2], $nums[$nums.Length-1]))
}

<#
    Given an int array of any length, return an array of its first 2 elements. 
    If the array is smaller than length 2, use whatever elements are present. 

    $front2({1, 2, 3) → {1, 2}
    $front2({1, 2) → {1, 2}
    $front2({1) → {1}        
#>
function $front2([int[]] $nums)
{
    if ($nums.Length -lt 2){return $nums}
    else{
        return [int[]] ($nums[0], $nums[1])
	}
}

<#
    Given an $array of any length, return an array of its first N elements. 
    If the array is smaller than length N, use whatever elements are present. 

    $frontN({1, 2, 3, 2) → {1, 2}
    $frontN({1, 2, 2) → {1, 2}
    $frontN({1, 2) → {1}        
#>
function $frontN([int[]] $nums, $n)
{
    if ($nums.Length -lt $n){return $nums}
    else
    {
        [int[]] $result = @(0) * $n
        [array]::Copy($nums, 0, $result, 0, $n)
        return $result
    }
            
}

<#
    Given an $array of any length, return an array of its first N elements. 
    If the array is smaller than length N, use whatever elements are present. 
    Use Linq. Do not use loops.
    $frontN({1, 2, 3, 2) → {1, 2}
    $frontN({1, 2, 2) → {1, 2}
    $frontN({1, 2) → {1}        
#>
function $frontNLinq([int[]] $nums, $n)
{
    return $nums.Take($n).ToArray()
}

<#
Helper function return true if array elements are 1 and 3
#>
function is13([int[]] $nums, $start)
{
    return ($start -ge 0) -and ($start -lt $nums.Length - 1) -and ($nums[$start] -eq 1) -and ($nums[$start + 1] -eq 3)
}

<#
We will say that a 1 immediately followed by $a 3 in an array is an "unlucky" 1. 
Return true if the given array contains an unlucky 1 in the first 2 or 
last 2 positions in the array. 

unlucky1({1, 3, 4, 5) → true
unlucky1({2, 1, 3, 4, 5) → true
unlucky1({1, 1, 1) → false        
#>
function unlucky1([int[]] $nums)
{
    if ($nums.Length -lt 2){
		return $false
	}
    else{
		[bool] $x = $false
		[bool] $y = $false
		[bool] $z = $false
		$x = $is13 $nums 0
		$y = $is13 $nums 1
		$z = $is13 $nums $nums.Length-2

		return $x -or $y -or $z
	}
}

<#
    Given 2 arrays, $a and $b, return an array length 2 containing, 
    $as $much $as will fit, the elements from $a followed by the elements from $b. 
    The arrays may be any length, including 0, but there will be 2 or more
    elements $available $between the 2 arrays. 

    $make2({4, 5, {1, 2, 3) → {4, 5}
    $make2({4, {1, 2, 3) → {4, 1}
    $make2({, {1, 2) → {1, 2}        
#>
function make2([int[]] $a, $b)
{
    [int[]] $result

    if ($a.Length -ge 2){
        $result = [int[]] ($a[0], $a[1]) }
    elseif ($a.Length -eq 1){
        $result = [int[]] ($a[0], $b[0]) }
    else{
        $result = [int[]] ($b[0], $b[1]) }

    return $result
}

<#
    Given 2 arrays, $a and $b, return an array length N containing, 
    $as $much $as will fit, the elements from $a followed by the elements from $b. 
    The arrays may be any length, including 0, but there will be N or more
    elements $available $between the 2 arrays. 

    $makeN({4, 5, {1, 2, 3, 2) → {4, 5}
    $makeN({4, {1, 2, 3, 2) → {4, 1}
    $makeN({, {1, 2, 2) → {1, 2}        
#>
function makeN([int[]] $a, $b, $n)
{
    if ($a -eq $null -or $a.Length -eq 0)
    {
        [int[]] $result = $int[$n]
        [array]::Copy($b, $result, $n)
        return $result
    }

    elseif ($b -eq $null -or $b.Length -eq 0)
    {
        [int[]] $result = $int[$n]
        [array]::Copy($a, $result, $n)
        return $result
    }

    else
    {
        [int[]] $result = $int[$n]
        [array]::Copy($a, 0, $result, 0, $a.Length)
        [array]::Copy($b, 0, $result, $a.Length, $n - $a.Length)
        return $result
    }
}

<#
    Given 2 arrays, $a and $b, of any length, return an array with the 
    first element of each array. If either $array is length 0, ignore that $array. 
    Use an array. Do not use a list.
    $front11({1, 2, 3, {7, 9, 8) → {1, 7}
    $front11({1, {2) → {1, 2}
    $front11({1, 7, {) → {1}        
#>
function $front11([int[]] $a, $b)
{
	$len = [math]::Min($a.Length, 1) + [math]::Min($b.Length, 1)
    [int[]] $result = @(0) * $len
    $rpos = 0

    if ($a.Length -gt 0){
        $result[$rpos++] = $a[0]
	}
    if ($b.Length -gt 0){
        $result[$rpos++] = $b[0]
	}

    return $result
}

<#
    Given 2 arrays, $a and $b, of any length, return an array with the 
    first element of each array. If either $array is length 0, ignore that $array. 
    Use a $list.
    $front11List({1, 2, 3, {7, 9, 8) → {1, 7}
    $front11List({1, {2) → {1, 2}
    $front11List({1, 7, {) → {1}        
#>
function $front11List([int[]] $a, $b)
{
    $list = New-Object "System.Collections.Generic.List[int]"

    if ($a -ne $null -and $a.Length -gt 0){
        $list.Add($a[0])
	}
    if ($b -ne $null -and $b.Length -gt 0){
        $list.Add($b[0])
	}
    return $list.ToArray()
}

#main
"biggerTwo" 
biggerTwo(1, 2) (3, 4) #.SequenceEqual({ 3, 4)
biggerTwo(3, 4) (1, 2) #.SequenceEqual({ 3, 4)
biggerTwo(1, 1) (1, 2) #.SequenceEqual({ 1, 2)

<#
"biggerTwoLinq" 
biggerTwoLinq(1, 2 ) (3, 4 ) #.SequenceEqual(3, 4 )
biggerTwoLinq(3, 4 ) (1, 2 ) #.SequenceEqual(3, 4 )
biggerTwoLinq(1, 1 ) (1, 2 ) #.SequenceEqual(1, 2 )
#>
"makeMiddle" 
makeMiddle(1, 2, 3, 4) #.SequenceEqual({ 2, 3)
makeMiddle(7, 1, 2, 3, 4, 9) #.SequenceEqual({ 2, 3)
makeMiddle(1, 2) #.SequenceEqual(1, 2)

"plusTwo" 
plusTwo(1, 2) (3, 4) #.SequenceEqual(1, 2, 3, 4)
plusTwo(4, 4) (2, 2) #.SequenceEqual(4, 4, 2, 2)
plusTwo(9, 2) (3, 4) #.SequenceEqual(9, 2, 3, 4)

"plusTwoList" 
plusTwoList(1, 2 ) (3, 4 ) #.SequenceEqual(1, 2, 3, 4 )
plusTwoList(4, 4 ) (2, 2 ) #.SequenceEqual(4, 4, 2, 2 )
plusTwoList(9, 2 ) (3, 4 ) #.SequenceEqual(9, 2, 3, 4 )

"swapEnds" 
swapEnds(1, 2, 3, 4) #.SequenceEqual(4, 2, 3, 1)
swapEnds(1, 2, 3) #.SequenceEqual(3, 2, 1)
swapEnds(8, 6, 7, 9, 5) #.SequenceEqual(5, 6, 7, 9, 8)

"midN" 
midThree(1, 2, 3, 4, 5) #.SequenceEqual(2, 3, 4)
midThree(8, 6, 7, 5, 3, 0, 9) #.SequenceEqual(7, 5, 3)
midThree(1, 2, 3) #.SequenceEqual(1, 2, 3)

"midN" 
midThree(1, 2, 3, 4, 5 ) #.SequenceEqual(2, 3, 4 )
midThree(8, 6, 7, 5, 3, 0, 9 ) #.SequenceEqual(7, 5, 3 )
midThree(1, 2, 3 ) #.SequenceEqual(1, 2, 3 )


"maxTriple" 
maxTriple(1, 2, 3) -eq 3
maxTriple(1, 5, 3) -eq 5
maxTriple(5, 2, 3) -eq 5

"$front2" 
$front2(1, 2, 3) #.SequenceEqual(1, 2)
$front2(1, 2) #.SequenceEqual(1, 2)
$front2(1 ) #.SequenceEqual(1 )

"$frontN" 
$frontN(1, 2, 3 , 2) #.SequenceEqual(1, 2 )
$frontN(1, 2 , 2) #.SequenceEqual(1, 2 )
$frontN(1 , 2) #.SequenceEqual(1 )
<#
"$frontNLinq" 
$frontNLinq(1, 2, 3 , 2) #.SequenceEqual(1, 2 )
$frontNLinq(1, 2 , 2) #.SequenceEqual(1, 2 )
$frontNLinq(1 , 2) #.SequenceEqual(1 )
#>
"unlucky1" 
unlucky1(1, 3, 4, 5) -eq $true 
unlucky1(2, 1, 3, 4, 5) -eq $true 
unlucky1(1, 1, 1) -eq $false 

"makeN" 
make2(4, 5) (1, 2, 3) #.SequenceEqual(4, 5)
make2(4) (1, 2, 3) #.SequenceEqual(4, 1)
make2 @() (1, 2) #.SequenceEqual(1, 2)

"$front11" 
$front11(1, 2, 3) (7, 9, 8) #.SequenceEqual(1, 7)
$front11(1 ) (2 ) #.SequenceEqual(1, 2)
$front11(1, 7) @() #.SequenceEqual(1 )

"$front11List" 
$front11List(1, 2, 3 ) (7, 9, 8 ) #.SequenceEqual(1, 7 )
$front11List(1 ) (2 ) #.SequenceEqual(1, 2 )
$front11List(1, 7 ) @() #.SequenceEqual(1 )
