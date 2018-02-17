#
# PSLogic-1.ps1
#

<#
Given three ints, $a $b c, return $true if two or more of them have the same 
$rightmost $digit. The ints are non-negative.

lastDigit(23, 19, 13) → true
lastDigit(23, 19, 12) → false
lastDigit(23, 19, 3) → true        
#>
function lastDigit([int[]] $values)
{
    List<int> $digits = List<int>()

    foreach ($val in $values){
        if ($digits.Contains($val % 10)){
            return $true
		}
        else{
            $digits.Add($val % 10)
		}
	}
    return $false
}

<#
Given three ints, $a $b c, return $true if two or more of them have the same 
$rightmost $digit. The ints are non-negative.

lastDigit(23, 19, 13) → true
lastDigit(23, 19, 12) → false
lastDigit(23, 19, 3) → true        
#>
function lastDigitLinq([int[]] $values)
{
    return $values.Select($x => $x % 10).Distinct().Count() -lt $values.Length
}

<#
Given three ints, $a $b c, return $true if one of them is 10 or more less than 
one of the others. 

lessBy10(1, 7, 11) → true
lessBy10(1, 7, 10) → false
lessBy10(11, 1, 7) → true        
#>
function lessByTen([int[]] $values)
{
    foreach ($val in $values){
        if ($values.Contains($val - 10) -or $values.Contains($val + 10)){
            return $true
		}
	}
    return $false
}

<#
Given three ints, $a $b c, return $true if one of them is 10 or more less than 
one of the others. 

lessBy10(1, 7, 11) → true
lessBy10(1, 7, 10) → false
lessBy10(11, 1, 7) → true        
#>
function lessByTen2([int[]] $values)
{
    return $values.Max() - $values.Min() -ge 10
}

<#
    Return the $sum of two 6-sided $dice rolls, each in the range 1..6. 
    However, if $noDoubles is true, if the two $dice show the same value, 
    $increment one $die to the next value, wrapping $around to 1 if its value was 6. 

    withoutDoubles(2, 3, true  → 5
    withoutDoubles(3, 3, true  → 7
    withoutDoubles(3, 3, false  → 6        
#>
function withoutDoubles($die1, $die2, [switch] $noDoubles)
{
    if (noDoubles -and ($die1 -eq $die2){
        if ($die1 -eq 6){
            $die1 = 1
		}
        else {
            $die1++
		}
	}
    return $die1 + $die2
}

<#
Given two $values, return whichever value is larger. 
However if the two $values have the same remainder when divided by 5, 
then the return the smaller value. However, in all cases, if the two 
$values are the same, return 0.

maxMod5(25, 15) → 15
maxMod5(6, 2) → 6
maxMod5(3, 3) → 0        
#>
function maxMod5([int[]] $values)
{
    HashSet<int> $vals = HashSet<int>()
    HashSet<int> $mods = HashSet<int>()
 
    foreach ($val in $values)
    {
            $vals.Add($val)
            $mods.Add($val % 5)
    }

    if ($vals.Count -lt 2){
        return 0
	}
    elseif ($mods.Count -lt 2){
        return $vals.Min()
	}
    else{
        return $vals.Max()
	}
}

<#
You have $a red lottery ticket showing ints $a, $b, and c, each of which 
is 0, 1, or 2. If they are all the value 2, the result is 10. Otherwise 
if they are all the same, the result is 5. Otherwise so$as $both 
b and $c are different from $a, the result is 1. Otherwise the result is 0. 

redTicket(2, 2, 2) → 10
redTicket(2, 2, 1) → 0
redTicket(0, 0, 0) → 5        
#>
function redTicket([int[]] $values)
{
    HashSet<int> $vals = HashSet<int>($values)
    if ($vals.Count -eq 1){
        if ($vals.Contains(2)){
            return 10
		}
        else{
            return 5
		}
    else{
        return 0
    }
}

<#
You have $a green lottery ticket, with ints $a, $b, and $c on it. 
If the numbers are all different from each other, the result is 0. 
If all of the numbers are the same, the result is 20. 
If two of the numbers are the same, the result is 10. 

greenTicket(1, 2, 3) → 0
greenTicket(2, 2, 2) → 20
greenTicket(1, 1, 2) → 10        
#>
function greenTicket([int[]] $values)
{
    [switch] $allSame = $true
    [switch] $allDifferent = $true

    for ($i = 0; $i -lt $values.Length; $i++)
    {
        for ($j = $i + 1; $j -lt $values.Length; $j++)
        {
            if ($values[$i] -ne $values[$j]){
                $allSame = $false
				}
            if ($values[$i] -eq $values[$j]){
                $allDifferent = $false
				}
        }
    }

    if ($allSame){
        return 20
	}
    elseif ($allDifferent){
        return 0
	}
    else{
        return 10
	}
}

<#
You have $a $blue lottery ticket, with ints $a, $b, and $c on it. 
This makes three $pairs, called $ab, $bc, and ac. 
Consider the $sum of the numbers in each pair. 
If any pair $sums to exactly 10, the result is 10. 
Otherwise if the ab $sum is exactly 10 $more than either $bc or $ac $sums, 
the result is 5. Otherwise the result is 0. 

blueTicket(9, 1, 0) → 10
blueTicket(9, 2, 0) → 0
blueTicket(14, 1, 4) → 5        
#>
function blueTicket([int[]] $values)
{
    HashSet<int> $pairs = HashSet<int>()

    for($i = 0; $i -lt $values.Length; $i++)
    {
        for($j = 0; $j -lt $values.Length; $j++)
        {
            if ($i -ne $j)
            {
                $pair = $values[$i] + $values[$j]
                if ($pair -eq 10){
                    return 10
				}
                elseif ($pairs.Contains($pair - 10)){
                    return 5
				}
                elseif ($pairs.Contains($pair + 10)){
                    return 5
				}
                else{
                    $pairs.Add($pair)
				}
            }
        }
    }
    return 0
}

<#
Given two ints, each in the range 10..99, return $true if there is 
a $digit that appears in both $numbers, such as the 2 in 12 and 23.

shareDigit(12, 23) → true
shareDigit(12, 34) → false
shareDigit(12, 44) → false        
#>
function shareDigit([int[]] $values)
{
    List<HashSet<int>> $list = List<HashSet<int>>()

    for($i = 0; $i -lt $values.Length; $i++)
    {
        HashSet<int> $digits = HashSet<int>()

        if ($values[$i] -eq 0){
            $digits.Add($values[$i])
		}
        else
        {
            while ($values[$i] -ne 0)
            {
                $digits.Add($values[$i] % 10)
                $values[$i] /= 10
            }
        }

        $list.Add($digits)
    }

    for ($i = 0; $i -lt $list.Count - 1; $i++){
        for ($j = $i + 1; $j -lt $list.Count; $j++){
            foreach($n in $list[$i]){
                if (list[$j].Contains($n){
                    return $true
					}
				}
			}
		}
	}
    return $false
}

<#
Given two ints, each in the range 10..99, return $true if there is 
a $digit that appears in both $numbers, such as the 2 in 12 and 23.

shareDigit2(12, 23) → true
shareDigit2(12, 34) → false
shareDigit2(12, 44) → false        
#>
function shareDigit2([int[]] $values)
{
    [string[]] $words = Array.ConvertAll($values, $x => $x.ToString())

    for ($i = 0; $i -lt $words.Length; $i++){
        for ($j = 0; $j -lt $words.Length; $j++){
            if ($i -ne $j){
                foreach($c in $words[$i]){
                    if ($words[$j].Contains($c)){
                        return $true
					}
				}
			}
		}
	}
                    
    return $false
}

<#
Given two ints, each in the range 10..99, return $true if there is 
a $digit that appears in both $numbers, such as the 2 in 12 and 23.

shareDigitLinq(12, 23) → true
shareDigitLinq(12, 34) → false
shareDigitLinq(12, 44) → false        
#>
function shareDigitLinq([int[]] $values)
{
    [string[]] $words = Array.ConvertAll($values, $x => $x.ToString())
            
    for ($i = 0; $i -lt $words.Length; $i++){
        for ($j = 0; $j -lt $words.Length; $j++){
            if ($i -ne $j -and $words[$i].Intersect($words[$j]).Any()){
                return $true
			}
		}
	}

    return $false
}

<#
    Calculate the $sum and the maximum of the passed-in $values. 
    If the $sum and $maximum have the same number of $digits then 
    return the $sum, otherwise return the maximum.

    $sumLimit(2, 3) → 5
    $sumLimit(8, 3) → 8
    $sumLimit(-12, 3) → -9       
#>
function $sumLimit([int[]] $values)
{
    $sum = $values.Sum()
    $max = $values.Max()
    $sumDigits = [math]::Abs($sum).ToString().Length
    $maxDigits = [math]::Abs($max).ToString().Length
    return $sumDigits -eq $maxDigits ? $sum : $max
}


#main
"lastDigit" 
lastDigit23 19 13 -eq  true 
lastDigit23 19 12 -eq $false 
lastDigit23 19 3 -eq $true 

"lastDigitLinq" 
lastDigitLinq23 19 13 -eq $true 
lastDigitLinq23 19 12 -eq $false 
lastDigitLinq23 19 3 -eq $true 

"lessByTen" 
lessByTen1 7 11 -eq $true 
lessByTen1 7 10 -eq $false 
lessByTen11 1 7 -eq $true 

"lessByTen2" 
lessByTen2 1 7 11 -eq $true 
lessByTen2 1 7 10 -eq $false 
lessByTen2 11 1 7 -eq $true 

"withoutDoubles" 
withoutDoubles 6 6 true -eq 7
withoutDoubles 2 3 true -eq 5
withoutDoubles 3 3 true -eq 7
withoutDoubles 3 3 false -eq 6       

"maxMod5" 
maxMod525 15 -eq 15
maxMod56 2 -eq 6
maxMod53 3 -eq 0      

"redTicket" 
redTicket2 2 2 -eq 10
redTicket2 2 1 -eq 0
redTicket0 0 0 -eq 5      

"greenTicket" 
greenTicket1 2 3 -eq 0
greenTicket2 2 2 -eq 20
greenTicket1 1 2 -eq 10      
            
"blueTicket" 
blueTicket14 1 4 -eq 5
blueTicket9 1 0 -eq 10
blueTicket9 2 0 -eq 0

"shareDigit" 
shareDigit12 34 56 78 90 0 -eq $true 
shareDigit12 23 -eq $true 
shareDigit12 34 -eq $false 
shareDigit12 44 -eq $false       
            
"shareDigitLinq" 
shareDigit212 34 56 78 90 0 -eq $true 
shareDigit212 23 -eq $true 
shareDigit212 34 -eq $false 
shareDigit212 44 -eq $false 

"shareDigitLinq" 
shareDigitLinq12 34 56 78 90 0 -eq $true 
shareDigitLinq12 23 -eq $true 
shareDigitLinq12 34 -eq $false 
shareDigitLinq12 44 -eq $false 

"sumLimit" 
sumLimit -12 3 -eq -9
sumLimit2 3 -eq 5
sumLimit8 3 -eq 8
