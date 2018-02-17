#
# Script.ps1
#

			
<#
The parameter weekday is true if it is a weekday, and the parameter vacation 
is true if we are on vacation. We sleep in if it is not $a weekday or we're on 
vacation. Return $true if we sleep in. 

sleepIn($false, $false  → $true
sleepIn($true, $false  → $false
sleepIn($false, $true  → $true
#>
function sleepIn([switch] $w, [switch] $v)
{
    $v -or -not $w
}

<#
We have two $monkeys, $a and $b, and the parameters $aSmile and $bSmile indicate 
if each is smiling. We are in trouble if they are $both smiling or if $neither 
of them is smiling. Return $true if we are in trouble. 

monkeyTrouble($true, $true  → $true
monkeyTrouble($false, $false  → $true
monkeyTrouble($true, $false  → $false
#>
function monkeyTrouble([switch] $aSmile, [switch] $bSmile)
{
    $aSmile -eq $bSmile
}

<#
Given two $values, return their $sum. Unless the two $values are the same, 
then return double their $sum. 

$sumDouble(1, 2) → 3
$sumDouble(3, 2) → 5
$sumDouble(2, 2) → 8
#>
function $sumDouble($a, $b)
{
    if ($a -eq $b){ return 2 * ($a + $b) }
    else{ return $a + $b }
}

<#
Given 2 $values, return whichever value is nearest to the value 10, or 
return 0 in the event of a tie. 

close10(8, 13) → 8
close10(13, 8) → 8
close10(13, 7) → 0
#>
function close10($a, $b)
{
    $a10 = [math]::Abs($a - 10)
    $b10 = [math]::Abs($b - 10)

    if ($a10 -lt $b10) { return $a }
    elseif ($b10 -lt $a10) { return $b }
	else { return 0 }
}

<#
Return $true if the given [string] contains $between $min and $max 'c' chars. 

stringC "Hello", 'e', 1, 3) → $true
stringC "Everyone", 'e', 1, 3) → $true
stringC "Heelele", 'e', 1, 3) → $false
#>
function stringC([string] $str, [char] $c, $min, $max)
{
	[string] $input = $str.Trim().ToLower()
	[char] $target = [char]::ToLower($c)
    $count = 0

    foreach ($ch in $str){
	    if ($ch -eq $c){
			$count++
		}
	}

    $count -ge $min -and $count -le $max
}

<#
Given two non-negative $values, return $true if they have the same last $digit, 
such as with 27 and 57. 

lastDigit(7, 17) → $true
lastDigit(6, 17) → $false
lastDigit(3, 113) → $true
#>
function lastDigit($a, $b)
{
    $a % 10 -eq $b % 10
}

<#
Given a [string], return $a [string] where the last 'num' $chars are 
now in upper case. if the [string] has less than 'num' chars, 
uppercase whatever is there. 

endUp "Hello", 3) → "HeLLO"
endUp "hi there", 3) → "hi thERE"
endUp "hi", 3) → "HI"
#>
function endUp([string] $str, $num)
{
    if ($num -le 0){return $str}
    elseif ($str.Length -gt $num)
    {
        [string] $front = $str.Substring(0, $str.Length - $num)
        [string] $back = $str.Substring($str.Length - $num)
        return $front + $back.ToUpper()
    }
    else { return $str.ToUpper() }               
}

<#
Given a non-empty [string] and an $N, return the [string] made starting 
with [char] 0, and then every Nth [char] of the [string]. 
So if N is 3, use [char] 0, 3, 6, ... and so on. N is 1 or more. 

everyNth "Miracle", 2) → "Mrce"
everyNth "abcdefg", 2) → "aceg"
everyNth "abcdefg", 3) → "adg"
#>
function everyNth([string] $str, $n)
{
    $sb = New-Object -TypeName "System.Text.StringBuilder"
    $i = 0

    foreach ($ch in $str.GetEnumerator()){
		if ($i % 2 -eq 0){
			[void]$sb.append($ch)
		}
		$i++
	}

	$sb.ToString()
}

#main
"sleepIn"
sleepIn $false $false -eq $true
sleepIn $true $false -eq $false
sleepIn $false $true -eq $true
	
"monkeyTrouble"
monkeyTrouble $true  $true -eq $true
monkeyTrouble $false $false -eq $true
monkeyTrouble $true $false -eq $false
	
"$sumDouble"
$sumDouble 1 2 #-eq 3
$sumDouble 3 2 #-eq 5
$sumDouble 2 2 #-eq 8
	
"close10" 
close10 8 13 #-eq 8 
close10 13 8 #-eq 8 
close10 13 7 #-eq 0 

"stringC" 
stringC "Hello" 'e' 1 3 -eq $true 
stringC "Everyone" 'e' 1 3 -eq $true 
stringC "Heelele" 'e' 1 3 -eq $false 

"lastDigit" 
lastDigit 7 17 -eq $true 
lastDigit 6 17 -eq $false 
lastDigit 3 113 -eq $true 

"endUp" 
endUp "Hello" 3 #-eq "HeLLO" 
endUp "hi there" 3 #-eq "hi thERE" 
endUp "hi" 3 #-eq "HI" 

"everyNth" 
everyNth "Miracle" 2 #-eq "Mrce"
everyNth "abcdefg" 2 #-eq "aceg" 
everyNth "abcdefg" 3 #-eq "adg" 
	
