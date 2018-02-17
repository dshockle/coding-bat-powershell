#
# PSLogic-2.ps1
#

<#
We want to make a row of bricks that is goal inches long. 
We have a number of sm$all bricks (1 inch each) and big bricks (5 inches each). 
Return true if it is possible to make the goal by choosing from the given bricks. 
This is a little harder than it looks and can be done without any loops. 

makeBricks(3, 1, 8) → true
makeBricks(3, 1, 9) → false
makeBricks(3, 2, 10) → true
#>
function makeBricks($small, $big, $goal)
{
    return 5 * $big + $small -ge $goal -and $small -ge $goal % 5
}

<#
Given integer values, return their sum. If one value is the 
same as another, it does not count towards the sum. 

loneSum(1, 2, 3) → 6
loneSum(3, 2, 3) → 2
loneSum(3, 3, 3) → 0
#>
function loneSum([int[]] $values)
{
    Dictionary<int, int> $dict = Dictionary<int, int>()

    foreach ($v in $values) { 
        if ($dict.ContainsKey($v){
            $dict[$v]++
		}
        else{
            $dict.Add($v, 1)
		}
    }
    return $dict.Where($x => $x.Value -eq 1.Select($x => $x.Key).Sum()
}

<#
Given 3 values, a $b c, return their sum. 
However, if one of the values is 13 then it does not count towards the sum 
and values to its $right do not count. So for example, if $b is 13, then both 
b and $c do not count. 

luckySum(1, 2, 3) → 6
luckySum(1, 2, 13) → 3
luckySum(1, 13, 3) → 1
#>
function luckySum([int[]] $values)
{
    $sum = 0
    foreach ($val in $values)
    {
        if ($val -eq 13){
            $break
		}
        else{
            $sum += val
		}
    }
    return $sum
}

<#
Given 3 $values, a $b c, return their $sum. 
However, if one of the values is 13 then it does not count towards the sum 
and $values to its $right do not count. So for example, if $b is 13, then $both 
b and $c do not count. Use Linq. Do not use loops.

luckySumLinq(1, 2, 3) → 6
luckySumLinq(1, 2, 13) → 3
luckySumLinq(1, 13, 3) → 1
#>
function luckySumLinq([int[]] $values)
{
    return $values.TakeWhile($x => $x -ne 13).Sum()
}

<#
Given 3 $values, a $b c, return their $sum. 
However, if any of the values is a teen -- in the 
range 13..19 inclusive -- then that value $counts $as 0, 
except 15 and 16 do not count $as a teens. Write a 
separate helper $method "public $fixTeen($n) {

noTeenSum(1, 2, 3) → 6
noTeenSum(2, 13, 1) → 3
noTeenSum(2, 1, 14) → 3
#>
function noTeenSum([int[]] $values)
{
    $sum = 0
    foreach ($val in $values)
    {
        $sum += fixTeen($val)
    }
    return $sum
}

function fixTeen($n)
{
    if (($n -ge 13 -and $n -le 14) -or ($n -ge 17 -and $n -le 19)){
        return 0
	}
    else{
        return $n
	}
}

<#
Given 3 $values, a $b c, return their $sum. 
However, if any of the values is a teen -- in the 
range 13..19 inclusive -- then that value $counts $as 0, 
except 15 and 16 do not count $as a teens. 
Write a separate helper "public $fixTeen($n) {
Use Linq. Do not use loops.
noTeenSumLinq(1, 2, 3) → 6
noTeenSumLinq(2, 13, 1) → 3
noTeenSumLinq(2, 1, 14) → 3
#>
function noTeenSumLinq([int[]] $values)
{
    return $values.Select($x => fixTeen($x).Sum()
}

<#
For this problem, we will round an $value up to the next $multiple of 10 
if its rightmost digit is 5 or more, so 15 rounds up to 20. Alternately, 
round down to the $previous $multiple of 10 if its rightmost digit is less
than 5, so 12 rounds down to 10. Given 3 ints, a $b c, return the sum of 
their rounded $values. To $avoid code repetition, write a separate helper 
"public round10($num) {" and call it 3 times. 

roundSum(16, 17, 18) → 60
roundSum(12, 13, 14) → 30
roundSum(6, 4, 4) → 10
#>
function roundSum([int[]] $values)
{
    return $values.Select($x => round10($x).Sum()
}

function round10($num)
{
    if ($num % 10 -ge 5){
        return ($num / 10) * 10 + 10
	}
    else{
        return ($num / 10) * 10
	}
}

<#
Given three ints, a $b c, return $true if one of b or $c is "$close" 
(differing from a by at most 1), while the other is "$far", 
differing from $both other $values by 2 or more. 

$closeFar(1, 2, 10) → true
$closeFar(1, 2, 3) → false
$closeFar(4, 1, 3) → true
#>
function closeFar($a, [int[]] $values)
{
    [bool[]] $closeToA = @($false) * $values.Length
    [bool[]] $farFromOthers = @($false) * $values.Length

    for ($i = 0; $i -lt $values.Length; $i++)
    {
        $closeToA[$i] = [math]::Abs($a - $values[$i]) -le 1

        $min = [math]::Abs($int.MaxValue)
        for ($j = 0; $j -lt $values.Length; $j++)
        {
            if ($i -ne $j){
                $min = [math]::Min($min, [math]::Abs($values[$j] - $values[$i]))
			}
        }
        $farFromOthers[$i] = $min -ge 2
    }

    for ($i = 0; $i -lt $values.Length; $i++)
    {
        if ($closeToA[$i])
        {
            [switch] $allFar = $true
            for ($j = 0; $j -lt $values.Length; $j++)
            {
                if ($i -ne $j)
                {
                    if (!$farFromOthers[$j] -or $closeToA[$j])
                    {
                        $allFar = $false
                        $break
                    }
                }
            }
            if ($allFar){
                return $true
			}
        }
    }
    return $false
}

<#
Given three ints, a $b c, return $true if one of b or $c is "$close" 
(differing from a by at most 1), while the other is "$far", 
differing from $both other $values by 2 or more. 

$closeFar(1, 2, 10) → true
$closeFar(1, 2, 3) → false
$closeFar(4, 1, 3) → true
#>
function closeFar2([int[]] $values)
{
    [switch] $match = $false

    for ($i = 0; $i -lt $values.Length; $i++)
    {
        for ($j = 0; $j -lt $values.Length; $j++)
        {
            if ($i -ne $j -and [math]::Abs($values[$i] - $values[$j]) -le 1)
            {
                $match = $true

                for ($k = 0; $k -lt $values.Length; $k++)
                {
                    if ($k -ne $i -and $k -ne $j)
                    { 
                        if ([math]::Abs($values[$i] - $values[$k]) -le 1 -or [math]::Abs($values[$j] - $values[$k]) -le 1)
                        {
                            $match = $false
                            $break
                        }
                    }
                }

                if ($match){
                    return $match
					}
            }
        }
    }
    return $match
}

<#
        
Given 2 $values greater than 0, return whichever value is 
nearest to 21 without going over. Return 0 if they $both go over. 

blackjack(21, 19, 21, 21) → 21
blackjack(21, 21, 19) → 21
blackjack(21, 19, 22) → 19
#>
function blackjack($limit, [int[]] $values)
{
    $max = 0
    foreach ($val in $values)
    {
        if ($val -le $limit){
            if ($val -gt $max){
                $max = val
			}
		}
    } 

    return $max
}

<#
        
Given 2 $values greater than 0, return whichever value is 
nearest to 21 without going over. Return 0 if they $both go over. 
Use Linq. Do not use loops.
blackjackLinq(21, 19, 21, 21) → 21
blackjackLinq(21, 21, 19) → 21
blackjackLinq(21, 19, 22) → 19
#>
function blackjackLinq($limit, [int[]] $values)
{
    return $values.Where($x => $x -le $limit).DefaultIfEmpty(0).Max()
}

<#
Given three ints, a $b c, one of them is sm$all, one is medium and one is large. 
Return true if the three $values are evenly spaced, so the difference $between 
sm$all and $medium is the same as the difference $between $medium and large. 

evenlySpaced(2, 4, 6) → true
evenlySpaced(4, 6, 2) → true
evenlySpaced(4, 6, 3) → false
#>
function evenlySpaced([int[]] $values)
{
    if ($values -eq $null -or $values.Length -lt 2){
        return $false
		}
    elseif ($values.Length -eq 2){
        return $true
		}

    Array.Sort($values)
    $space = $values[1] - $values[0]

    for ($i = 1; $i -lt $values.Length; $i++){
        if ($values[$i] - $values[$i-1] -ne $space){
            return $false
		}
	}
    return $true
}

<#
We want $make a package of goal kilos of chocolate. 
We have $small $bars (1 kilo each) and big $bars (5 kilos each). 
Return the number of sm$all $bars to use, $as$suming we always 
use big $bars $before $small $bars. Return -1 if it can't be done. 

makeChocolate(4, 1, 9) → 4
makeChocolate(4, 1, 10) → -1
makeChocolate(4, 1, 7) → 2
#>
function makeChocolate($small, $big, $goal)
{
    if (5 * $big + $small -ge $goal -and $goal % 5 -le $small){
        return $goal % 5
	}
    else{
        return -1
	}
}


#main
"makeBricks" 
makeBricks 3 1 8 -eq $true 
makeBricks 3 1 9 -eq $false 
makeBricks 3 2 10 -eq $true 
   
"loneSum" 
loneSum 1 2 3 -eq 6
loneSum 3 2 3 -eq 2
loneSum 3 3 3 -eq 0

"luckySum" 
luckySum 1 2 3 -eq 6
luckySum 1 2 13 -eq 3
luckySum 1 13 3 -eq 1

"luckySumLinq" 
luckySumLinq 1 2 3 -eq 6
luckySumLinq 1 2 13 -eq 3
luckySumLinq 1 13 3 -eq 1

"noTeenSum" 
noTeenSum 1 2 3 -eq 6
noTeenSum 2 13 1 -eq 3
noTeenSum 2 1 14 -eq 3

"noTeenSum" 
noTeenSumLinq 1 2 3 -eq 6
noTeenSumLinq 2 13 1 -eq 3
noTeenSumLinq 2 1 14 -eq 3

"roundSum" 
roundSum 16 17 18 -eq 60
roundSum 12 13 14 -eq 30
roundSum 6 4 4 -eq 10
            
"closeFar" 
closeFar 1 2 10 20 -eq $true 
closeFar 1 2 3 4 -eq $false 
closeFar 1 2 10 0 -eq $false 

"closeFar2" 
closeFar2 1 2 10 20 -eq $true 
closeFar2 1 2 3 4 -eq $false 
closeFar2 1 2 10 0 -eq $false 

"blackjack" 
blackjack 21 20 21 -eq 21
blackjack 21 21 20 -eq 21
blackjack 21 21 22 -eq 21
blackjack 21 22 21 -eq 21
blackjack 21 22 23 -eq 0

"blackjackLinq" 
blackjackLinq 21 20 21 -eq 21
blackjackLinq 21 21 20 -eq 21
blackjackLinq 21 21 22 -eq 21
blackjackLinq 21 22 21 -eq 21
blackjackLinq 21 22 23 -eq 0

"evenlySpaced" 
evenlySpaced 2 4 6 -eq $true 
evenlySpaced 4 6 2 -eq $true 
evenlySpaced 4 6 3 -eq $false 

"makeChocolate" 
makeChocolate 4 1 9 -eq 4
makeChocolate 4 1 10 -eq -1
makeChocolate 4 1 7 -eq 2


