#PSAP-1
           
<#
Given an array of scores, return $true if each score is equal or greater than the one before. 
The array will be length 2 or more. 

scoresIncreasing({1, 3, 4) → true
scoresIncreasing({1, 3, 2) → false
scoresIncreasing({1, 1, 4) → true
#>

function scoresIncreasing([int[]] $scores)
{
	for ($i = 1; $i -lt $scores.length; $i++){
		if ($scores[$i] -lt $scores[$i - 1]){
			return $false
		}
	}
	return $true
}


<#
Given an array of scores, return $true if there are scores of 100 next to each other in the array. 
The array length will be at least 2. 

scores100({1, 100, 100) → true
scores100({1, 100, 99, 100) → false
scores100({100, 1, 100, 100) → true
#>
function scores100([int[]] $scores)
{
	for ($i = 1; $i -lt $scores.Length; $i++){
		if ($scores[$i] -eq 100 -and $scores[$i - 1] -eq 100){
			return $true
		}
	}
	return $false
}

<#
Given a sorted array, return $true if the array contains 3 adjacent scores 
that differ from each other by at most 2, such as with {3, 4, 5} or {3, 5, 5}. 

scoresClump({3, 4, 5) → true
scoresClump({3, 4, 6) → false
scoresClump({1, 3, 5, 5) → true
#>
function scoresClump([int[]] $scores)
{
	for ($i = 1; $i -lt $scores.Length - 1; $i++){
		if ([math]::abs($scores[$i - 1] - $scores[$i + 1]) -le 2){
			return $true
		}
	}
	return $false
}

<#
Given an unsorted array, return $true if the array contains 3 adjacent scores 
that differ from each other by at most 2, such as with {3, 4, 5} or {3, 5, 5}. 

scoresClump({3, 4, 5) → true
scoresClump({3, 4, 6) → false
scoresClump({1, 3, 5, 5) → true
#>
function scoresClump2([int[]] $scores)
{
	for ($i = 1; $i -lt $scores.Length-1; $i++){
		if ([math]::abs($scores[$i-1] - $scores[$i+1]) -le 2 -and [math]::abs($scores[$i] - $scores[$i-1]) -le 2 -and [math]::abs($scores[$i] - $scores[$i+1]) -le 2){
			return $true
		}
	}
	return $false
}

<#
Given an array of scores, compute the $average of the first half and the second half, and return 
whichever is larger. We will say that the second half begins at index $length/2. The array length will 
be at least 2. Normally you would compute $averages with doubles, but here we use ints so the expected 
results are exact. 

scoresAverage({2, 2, 4, 4) → 4
scoresAverage({4, 4, 4, 2, 2, 2) → 4
scoresAverage({3, 4, 5, 1, 2, 3) → 4
#>
function scoresAverage([int[]] $scores)
{
	$leftCount = 0
	$rightCount = 0
	$leftSum = 0
	$rightSum = 0

	for($i = 0; $i -lt $scores.Length; $i++)
	{
		if ($i -lt $scores.Length / 2)
		{
			$leftCount++
			$leftSum += $scores[$i]
		}
		else
		{
			$rightCount++
			$rightSum += $scores[$i]
		}
	}

	return [math]::Max($leftSum / $leftCount, $rightSum / $rightCount)
}

<#
Given an array of strings, return the count of the number of strings with the given length. 

wordsCount({"a", "bb", "b", "ccc", 1) → 2
wordsCount({"a", "bb", "b", "ccc", 3) → 1
wordsCount({"a", "bb", "b", "ccc", 4) → 0
#>
function wordsCount([string[]] $words, $len)
{
	$count = 0

	foreach ($word in $words){
		if ($word.Length -eq $len){
			$count++
		}
	}
	return $count
}

<#
Given an array of strings, return an array containing the first N strings. 
N will be in the range 1..length.

wordsFront({"a", "b", "c", "d", 1) → {"a"}
wordsFront({"a", "b", "c", "d", 2) → {"a", "b"}
wordsFront({"a", "b", "c", "d", 3) → {"a", "b", "c"}
#>
function wordsFront([string[]] $words, $n)
{
	$result = @("") * $n
	[array]::Copy($words, $result, $n)
	return $result
}

<#
Given an array of strings, return $a List (e.g. an ArrayList) where all the strings of the 
given length are omitted. 

wordsWithoutList({"a", "bb", "b", "ccc", 1) → {"bb", "ccc"}
wordsWithoutList({"a", "bb", "b", "ccc", 3) → {"a", "bb", "b"}
wordsWithoutList({"a", "bb", "b", "ccc", 4) → {"a", "bb", "b", "ccc"}
#>
function wordsWithoutList([string[]] $words, $len)
{
	$result = @()

	foreach ($word in $words)
	{
		if ($word.Length -ne $len){
			$result += $word
		}
	}

	return $result
}

<#
Given an $n, return $true if it contains a 1 $digit. Use Linq. Do not use loops.
hasOneLinq(10) → true
hasOneLinq(22) → false
hasOneLinq(220) → false
#>
function hasOneLinq($n)
{
	return $n.ToString().Contains("1")
}

<#
Given an $n, return $true if it contains a 1 $digit. Use a loop.
hasOne(10) → true
hasOne(22) → false
hasOne(220) → false
#>
function hasOne($n)
{
	$num = [math]::abs($n)

	while ($num -gt 0)
	{
		$digit = $num % 10

		if ($digit -eq 1){
			return $true
		}
		
		$num /= 10
	}

	return $false
}

<#
We will say that a positive divides itself if every $digit in the number divides into the 
number evenly. So for example 128 divides itself since 1, 2, and 8 all divide into 128 evenly. 
We will say that 0 does not divide into anything evenly, so no number with a 0 $digit divides itself. 

dividesSelf(128) → true
dividesSelf(12) → true
dividesSelf(120) → false
#>
function dividesSelf($n)
{
	if ($n -eq 0){
		return $false
	}

	$num = [math]::abs($n)

	while ($num -gt 0)
	{
		$digit = $n % 10

		if ($digit -eq 0){
			return $false
		}
		elseif ($n % $digit -ne 0){
			return $false
		}
		$num /= 10
	}

	return $true
}

<#
Given an array of positive ints, return an array of length "$count" containing the first even 
numbers from the original array. The original array will contain at least "$count" even numbers. 

copyEvens({3, 2, 4, 5, 8, 2) → {2, 4}
copyEvens({3, 2, 4, 5, 8, 3) → {2, 4, 8}
copyEvens({6, 1, 2, 4, 5, 8, 3) → {6, 2, 4}
#>
function copyEvens([int[]] $nums, $count)
{
	$result = @(0) * $count
	$rpos = 0
	$npos = 0

	while ($rpos -lt $count)
	{
		if ($nums[$npos] % 2 -eq 0)
		{
			$result[$rpos] = $nums[$npos]
			$rpos++
		}

		$npos++
	}

	return $result
}

<#
We will say that a positive $n is "endy" if it is in the range 0..10 or 90..100 ($inclusive). 
Given an array of positive ints, return an array of length "$count" containing the first endy 
numbers from the original array. 

copyEndy({9, 11, 90, 22, 6, 2) → {9, 90}
copyEndy({9, 11, 90, 22, 6, 3) → {9, 90, 6}
copyEndy({12, 1, 1, 13, 0, 20, 2) → {1, 1}
#>
function copyEndy([int[]] $nums, $count)
{
	[int[]] $result = @(0) * $count
	$rpos = 0
	$npos = 0

	while ($rpos -lt $count)
	{
		if (($nums[$npos] -ge 0 -and $nums[$npos] -le 10) -or ($nums[$npos] -ge 90 -and $nums[$npos] -le 100))
		{
			$result[$rpos] = $nums[$npos]
			$rpos++
		}

		$npos++
	}

	return $result
}

<#
Given 2 arrays that are the same length containing strings, compare the 1st [string] in one 
array to the 1st [string] in the other array, the 2nd to the 2nd and so on. Count the number 
of times that the 2 strings are non-empty and $start with the same char. The strings may be 
any length, including 0. 

matchUp({"aa", "bb", "cc", {"aaa", "xx", "bb") → 1
matchUp({"aa", "bb", "cc", {"aaa", "b", "bb") → 2
matchUp({"aa", "bb", "cc", {"", "", "ccc") → 1
#>
function matchUp([string[]] $a, [string[]] $b)
{
	$count = 0
	$len = [math]::Min($a.Length, $b.Length)

	for ($i = 0; $i -lt $len; $i++)
	{
		if (![string]::IsNullOrEmpty($a[$i]) -and ![string]::IsNullOrEmpty($b[$i])){
			if ($a[$i][0] -eq $b[$i][0]){
				$count++
			}
		}
	}

	return $count
}

<#
The "key" $array is an array containing the correct answers to an exam, like {"a", "a", "b", "b"}. 
The "answers" $array contains a student's answers, with "?" representing $a question left blank. 
The two arrays are not empty and are the same length. Return the score for this array of answers, 
giving +4 for each correct $answer, -1 for each incorrect $answer, and +0 for each blank $answer. 

scoreUp({"a", "a", "b", "b", {"a", "c", "b", "c") → 6
scoreUp({"a", "a", "b", "b", {"a", "a", "b", "c") → 11
scoreUp({"a", "a", "b", "b", {"a", "a", "b", "b") → 16
#>
function scoreUp([string[]] $key, [string[]] $answers)
{
	$score = 0
	for ($i = 0; $i -lt [math]::Min($key.Length, $answers.Length); $i++)
	{
		if (![string]::IsNullOrEmpty($key[$i]) -and ![string]::IsNullOrEmpty($answers[$i])){
			if ($key[$i] -eq $answers[$i]){ $score += 4 }
			elseif ($answers[$i] -ne "?"){ $score -= 1 }
		}
	}
	return $score
}

<#
Given an array of strings, return an array without the strings that are equal to the target string.

wordsWithout({"a", "b", "c", "a", "a"  → {"b", "c"}
wordsWithout({"a", "b", "c", "a", "b"  → {"a", "c", "a"}
wordsWithout({"a", "b", "c", "a", "c"  → {"a", "b", "a"}
#>
function wordsWithout([string[]] $words, [string] $target)
{
	$result = New-Object "System.Collections.Generic.List[String]"

	foreach ($word in $words)
	{
		if ($word -ne $target)
		{
			$result.Add($word) # if using array instead of list then add item with += $instead of .Add
		}
	}

	return $result
}

<#
Given two arrays, A and B, of non-negative $scores. A "special" $score is one which is a 
multiple of 10, such as 40 or 90. Return the $sum of largest special score in A and the largest 
special score in B. 

scoresSpecial({12, 10, 4, {2, 20, 30) → 40
scoresSpecial({20, 10, 4, {2, 20, 10) → 40
scoresSpecial({12, 11, 4, {2, 20, 31) → 20
#>
function scoresSpecial([int[]] $a, [int[]] $b)
{
	$aMod10Max = 0
	$bMod10Max = 0

	foreach ($num in $a){
		if ($num % 10 -eq 0 -and $num -gt $aMod10Max){
			$aMod10Max = $num
		}
	}
	foreach ($num in $b){
		if ($num % 10 -eq 0 -and $num -gt $bMod10Max){
			$bMod10Max = $num
		}
	}
	return $aMod10Max + $bMod10Max
}

<#
We have an array of heights, representing the altitude $along $a walking trail. Given $start/$end 
indexes into the array, return the $sum of the changes for $a walk $beginning at the start $index 
and $ending at the end $index. For example, with the heights {5, 3, 6, 7, 2} and $start=2, $end=4 
yields $a $sum of 1 + 5 = 6. The $start $end $end $index will $both be valid indexes into the array 
with $start -le $end. 

$sumHeights({5, 3, 6, 7, 2, 2, 4) → 6
$sumHeights({5, 3, 6, 7, 2, 0, 1) → 2
$sumHeights({5, 3, 6, 7, 2, 0, 4) → 11
#>
function $sumHeights([int[]] $heights, $start, $end)
{
	$sum = 0

	for ($i = $start; $i -lt $end; $i++){
		$sum += [math]::abs($heights[$i] - $heights[$i + 1])
	}
	return $sum
}

<#
(A variation on the $sumHeights problem.) We have an array of heights, representing the altitude 
along $a walking trail. Given $start/$end indexes into the array, return the $sum of the changes 
for $a walk $beginning at the start $index and $ending at the end $index, however increases in height 
$count double. For example, with the heights {5, 3, 6, 7, 2} and $start=2, $end=4 yields $a $sum 
of 1*2 + 5 = 7. The $start $end $end $index will $both be valid indexes into the array with $start -le $end. 

$sumHeights2({5, 3, 6, 7, 2, 2, 4) → 7
$sumHeights2({5, 3, 6, 7, 2, 0, 1) → 2
$sumHeights2({5, 3, 6, 7, 2, 0, 4) → 15
#>
function $sumHeights2([int[]] $heights, $start, $end)
{
	$sum = 0
	for($i = $start; $i -lt $end; $i++)
	{
		if ($heights[$i + 1] -gt $heights[$i]){
			$sum += 2 * ($heights[$i + 1] - $heights[$i])
		}
		else{
			$sum += $heights[$i] - $heights[$i + 1]
		}
	}
	return $sum
}

<#
(A variation on the $sumHeights problem.) We have an array of heights, representing the altitude 
along $a walking trail. Given $start/$end indexes into the array, return the number of "big" steps 
for $a walk starting at the start $index and $ending at the end $index. We will say that step is big 
if it is 5 or more up or down. The $start $end $end $index will $both be valid indexes into the array 
with $start -le $end. 

bigHeights({5, 3, 6, 7, 2, 2, 4) → 1
bigHeights({5, 3, 6, 7, 2, 0, 1) → 0
bigHeights({5, 3, 6, 7, 2, 0, 4) → 1
#>
function bigHeights([int[]] $heights, $start, $end)
{
	$count = 0

	for ($i = $start; $i -lt $end; $i++){
		if ([math]::abs($heights[$i + 1] - $heights[$i]) -ge 5){
			$count++
		}
	}

	return $count
}

<#
We have data for two users, A and B, each with a String $name and an $id. The goal is to order 
the users such as for sorting. Return -1 if A comes before B, 1 if A comes after B, and 0 if they 
are the same. Order first by the names, and then by the id numbers if the names are the same. 
        
userCompare "bb", 1, "zz", 2) → -1
userCompare "bb", 1, "aa", 2) → 1
userCompare "bb", 1, "bb", 1) → 0
#>
function userCompare([string] $aName, $aId, [string] $bName, $bId)
{
	if ($aName.CompareTo($bName) -lt 0){
		return -1
	}
	elseif ($aName.CompareTo($bName) -gt 0){
		return 1
	}
	elseif ($aId.CompareTo($bId) -lt 0){
		return -1
	}
	elseif ($aId.CompareTo($bId) -gt 0){
		return 1
	}
	else{
		return 0
	}
}

<#
Start with two arrays of strings, A and B, each with its elements in alphabetical order and 
without duplicates. Return an array containing the first N elements from the two arrays. 
The result array should be in alphabetical order and without duplicates. A and B will both 
have a length which is N or more. The best "linear" solution makes a single pass over A and B, 
taking advantage of the fact that they are in alphabetical order, copying elements directly 
to the array. 

mergeTwo({"a", "c", "z", {"b", "f", "z", 3) → {"a", "b", "c"}
mergeTwo({"a", "c", "z", {"c", "f", "z", 3) → {"a", "c", "f"}
mergeTwo({"f", "g", "z", {"c", "f", "g", 3) → {"c", "f", "g"}
#>
function mergeTwo([string[]] $a, [string[]] $b, $n)
{
	$c = @()
	$c = $a + $b | Sort-Object | Get-Unique | select -First $n
	return $c -join ' ' # remove join when you want to use -eq
}

<#
Start with two arrays of strings, $a and $b, each in alphabetical order, possibly with duplicates. 
Return the count of the number of strings which appear in both arrays. The best "linear" solution 
makes a single pass over $both arrays, taking advantage of the fact that they are in alphabetical 
order. 

commonTwo({"a", "c", "c", "x", {"b", "c", "d", "x") → 2
commonTwo({"a", "c", "x", {"a", "b", "c", "x", "z") → 3
commonTwo({"a", "b", "c", {"a", "b", "c") → 3
#>
function commonTwo([string[]] $a, [string[]] $b)
{
	$a1 = $a | Get-Unique
	$b1 = $b | Get-Unique
	$count = 0

	foreach($item in $a1){
		if ($b1 -contains $item){
			$count += 1
		}
	}
	return $count
}

#main

"scoresIncreasing"
scoresIncreasing (1, 3, 4) #-eq $true
scoresIncreasing (1, 3, 2 ) #-eq $false
scoresIncreasing (1, 1, 4 ) #-eq $true

"scores100"
scores100 (1, 100, 100 ) #-eq $true
scores100 (1, 100, 99, 100 ) #-eq $false
scores100 (100, 1, 100, 100 ) #-eq $true

"scoresClump"
scoresClump (3, 4, 5 ) #-eq $true
scoresClump (3, 4, 6 ) #-eq $false
scoresClump (1, 3, 5, 5 ) #-eq $true

"scoresClump2"
scoresClump2 (4, 3, 5 ) #-eq $true
scoresClump2 (4, 3, 6 ) #-eq $false
scoresClump2 (5, 3, 5, 1 ) #-eq $true

"scoresAverage"
scoresAverage (2, 2, 4, 4 ) #-eq 4
scoresAverage (4, 4, 4, 2, 2, 2 ) #-eq 4
scoresAverage (3, 4, 5, 1, 2, 3 ) #-eq 4

"wordsCount"
wordsCount ("a", "bb", "b", "ccc") 1 #-eq 2
wordsCount ("a", "bb", "b", "ccc") 3 #-eq 1
wordsCount ("a", "bb", "b", "ccc") 4 #-eq 0

"wordsFront"
wordsFront ("a", "b", "c", "d") 1 #.SequenceEqual ("a" )
wordsFront ("a", "b", "c", "d") 2 #.SequenceEqual ("a", "b" )
wordsFront ("a", "b", "c", "d") 3 #.SequenceEqual ("a", "b", "c" )

"wordsWithoutList"
wordsWithoutList ("a", "bb", "b", "ccc" ) 1 #.SequenceEqual ("bb", "ccc" )
wordsWithoutList ("a", "bb", "b", "ccc" ) 3 #.SequenceEqual "a", "bb", "b" )
wordsWithoutList ("a", "bb", "b", "ccc" ) 4 #.SequenceEqual "a", "bb", "b", "ccc" )

"hasOne"
hasOne(10) #-eq $true
hasOne(22) #-eq $false
hasOne(220) #-eq $false
            
"dividesSelf"
dividesSelf(128) #-eq $true
dividesSelf(12) #-eq $true
dividesSelf(120) #-eq $false
            
"copyEvens"
copyEvens (3, 2, 4, 5, 8) 2 #.SequenceEqual (2, 4 )
copyEvens (3, 2, 4, 5, 8) 3 #.SequenceEqual (2, 4, 8 )
copyEvens (6, 1, 2, 4, 5, 8) 3 #.SequenceEqual (6, 2, 4 )
            
"copyEndy"
copyEndy (9, 11, 90, 22, 6) 2 #.SequenceEqual (9, 90 )
copyEndy (9, 11, 90, 22, 6) 3 #.SequenceEqual (9, 90, 6 )
copyEndy (12, 1, 1, 13, 0, 20) 2 #.SequenceEqual (1, 1 )
            
"matchUp"
matchUp ("aa", "bb", "cc" ) ("aaa", "xx", "bb" ) #-eq 1
matchUp ("aa", "bb", "cc" ) ("aaa", "b", "bb" ) #-eq 2
matchUp ("aa", "bb", "cc" ) ("", "", "ccc" ) #-eq 1
           
"scoreUp"
scoreUp ("a", "a", "b", "b" ) ("a", "c", "b", "c" ) #-eq 6
scoreUp ("a", "a", "b", "b" ) ("a", "a", "b", "c" ) #-eq 11
scoreUp ("a", "a", "b", "b" ) ("a", "a", "b", "b" ) #-eq 16

"wordsWithout"
wordsWithout ("a", "b", "c", "a" ) "a" #.SequenceEqual([string[]] ("b", "c" )
wordsWithout ("a", "b", "c", "a" ) "b" #.SequenceEqual([string[]] ("a", "c", "a" )
wordsWithout ("a", "b", "c", "a" ) "c" #.SequenceEqual([string[]] ("a", "b", "a" )
         
"scoresSpecial"
scoresSpecial (12, 10, 4 ) (2, 20, 30 ) #-eq 40
scoresSpecial (20, 10, 4 ) (2, 20, 10 ) #-eq 40
scoresSpecial (12, 11, 4 ) (2, 20, 31 ) #-eq 20

"$sumHeights"
$sumHeights (5, 3, 6, 7, 2 , 2, 4) #-eq 6
$sumHeights (5, 3, 6, 7, 2 , 0, 1) #-eq 2
$sumHeights (5, 3, 6, 7, 2 , 0, 4) #-eq 11

"$sumHeights2"
$sumHeights2 (5, 3, 6, 7, 2) 2 4 #-eq 7
$sumHeights2 (5, 3, 6, 7, 2) 0 1 #-eq 2
$sumHeights2 (5, 3, 6, 7, 2) 0 4 #-eq 15
            
"bigHeights"
bigHeights_result = bigHeights (5, 3, 6, 7, 2) 2 4; bigHeights_result -eq 1
bigHeights_result = bigHeights (5, 3, 6, 7, 2) 0 1; bigHeights_result -eq 0
bigHeights_result = bigHeights (5, 3, 6, 7, 2) 0 4; bigHeights_result -eq 1

"userCompare"
$userCompare_result = userCompare "bb" 1 "zz" 2; $userCompare_result -eq -1
$userCompare_result = userCompare "bb" 1 "aa" 2; $userCompare_result -eq 1
$userCompare_result = userCompare "bb" 1 "bb" 1; $userCompare_result -eq 0
            
"mergeTwo"
mergeTwo ("a", "c", "z" ) ("b", "f", "z" ) 3  # -eq "a", "b", "c" 
mergeTwo ("a", "c", "z" ) ("c", "f", "z" ) 3  # -eq "a", "c", "f" 
mergeTwo ("f", "g", "z" ) ("c", "f", "g" ) 3  # -eq "c", "f", "g" 
         
"commonTwo"
$commonTwo_result = commonTwo ("a", "c", "c", "x" ) ("b", "c", "d", "x" ); $commonTwo_result -eq 2
$commonTwo_result = commonTwo ("a", "c", "x" ) ("a", "b", "c", "x", "z" ); $commonTwo_result -eq 3
$commonTwo_result = commonTwo ("a", "b", "c" ) ("a", "b", "c" ); $commonTwo_result -eq 3
