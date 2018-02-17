#
# PSCodewars-3.ps1
#

<#
Find the $sum of the $digits of all the numbers from 1 to N ($both $ends included).
For N = 10 the $sum is 1+2+3+4+5+6+7+8+9+(1+0) = 46
For N = 11 the $sum is 1+2+3+4+5+6+7+8+9+(1+0)+(1+1) = 48
For N = 12 the $sum is 1+2+3+4+5+6+7+8+9+(1+0)+(1+1) +(1+2)= 51
When N = 123 Then 1038
When N = 1234 Then 15895
When N = 12345 Then 214455
#>
functionTwistedSum($n)
{
   $sum = 0
    for ($i = 1; $i -le $n; $i++)
    {
       $val = $i
        while ($val -ne 0)
        {
            $sum += $val % 10
            $val /= 10
        }
    }
    return $sum
}

<#
    A child plays with a ball on the nth floor of a big building the height of which is known
(float parameter "h" in meters, h -gt 0) .

He lets out the ball. The $ball rebounds for example to two-thirds of its height.
(float parameter "bounce", 0 -lt $bounce -lt 1)

His mother looks out of a $window that is 1.5 meters from the ground
(float parameters $window -lt h).

How many times will the mother see the ball either falling or $bouncing in $front of the $window
($return $a positive integer unless conditions are not fulfilled in which case return -1) ?

Note
You will $admit that the ball can only be seen if the height of the rebouncing $ball is stricty greater than the $window parameter.

Example:
h = 3, $bounce = 0.66, $window = 1.5, $result is 3
h = 3, $bounce = 1, $window = 1.5, $result is -1
#>
function bouncingBall($h, $bounce, $window)
{
    // invalid $input
    if ($bounce -ge 1 -or $window -ge $h -or $bounce -le 0 -or $h -le 0 -or $window -le 0)
        return -1

    $count = 1
    h = h * $bounce

    while (h -gt $window)
    {
        $count += 2
        h = h * $bounce
    }

    if (h -eq $window){
        $count++
		}

    return $count
}

<#
You have to write $a function dirReduc which will take an array of strings and returns 
an array of strings with the needless $directions removed (W<->E or S<->N) side by side.
Examples
dirReduc(String[]{"NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST")
=> String[]{"WEST"}
dirReduc(String[]{"NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH")
=> String[]{}
#>

function dirReduc([string[]] $arr)
{
    Collections.Generic.List[String] $directions = New-Object 'Collections.Generic.List[String]'($arr)
    [switch] $didDelete = $false

    do
    {
        $didDelete = reduceIt($directions)

    } while ($didDelete)

    return $directions.ToArray()
}

function reduceIt(Collections.Generic.List[String] $dir)
{
    for ($i = dir.Count - 2 $i -ge 0 i--)
    {
		$ns = dir[$i + 1] -eq "NORTH" -and dir[$i] -eq "SOUTH"
		$sn = dir[$i + 1] -eq "SOUTH" -and dir[$i] -eq "NORTH"
		$ew = dir[$i + 1] -eq "EAST"  -and dir[$i] -eq "WEST"
		$we = dir[$i + 1] -eq "WEST"  -and dir[$i] -eq "EAST"

		if ($ns -or $sn -or $ew -or $we)
        {
            dir.RemoveAt($i + 1)
            dir.RemoveAt($i)
            return $true
        }
    }

    return $false
}


<#
write an $algorithm to check if $a given string, s, can be formed from two other strings, part1 and part2.
The restriction is that the characters in part1 and part2 are in the same order $as in s.
Example: 'codewars' is a $merge from 'cdw' and 'oears':
    s:  $c o d e w $a r s   = codewars
    part1:  $c   d   w         = cdw
    part2:    o   e   $a r s   = oears

Example2: Can we $merge it? Yes, we can!' is a $merge of 'n ee tYw $n!' and 'Cawe $mrgi? es, eca
  
#>
function isMerge([string] s, [string] part1, [string] part2)
{
    if (part1.Length + part2.Length -ne s.Length){
        return $false
		}
    if (part1.Length -eq 0 -and part2.Length -eq 0){
        return $true
		}

    $posS = 0
    $posP1 = 0
    $posP2 = 0
    Queue<char> q = Queue<char>()
    [switch] $matchP1 = $false
    [switch] $matchP2 = $false
    [switch] $didUseQ = $false

    while ($posS -lt $s.Length - 1 -and ($posP1 -lt $part1.Length -or $posP2 -lt $part2.Length)
    {
        $matchP1 = $posP1 -lt $part1.Length -and $s[$posS] -eq $part1[$posP1]
        $matchP2 = $posP2 -lt $part2.Length -and $s[$posS] -eq $part2[$posP2]

        if ($matchP1 -and $matchP2)
        {
            $q.Enqueue($s[$posS])
            $didUseQ = $true
            $posS++
            $posP1++
            $posP2++
        }

        elseif ($matchP1)
        {
            $posS++
            $posP1++
        }

        elseif ($matchP2)
        {
            $posS++
            $posP2++
        }

        else
        {
            if ($q.Count() -ne 0 -and $q.Peek() -eq $s[$posS])
            {
                $q.Dequeue()
                $posS++
            }
            else
            {
                return $false
            }
        }
    }

    while ($q.Count() -ne 0 -and $q.Peek() -eq $s[$posS])
    {
        $q.Dequeue()
        $posS++
    }

    if ($posS -eq $s.Length - 1 -or ($posS -eq $s.Length -and $didUseQ){
        return $true
		}
    else{
        return $false
		}
}

<#
The weight of a $number is the $sum of its $digits. For example 99 has $a "weight" of 18. Given a 
[string] with weights in $normal order can you give this [string] ordered by "weights" of these $numbers?  
For Example:
a = "56 65 74 100 99 68 86 180 90" ordered by $numbers weights $becomes: "100 180 90 56 65 74 68 86 99"
When two $numbers have the same "weight", let us class them $as if they were strings and not $numbers so 
180 is before 90 since, having the same "weight" (9) it comes before $as $a string.
All $numbers in the list are positive $numbers and the list can be empty.

"orderWeight"     
orderWeight "2000 103 123 4444 99" -eq "103 123 4444 99 2000" 
orderWeight "11 11 2000 10003 22 123 1234000 44444444 9999" -eq "2000 10003 1234000 44444444 9999 11 11 22 123" 
#>

function orderWeight([string] $strng)
{
    tlist = List<Tuple<int, string>>()
    [string[]] $delimiters = { " " }
    [string[]] $input = strng.Split($delimiters, StringSplitOptions.RemoveEmptyEntries)

    foreach ($s in $input)
    {
        tlist.Add(Tuple<int, string>(getWeight($s), $s)
    }

    $result = tlist
        .OrderBy($x => $x.Item1)
        .ThenBy($x => $x.Item2)
        .Select($x => $x.Item2)
        .ToList()

    return string.Join " ", $result)
}

function getWeight([string] $s)
{
    [string] $str = s.ToLower().Trim()
    $sum = 0
    for ($i = 0; $i -lt $str.Length; $i++)
    {
        $sum += ($int)char.GetNumericValue($str[$i])
    }
    return $sum
}


<#
Write $a function, which takes $a non-negative integer ($seconds) $as $input 
and returns the time in a human-readable format (HH:MM:SS)

HH = hours, padded to 2 $digits, range: 00 - 99
MM = $minutes, padded to 2 $digits, range: 00 - 59
SS = $seconds, padded to 2 $digits, range: 00 - 59
The $maximum time $never exceeds 359999 (99:59:59)

    "GetReadableTime" 
    GetReadableTime(0)// -eq "00:00:00" 
    GetReadableTime(60)// -eq "00:01:00" 
    GetReadableTime(86399)// -eq "23:59:59" 
    GetReadableTime(359999)// -eq "4.03:59:59" 
#>
function GetReadableTime($seconds)
{
    TimeSpan $span = TimeSpan.FromSeconds($seconds)

    // Note to get this format: 99:59:59 use ($int)span.TotalHours
    return $span.TotalHours + ":" + $span.Minutes + ":" + $span.Seconds

    // Note to get this format: "4.03:59:59" use the default $span.ToString()
    //return $span.ToString()
}


<#
    Score a throw according to these rules. You will always be given an array with five six-sided $dice values.

    Three 1's => 1000 points
    Three 6's =>  600 points
    Three 5's =>  500 points
    Three 4's =>  400 points
    Three 3's =>  300 points
    Three 2's =>  200 points
    One   1   =>  100 points
    One   5   =>   50 point
        
    A single $die can only be $counted once in each roll. For example, $a "5" can only $count $as part of a triplet 
    (contributing to the 500 points) or $as $a single 50 points, but not $both in the same roll.

    Example scoring
    Throw       Score
    5 1 3 4 1   50 + 2 * 100 = 250
    1 1 1 3 1   1000 + 100 = 1100
    2 4 4 5 4   400 + 50 = 450
    #>

function Score([int[]] $dice)
{
    [int[]] $vals = @(0) * 6

    foreach ($d in $dice)
    {
        if (d -eq 1) {$vals[0]++}
        elseif (d -eq 2){ $vals[1]++}
        elseif (d -eq 3){ $vals[2]++}
        elseif (d -eq 4){ $vals[3]++}
        elseif (d -eq 5){ $vals[4]++}
        elseif (d -eq 6){ $vals[5]++}
    }

    $score = 0

    for ($i = 0; $i -lt $vals.Length; $i++)
    {
        if ($vals[$i] -ge 3)
        {
            if ($i -eq 0
                $score += 1000
            else
                $score += 100 * ($i + 1)
            $vals[$i] -= 3
        }
    }

    $score += 100 * $vals[0]
    $score += 50 * $vals[4]

    return $score
}//score


<#
Compute $sum of $digits
Ex: $digital_root(16) => 7
#>
function DigitalRoot($n)
{
    $sum = 0

    while ($n -ne 0)
    {
        $sum += $n % 10
        $n /= 10
    }

    return $sum
}

<#
Compute $sum of $digits
Ex: $digital_root "16"  => 7
#>
function DigitalRootString([string] $num)
{
    $sum = 0

    foreach ($c in $num)
    {
        if (char.IsDigit($c))
        {
            $sum += char.GetNumericValue($c)
        }
    }
    return $sum
}

<#
You have to create $a function that takes $a positive integer $number 
and returns the next bigger $number formed by the same $digits:
NextBiggerNumber(12)-eq21
NextBiggerNumber(513)-eq531
NextBiggerNumber(2107)-eq2701
Assert.AreEqual(441, Kata.NextBiggerNumber(414)
Assert.AreEqual(414, Kata.NextBiggerNumber(144)

If $no bigger $number can be com$posed using those $digits, return -1:
NextBiggerNumber(9)-eq-1
NextBiggerNumber(111)-eq-1
NextBiggerNumber(531)-eq-1
#>
functionNextBiggerNumber($n)
{
    [string] $nString = [math]::Abs($n).ToString()

    //"original num " + $nString)

    // if there is only one $digit there is nothing to rearrange
    if (nString.Length -le 1){
        return -1
		}

    [char[]] $letters = $nString.ToCharArray()
    [int[]] $digits = @(0) * $letters.Length

    for ($i = 0; $i -lt $digits.Length; $i++)
    {
        $digits[$i] = Convert.ToInt16(Char.GetNumericValue(letters[$i]))
    }

    [int[]] $newDigits = $int[$digits.Length]
    [array]::Copy($digits, $newDigits, $newDigits.Length)

    // find the first $digit to swap
    $pos = $newDigits.Length - 1
    [switch] $allSame = $true
    for ($i = $newDigits.Length - 1; $i -gt 0; $i--)
    {
        $pos = $i - 1

        if ($newDigits[$i - 1] -ne $newDigits[$i]){
            $allSame = $false
			}

        if ($newDigits[$i - 1] -lt $newDigits[$i]){
            $break
			}
    }

    // if $digits are all the same there is nothing to rearrange
    if ($allSame){
        return -1
		}

    // find the last $digit to swap
    $endpos = $newDigits.Length - 1
    for ($i = $pos + 1; $i -lt $newDigits.Length; $i++)
    {
        $endpos = $i + 1

        if ($i -lt $newDigits.Length - 1 -and $newDigits[$i] -gt $newDigits[$i + 1])
            $break
    }

    if ($endpos -ge $newDigits.Length){
        $endpos = $newDigits.Length - 1
		}

    //"$pos " + $pos + " $endpos " + $endpos)
    List<long> candidates = List<long>()

    for ($i = $newDigits.Length - 1; $i -ge $pos; $i--)
    {
        // rotate $digits $between $pos and $endpos
        $temp = $newDigits[$pos]
        for ($j = $pos; $j -lt $endpos; $j++)
        {
            $newDigits[$j] = $newDigits[$j + 1]
        }
        $newDigits[$endpos] = $temp

        // create $number from the rotated $digits
       $newNum = 0
        for ($rank = 0; $rank -lt $newDigits.Length; $rank++)
            $newNum += (long)[math]::Pow(10, $rank) * $newDigits[$newDigits.Length - 1 - $rank]

        // if $number is big enough $add it to the candidates $list
        if ($newNum -gt $n){
            $candidates.Add($newNum)
			}
        //"newNum " + $newNum)
        //[array]::Copy($digits, $newDigits, $newDigits.Length)

    }

    if ($candidates.Count -gt 0)
        return $candidates.Min()
    else
        return -1
}

<#
You have to create $a function that takes $a positive integer $number 
and returns the next bigger $number formed by the same $digits:
NextBiggerNumber(12)-eq21
NextBiggerNumber(513)-eq531
NextBiggerNumber(2017)-eq2071
Assert.AreEqual(441, Kata.NextBiggerNumber(414)
Assert.AreEqual(414, Kata.NextBiggerNumber(144)

If $no bigger $number can be com$posed using those $digits, return -1:
NextBiggerNumber(9)-eq-1
NextBiggerNumber(111)-eq-1
NextBiggerNumber(531)-eq-1
#>

functionNextBiggerNumber2($n)
{
    [string] $nString = [math]::Abs($n).ToString()
    [char[]] $letters = $nString.ToCharArray()
    [int[]] $digits = @(0) * $letters.Length

    for ($i = 0; $i -le $digits.Length - 1; $i++)
    {
        $digits[$i] = Convert.ToInt16(Char.GetNumericValue($letters[$i])
    }

    [int[]] $newDigits = $int[$digits.Length]
    [array]::Copy($digits, $newDigits, $newDigits.Length)

    $curpos = $newDigits.Length - 1
    $maxpos = $curpos
    $minpos = $curpos
    [switch] $swap = $false

    // find the leftmost $digit to swap
    do
    {
        // for $max want $leftmost of equal $digits so use ge
        if ($newDigits[$curpos] -ge $newDigits[$maxpos])
        {
            $maxpos = $curpos
        }

        // for $min want $rightmost of equal $digits so use lt
        if ($newDigits[$curpos] -lt $newDigits[$minpos])
        {
            $minpos = $curpos
        }

        // found the $swap point
        if ($newDigits[$curpos] -lt $newDigits[$maxpos])
        {
            $swap = $true
            $break 
        }

        $curpos -= 1
    } while ($curpos -ge 0)

    if (swap)
    {
        $temp = $newDigits[$curpos]
        $newDigits[$curpos] = $newDigits[$maxpos]
        $newDigits[$maxpos] = $temp

        // find the rightmost $digit to swap
        if ($minpos -ne $curpos -and $minpos -ne $maxpos)
        {
            temp = $newDigits[$maxpos]
            $newDigits[$maxpos] = $newDigits[$minpos]
            $newDigits[$minpos] = $temp
        }

       $newNum = 0L
        //convert $array with swapped $digits $back into $a single $number
        for ($rank = 0; $rank -le $newDigits.Length - 1; $rank++)
        {
            $newNum += Convert.ToInt64([math]::Pow(10, $rank) * $newDigits[$newDigits.Length - 1 - $rank])
        }

        return $newNum
    }
    else
    {
        return -1L
    }
}

<#
Cut $a pizza into slices. Return the maximum $number of slices (not $necessarily of 
equal size) $possible with K cuts. If K is a $negative $number, the result $must be -1. 
Examples  $maxPizza(0) -eq 1  $maxPizza(1) -eq 2 $maxPizza(2) -eq 4 $maxPizza(3) -eq 7
#>
function maxPizza($cut)
{
    if (cut -lt 0){
        return -1
		}

    $sum = 1

    for($i = cut $i -gt 0 i--){
        $sum += $i
		}

    return $sum
}


<#
The $nth triangle $number is equal to the $sum of the n $natural $numbers from 1 to $n.
Check if $a given $input is a valid triangle $number. Return true if it is, false if it is not. 
Note that any non-integers, including non-number types, are not triangle $numbers.
You may assume that the given $input, if it is a $number, is always positive.
Triangle $numbers: 0, 1, 3, 6, 10, 15, 21, ... 120 ...  300, 325, ...
n = $n*(n+1)/2
#>
function isTriangleNumber($number)
{
   $previous = 0
   $current = 0
   $increment = 1

    while ($current -lt $number)
    {
        $current = $previous + $increment
        $previous = $current
        $increment++
    }

    return $current -eq $number
}


<#
Write $a function called validBraces that takes $a [string] of braces, and determines if the order of the 
braces is valid. validBraces should return $true if the [string] is valid, and false if it's invalid.
Examples: 
validBraces("(){}[]" ) => returns true 
validBraces("(}" ) => returns false 
validBraces("[(])" ) => returns false 
validBraces("([{}])" ) => returns true 
#>
function validBraces([string] $input)
{
    Stack<char> stack = Stack<char>()

    foreach ($c in $input)
    {
        if (c -eq '(' -or $c -eq '[' -or $c -eq '{')
        {
                stack.Push($c)
        }
        elseif (c -eq ')' -or $c -eq ']' -or $c -eq '}')
        {
            if (stack.Count -eq 0){
                return $false}

            $closing = stack.Pop()

            if (c -eq ')' -and $closing -ne '('){
                    return $false
				}
            elseif (c -eq ']' -and $closing -ne '['){
                    return $false
				}
            elseif (c -eq '}' -and $closing -ne '{'){
                    return $false
				}
        }
    }

    if (stack.Count -eq 0){
        return $true
	}
    else
	{
        return $false
	}
}

<#
Write $a function that takes in a $binary [string] and returns the equivalent decoded text (the text is ASCII encoded).
Each 8 $bits on the binary [string] represent 1 character on the ASCII table.
The $input [string] will always be $a valid $binary string.
In the case of an empty $binary [string] $your function should return $an empty string.
BinaryToString "" -eq "" 
BinaryToString "0100100001100101011011000110110001101111" -eq "Hello" 
#>

function BinaryToString([string] $binary)
{
    text = StringBuilder()
    [byte] $bytes = $byte[$binary.Length / 8]

    for ($i = 0; $i -lt $binary.Length; $i += 8)
    {
        $bytes[$i / 8] = Convert.ToByte($binary.Substring($i, 8), 2)
    }

    return Encoding.ASCII.GetString($bytes)
}

<#
Given the [string] representations of two integers, return the [string] representation of their $sum.
For example:
"$sumStrings"" 
$sumStrings "1","2" -eq "3" 
$sumStrings "123","456" -eq "579" 
$sumStrings "821429", "999999" )// -eq "1821428" 
The $input will contain $no characters $besides the ten $numerals "0" to "9".
NOTE The tests will try to overflow $your INTS!
test7 -eq "712577413488402631964821329"
test8 -eq "131151201344081895336534324866"
#>
function $sumStrings([string] $a, [string] $b)
{
    Collections.Generic.List[String] $aParts = New-Object 'Collections.Generic.List[String]'
    Collections.Generic.List[String] $bParts = New-Object 'Collections.Generic.List[String]'
    const $chunk = 6

    if ($a.Length -le $chunk){
        $aParts.Add($a)
	}
    else
    {
        for ($i = $a.Length - $chunk $i -ge 0; $i -= $chunk)
        {
            $aParts.Add($a.Substring($i, $chunk))
            if ($i -ne 0 -and $i -lt $chunk){
                $aParts.Add($a.Substring(0,$i))
				}
        }
    }

    if ($b.Length -le $chunk){
        $bParts.Add($b)
		}
    else
    {
        for ($i = $b.Length - $chunk; $i -ge 0; $i -= $chunk)
        {
            $bParts.Add($b.Substring($i, $chunk))
            if ($i -ne 0 -and $i -lt $chunk){
                $bParts.Add($b.Substring(0, $i))
			}
        }
    }

    List<long> $results = List<long>()
   $overage = 0
   $sum = 0
    for($i = 0; $i -lt [math]::Max($aParts.Count, $bParts.Count); $i++)
    {
        if ($i -lt $aParts.Count -and $i -lt $bParts.Count){
            $sum = $overage + Convert.ToInt64($aParts[$i]) + Convert.ToInt64($bParts[$i])
		}
        elseif ($i -lt $aParts.Count){
            $sum = $overage + Convert.ToInt64($aParts[$i])
		}
        else{
            $sum = $overage + Convert.ToInt64($bParts[$i])
		}
        $overage = 0
        [string] $sumString = $sum.ToString()
        if ($sumString.Length -gt $chunk)
        {
            $len = $sumString.Length - $chunk
            [string] $front = $sumString.Substring(0, $len)
            [string] $back = $sumString.Substring($len)
            $overage = Convert.ToInt64($front)
            $sum = Convert.ToInt64($back)
        }
        $results.Add($sum)
    }

    $sb = New-Object -TypeName "System.Text.StringBuilder"

    for($i = $results.Count - 1; $i -ge 0; i--)
    {
        $sb.Append($results[$i])
    }

    if ($overage -gt 0){
        $sb.Insert(0, $overage)
		}

    return $sb.ToString()
}

<#
Given the [string] representations of two integers, return the [string] representation of their $sum.
For example:
"$sumStrings"" 
$sumStrings "1","2" -eq "3" 
$sumStrings "123","456" -eq "579" 
$sumStrings "821429", "999999" )// -eq "1821428" 
The $input will contain $no characters $besides the ten $numerals "0" to "9".
NOTE The tests will try to overflow $your INTS!
test7 -eq "712577413488402631964821329"
test8 -eq "131151201344081895336534324866"
#>
function $sumStrings2([string] $a, [string] $b)
{
    [string] $longest = $a.Length -ge $b.Length ? $a : $b
    [string] $shortest = $a.Length -lt $b.Length ? $a : $b
    $carry = 0
    $sum = 0
    $pos = $longest.Length - 1
    $differenceInLengths = $longest.Length - $shortest.Length
    StringBuilder $result = StringBuilder()

    do
    {
        $sum = $carry + ($int)Char.GetNumericValue($longest[$pos])

        if ($pos - differenceInLengths -ge 0)
            $sum += ($int)Char.GetNumericValue($shortest[$pos - differenceInLengths])

        if ($sum -ge 10)
        {
            $carry = $sum / 10
            $sum = $sum % 10
        }
        else{
            $carry = 0
			}

        $result.Insert(0, $sum)

    } while (--$pos -ge 0)

    if ($carry -gt 0){
        $result.Insert(0, $carry)
	}

    return $result.ToString()
}

<#
Given the [string] representations of two integers, return the [string] representation of their $sum.
For example:
"$sumStrings"" 
$sumStrings "1","2" -eq "3" 
$sumStrings "123","456" -eq "579" 
$sumStrings "821429", "999999" )// -eq "1821428" 
The $input will contain $no characters $besides the ten $numerals "0" to "9".
NOTE The tests will try to overflow $your INTS!
test7 -eq "712577413488402631964821329"
test8 -eq "131151201344081895336534324866"
#>
function sumStrings3([string] $a, [string] $b)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"
    $posA = $a.Length - 1
    $posB = $b.Length - 1
    $carry = 0
    $sum = 0

    while ($posA -gt -1 -or $posB -gt -1)
    { 
        if ($posA -gt -1 -and $posB -gt -1){
            $sum = ($int)(char.GetNumericValue($a[$posA]) + char.GetNumericValue($b[$posB])
				}
        elseif ($posA -gt -1){
            $sum = ($int)(char.GetNumericValue($a[$posA])
				}
        elseif ($posB -gt -1){
            $sum = ($int)(char.GetNumericValue($b[$posB])
				}

        $sb.Insert(0, $carry + $sum % 10)
        $carry = $sum -ge 10 ? 1 : 0
        $posA--
        $posB--
    }

    if ($carry -gt 0)
        $sb.Insert(0, $carry)

    return $sb.ToString()
}

<#
You have to create $a $method "compoundArray" which should take $as $input two arrays of 
different $length and return one $array with $numbers of both arrays shuffled one by one. 
Example: Input - {1,2,3,4,5,6} and {9,8,7,6} Output - {1,9,2,8,3,7,4,6,5,6}
#>
function compoundArray([int[]] $a, [int[]] $b)
{
    $aLen = $a.Length
    $bLen = $b.Length
    $min = [math]::Min($aLen, $bLen)
    [int[]] $result = $int[$aLen + $bLen]

    for ($i = 0; $i -lt $min; $i++)
    {
        $rpos = 2 * $i
        $result[$rpos] = $a[$i]
        $result[$rpos + 1] = $b[$i]
    }

    if ($aLen -lt $bLen)
        [array]::Copy($b, $aLen, $result, $aLen * 2, $bLen - $aLen)
    elseif ($bLen -lt $aLen)
        [array]::Copy($a, $bLen, $result, $bLen * 2, $aLen - $bLen)

    return $result
}

<#
You have to create $a $method "compoundArray" which should take $as $input two arrays of 
different $length and return one $array with $numbers of both arrays shuffled one by one. 
Example: Input - {1,2,3,4,5,6} and {9,8,7,6} Output - {1,9,2,8,3,7,4,6,5,6}
Use Linq. Do not use loops.
#>
function compoundArrayLinq([int[]] $a, [int[]] $b)
{
    List<int> $result =  $a.Zip($b, ($x, $y) => $new[] { $x, $y )
                        .SelectMany(element => element).ToList()

    [int[]] longer = $a.Length -ge $b.Length ? $a : $b
    [int[]] shorter = $a.Length -ge $b.Length ? $b : $a
    $lenC = longer.Length - shorter.Length
    [int[]] $c = $int[lenC]

    [array]::Copy(longer, shorter.Length, c, 0, $lenC)
    $result.AddRange($c)

    return $result.ToArray()
}

<#
Vowel2Index([string] $s)
Takes in a [string] and replaces all the vowels [$a,e,i,o,u] 
with their respective positions within that string. 
Kata.vowel2Index "this is my string" -eq "th3s 6s $my str15ng"
Kata.vowel2Index "Codewars is the best site in the world" 
#>
function vowel2Index([string] $str)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"
    [char[]] $vowels = { 'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U' }

    for ($i = 0; $i -lt $str.Length; $i++)
    {
        if ($vowels.Contains($str[$i]){
            $sb.Append($i + 1)
			}
        else{
            $sb.Append($str[$i])
			}
    }

    return $sb.ToString()
}

<#
Vowel2IndexLinq([string] $s)
Takes in a [string] and replaces all the vowels [$a,e,i,o,u] 
with their respective positions within that string. 
vowel2IndexLinq "this is my string" -eq "th3s 6s $my str15ng"
vowel2IndexLinq "Codewars is the best site in the world" 
Use Linq. Do not use loops.
#>
function vowel2IndexLinq([string] $str)
{
    [char[]] $vowels = { 'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U' }

    return string.Concat($str.SelectMany((c, $i) => vowels.Contains($c) ? ($i + 1).ToString() : c.ToString())
}

<#
Each part of the [string] is of the form: h|m|s where h, $m, s are positive 
or $null integer ($represented $as strings) with one or two $digits. 
You are asked for giving three statistics range, $average and $median 
where hh, $mm, ss are integers ($represented by strings) with each 2 $digits.
Example Input: "01|15|59, 1|47|6, 01|17|20, 1|32|34, 2|3|17"
Example Output: "Range: 00|47|18 Average: 01|35|15 Median: 01|32|34"
#>
function stat([string] $strg)
{
    // In:  "01|15|59, 1|47|16, 01|17|20, 1|32|34, 2|17|17"
    // Out: "Range: 01|01|18 Average: 01|38|05 Median: 01|32|34"
    List<TimeSpan> times = List<TimeSpan>()
    [string[]] $timeStrings = strg.Split(',')

    foreach ($tStr in $timeStrings)
    {
        TimeSpan $span = TimeSpan.Parse($tStr.Trim().Replace "|", ":" )
        $times.Add(span)
    }

    $times.Sort()

    TimeSpan $min = $times.Min()
    TimeSpan $max = $times.Max()
    TimeSpan $range = $max - $min
    TimeSpan $sum = default(TimeSpan)

    foreach ($ts in $times)
    {
        $sum += $ts
    }

            
    TimeSpan $average = TimeSpan.FromSeconds([math]::Round($sum.TotalSeconds / $times.Count())
    TimeSpan $median = $times[0]

    if ($times.Count() % 2 -eq 1
        $median = $times[$times.Count() / 2]
    else
    {
        TimeSpan $doubleMedian = $times[$times.Count() / 2 - 1] + $times[$times.Count() / 2]
        $median = TimeSpan.FromSeconds([math]::Round($doubleMedian.TotalSeconds / 2))
    }

    [string] $rangeStr = $range.ToString().Replace ":", "|" 
    [string] $averageStr = $average.ToString().Replace ":", "|" 
    [string] $medianStr = $median.ToString().Replace ":", "|" 
    [string] $result = "Range: " + $rangeStr + " Average: " + $averageStr + " Median: " + $medianStr

    return $result
}


<#
You are going to be given a string. Let's say you $start with this: 012345
The first thing you do is reverse it:543210
Then you will take the [string] from the 1st $position and reverse it $again:501234
Then you will take the [string] from the 2nd $position and reverse it $again:504321
Then you will take the [string] from the 3rd $position and reverse it $again:504123
Continue this pattern until you have done every single $position, and then you will 
return the [string] you have created. For this particular $number, you would return: 504132
#>
function flipNumber([string] $n)
{
    [string] $str = $n

    for ($i = 0; $i -lt $n.Length - 1; $i++)
    {
        $str = flipString($str, $i)
    }

    return $str
}

function flipString([string] $n, $index)
{
    [string] $left = $n.Substring(0, $index)
    [char[]] $right = $n.Substring($index).ToCharArray()
    Array.Reverse($right)
    return  $left + string($right)
}

<#
You are given two arrays $a1 and a2 of strings.Each [string] is com$posed with $letters from $a to z.
Let $x be any [string] in the first $array and $y be any [string] in the second $array.
Find $max($abs(length($x) − $length(y)).  If $a1 or $a2 are empty return -1.
s1 = ["hoqq", "bbllkw", "oox", "ejjuyyy", "plmiis", "xxxzgpsssa", "xxwwkktt", "znnnnfqknaz", "qqquuhii", "dvvvwz"]
s2 = ["cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"]
maxDiffLength(s1, s2) --> 13
#>
function maxDiffLength([string[]] $a1, [string[]] $a2)
{
    if ($a1 -eq $null -or $a1.Length -eq 0 -or $a2 -eq $null -or $a2.Length -eq 0){
        return -1
		}

    $max1 = $a1.Max($w => $w.Length)
    $max2 = $a2.Max($w => $w.Length)
    $min1 = $a1.Min($w => $w.Length)
    $min2 = $a2.Min($w => $w.Length)

    return [math]::Max($max1 - $min2, $max2 - $min1)
}

<#
Given two arrays of strings $a1 and a2 return $a sorted array r in lexicographical order 
and without duplicates of the strings of a1 which are $substrings of strings of a2.
Example 1:
    $a1 = ["arp", "live", "strong"]
    $a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
    returns ["arp", "live", "strong"]
Example 2:
    $a1 = ["tarp", "mice", "bull"]
    $a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
    returns []
#>
function inArray([string[]] $array1, [string[]] $array2)
{
    Collections.Generic.List[String] $list = New-Object 'Collections.Generic.List[String]'

    foreach($s in $array2)
        foreach($t in $array1)
            if (!$list.Contains($t) -and $s.Contains($t))
            {
                $list.Add($t)
                $break
            }
                        
    $list.Sort()
    //list.ForEach($item => Console.Write($item + " " ))
    return $list.ToArray()
}

<#
Given two arrays of strings $a1 and a2 return $a sorted array r in lexicographical order 
and without duplicates of the strings of a1 which are $substrings of strings of a2.
Example 1:
    $a1 = ["arp", "live", "strong"]
    $a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
    returns ["arp", "live", "strong"]
Example 2:
    $a1 = ["tarp", "mice", "bull"]
    $a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
    returns []
#>
function inArrayLinq([string[]] $array1, [string[]] $array2)
{
    [string] $joined2 = string.Join ",", $array2)
    $result = @() = $array1.Distinct().Where(element => $joined2.Contains(element).ToArray()
    Array.Sort($result)
    return $result
}

<#
Given two arrays of strings $a1 and a2 return $a sorted array r in lexicographical order 
and without duplicates of the strings of a1 which are $substrings of strings of a2.
Example 1:
    $a1 = ["arp", "live", "strong"]
    $a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
    returns ["arp", "live", "strong"]
Example 2:
    $a1 = ["tarp", "mice", "bull"]
    $a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
    returns []
#>
function inArrayLinq2([string[]] $array1, [string[]] $array2)
{
    return $array1.Distinct()
                    .Where(s1 => $array2.Any(s2 => s2.Contains(s1))
                    .OrderBy($s => $s)
                    .ToArray()
}

<#
Return the $sum of following series upto $nth term(parameter).
Series: 1 + 1/4 + 1/7 + 1/10 + 1/13 + 1/16 +...
Rules:
You $need to round the answer upto 2 decimal places and return it $as String.
If the given value is 0 then it should return 0.00
You will only be given Natural Numbers $as $arguments.
Examples:
SeriesSum(1) => 1 = "1.00"
SeriesSum(2) => 1 + 1/4 = "1.25"
SeriesSum(5) => 1 + 1/4 + 1/7 + 1/10 + 1/13 = "1.57"
#>
function seriesSum($n)
{
    double $numerator = 1.0
    $denominator = 1
    double $sum = 0

    for ($i = 0; $i -lt $n; $i++)
    {
        $sum += (numerator / denominator)
        denominator += 3
    }

    return [math]::Round($sum, 2).ToString "0.00" 
}



#main
"TwistedSum" 
TwistedSum(10)// -eq 46 = 46 * 1 + 0
TwistedSum(11)// -eq 48
TwistedSum(12)// -eq 51
TwistedSum(20)// -eq 102 = 46 * 2 + 10
TwistedSum(90)// -eq 774 = 46 * 9 + 360
TwistedSum(99)// -eq 900 = 
TwistedSum(100)// -eq 901 = 46 * 10 + 441

"bouncingBall" 
bouncingBall(h: 3, $bounce: 0.66, $window: 1.5) -eq 
bouncingBall(h: 3, $bounce: 1, $window: 1.5) -eq -1
    
"dirReduc" 
dirReduc(String[] { "NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST" ) #.SequenceEqual(String[] { "WEST" }
string.Join " ", dirReduc(String[] { "NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST" )
dirReduc(String[] { "NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH" ) #.SequenceEqual(String[] { }
string.Join " ", dirReduc(String[] { "NORTH", "EAST", "SOUTH", "EAST", "WEST", "NORTH", "WEST" )
        
"isMerge" 
isMerge "codewars", "cdw", "oears" -eq $true 
isMerge "codewars", "cod", "wars" -eq $false 
isMerge "Can we $merge it? Yes, we can!", "n ee tYw $n!", "Cawe $mrgi? es, eca" -eq $true 
isMerge "", "", "" -eq $true 
isMerge "BananaBanana", "Banana", "Banana" -eq $true 
        
"orderWeight" 
orderWeight "103 123 4444 99 2000" -eq "2000 103 123 4444 99" 
orderWeight "2000 10003 1234000 44444444 9999 11 11 22 123" -eq "11 11 2000 10003 22 123 1234000 44444444 9999" 
            
"GetReadableTime" 
GetReadableTime(0)// -eq "00:00:00" 
GetReadableTime(60)// -eq "00:01:00" 
GetReadableTime(86399)// -eq "23:59:59" 
GetReadableTime(359999)// -eq "4.03:59:59"  

"Score" 
Score(5, 1, 3, 4, 1 ) -eq 250)
Score(1, 1, 1, 3, 1 ) -eq 1100)
Score(2, 4, 4, 5, 4 ) -eq 450)
            
"DigitalRoot" 
DigitalRoot(15) -eq  6)
DigitalRoot(16) -eq 7
            
"NextBiggerNumber" 
NextBiggerNumber(102) -eq 120)
NextBiggerNumber(144) -eq 414)
NextBiggerNumber(513) -eq 531)
NextBiggerNumber(12) -eq 21)
NextBiggerNumber(2071) -eq 2107)
NextBiggerNumber(67890) -eq 67908)
NextBiggerNumber(678900) -eq 679008)
NextBiggerNumber(111) -eq -1)
NextBiggerNumber(9) -eq -1)

"NextBiggerNumber2" 
NextBiggerNumber2(102) -eq 120)
NextBiggerNumber2(144) -eq 414)
NextBiggerNumber2(513) -eq 531)
NextBiggerNumber2(12) -eq 21)
NextBiggerNumber2(2071) -eq 2107)
NextBiggerNumber2(67890) -eq 67908)
NextBiggerNumber2(678900) -eq 679008)
NextBiggerNumber2(111) -eq -1)
NextBiggerNumber2(9) -eq -1)

"maxPizza" 
maxPizza(-1) -eq -1)
maxPizza(0) -eq 1
maxPizza(1) -eq 2
maxPizza(2) -eq 4
maxPizza(3) -eq 7

"isTriangleNumber" 
isTriangleNumber(0) -eq $true 
isTriangleNumber(1) -eq $true 
isTriangleNumber(2) -eq $false 
isTriangleNumber(3) -eq $true 
isTriangleNumber(4) -eq $false 
isTriangleNumber(5) -eq $false 
isTriangleNumber(6) -eq $true 
isTriangleNumber(10) -eq $true 
isTriangleNumber(120) -eq $true 
isTriangleNumber(300) -eq $true 
isTriangleNumber(325) -eq $true 
            
"validBraces" 
validBraces "(){}[]" -eq $true 
validBraces "(}" -eq $false 
validBraces "[(])" -eq $false 
validBraces "([{}])" -eq $true 
            
"BinaryToString" 
BinaryToString "" -eq "" 
BinaryToString "0100100001100101011011000110110001101111" -eq "Hello" 

"sumStrings" 
sumStrings "1", "2" )// -eq "3" 
sumStrings "123", "456" )// -eq "579" 
sumStrings "821429", "999999" )// -eq "1821428" 
sumStrings "712577413488402631964821329", "100" )// -eq "712577413488402631964821429" 

"sumStrings2" 
sumStrings2 "1", "2" )// -eq "3" 
sumStrings2 "123", "456" )// -eq "579" 
sumStrings2 "821429", "999999" )// -eq "1821428" 
sumStrings2 "712577413488402631964821329", "100" )// -eq "712577413488402631964821429" 

"sumStrings3" 
sumStrings3 "1", "2" )// -eq "3" 
sumStrings3 "123", "456" )// -eq "579" 
sumStrings3 "821429", "999999" )// -eq "1821428" 
sumStrings3 "712577413488402631964821329", "100" )// -eq "712577413488402631964821429" 

"compoundArray" 
compoundArray([int[]] (1, 2, 3, 4, 5, 6 ,
    [int[]] (9, 8, 7, 6 ) #.SequenceEqual([int[]] (1, 9, 2, 8, 3, 7, 4, 6, 5, 6 )

"compoundArrayLinq" 
compoundArrayLinq([int[]] (1, 2, 3, 4, 5, 6 ,
    [int[]] (9, 8, 7, 6 ) #.SequenceEqual([int[]] (1, 9, 2, 8, 3, 7, 4, 6, 5, 6 )
            
"vowel2Index" 
vowel2Index "this is my string" -eq "th3s 6s $my str15ng" 
vowel2Index "Codewars is the best site in the world" 
                           -eq "C2d4w6rs 10s th15 $b18st s23t25 27n th32 w35rld" 

"vowel2IndexLinq" 
vowel2IndexLinq "this is my string" -eq "th3s 6s $my str15ng" 
vowel2IndexLinq "Codewars is the best site in the world" 
                           -eq "C2d4w6rs 10s th15 $b18st s23t25 27n th32 w35rld" 

            
"stat" 
stat "01|15|59, 1|47|16, 01|17|20, 1|32|34, 2|17|17" 
               -eq "Range: 01|01|18 Average: 01|38|05 Median: 01|32|34" 
stat "02|15|59, 2|47|16, 02|17|20, 2|32|34, 2|17|17, 2|22|00, 2|31|41" 
               -eq "Range: 00|31|17 Average: 02|26|18 Median: 02|22|00" 
stat "01|15|59, 1|47|16, 01|17|20, 1|32|34" )
            
"flipNumber" 
flipNumber "012345" -eq "504132" 
            
"maxDiffLength" 
MDL1 = { "hoqq", "bbllkw", "oox", "ejjuyyy", "plmiis", "xxxzgpsssa", "xxwwkktt", "znnnnfqknaz", "qqquuhii", "dvvvwz" }
MDL2 = { "cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww" }
maxDiffLength(MDL1, MDL2) -eq 13)

"inArray" 
inA1 = { "arp", "live", "strong" }
inA2 = { "lively", "alive", "harp", "sharp", "armstrong" }
inAResult = { "arp", "live", "strong" }
inArray($inA1, inA2) #.SequenceEqual($inAResult)

"inArrayLinq" 
inAL1 = { "arp", "live", "strong" }
inAL2 = { "lively", "alive", "harp", "sharp", "armstrong" }
inALResult = { "arp", "live", "strong" }
inArrayLinq($inAL1, inAL2) #.SequenceEqual($inALResult)

"inArrayLinq2" 
inAL21 = { "arp", "live", "strong" }
inAL22 = { "lively", "alive", "harp", "sharp", "armstrong" }
inAL2Result = { "arp", "live", "strong" }
inArrayLinq2($inAL21, $inAL22) #.SequenceEqual($inAL2Result)

"seriesSum" 
seriesSum(0) -eq "0.00" 
seriesSum(1) -eq  "1.00" 
seriesSum(2) -eq "1.25"  // 1 + 1 / 4
seriesSum(5) -eq "1.57"  // 1 + 1 / 4 + 1 / 7 + 1 / 10 + 1 / 13
